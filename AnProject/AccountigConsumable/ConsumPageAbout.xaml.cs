using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;
using System.Data.Entity;
using Word = Microsoft.Office.Interop.Word;

namespace AccountigConsumable
{
    /// <summary>
    /// Логика взаимодействия для ConsumPageAbout.xaml
    /// </summary>
    public partial class ConsumPageAbout : Page
    {
        List<OrderedMaterial> tbd = new List<OrderedMaterial>();
        List<Manufacturer> ManufacturerLst = new List<Manufacturer>();
        public ConsumPageAbout()
        {
            InitializeComponent();
            ManufacturerLst = AccountingForConsumablesEntities.GetContext().Manufacturer.ToList();
            ManufacturerLst.Insert(0, new Manufacturer { ManufacturerName = "All" });
            ManufacturerCmb.ItemsSource = ManufacturerLst;
            var name1 = AccountingForConsumablesEntities.GetContext().OrderedMaterial.Distinct().ToList();
            var name = AccountingForConsumablesEntities.GetContext().OrderedMaterial.Select(s => s.MaterialCard.id).Distinct().ToArray();

            for (int i = 0; i < name.Count(); i++)
            {
                int stdasd = name[i];
                int tbs = AccountingForConsumablesEntities.GetContext().OrderedMaterial.Where(w => w.FK_MaterialCard == stdasd).Sum(s => s.OrderedQuantity);
                OrderedMaterial tasd = name1.Where(s => s.FK_MaterialCard == stdasd).FirstOrDefault();
                OrderedMaterial card = new OrderedMaterial() { FK_MaterialCard = tasd.FK_MaterialCard, MaterialCard = tasd.MaterialCard, counter = tbs, Order = tasd.Order };
                tbd.Add(card);
            }
            DGridConsumable.ItemsSource = tbd;


        }
        private void NameTxt_TextChanged(object sender, TextChangedEventArgs e)
        {
            var name1 = AccountingForConsumablesEntities.GetContext().OrderedMaterial.Distinct().ToList();
            var name = AccountingForConsumablesEntities.GetContext().OrderedMaterial.Select(s => s.MaterialCard.id).Distinct().ToArray();

            for (int i = 0; i < name.Count(); i++)
            {
                int stdasd = name[i];
                int tbs = AccountingForConsumablesEntities.GetContext().OrderedMaterial.Where(w => w.FK_MaterialCard == stdasd).Sum(s => s.OrderedQuantity);
                OrderedMaterial tasd = name1.Where(s => s.FK_MaterialCard == stdasd).FirstOrDefault();
                OrderedMaterial card = new OrderedMaterial() { FK_MaterialCard = tasd.FK_MaterialCard, MaterialCard = tasd.MaterialCard, counter = tbs, Order = tasd.Order };
                tbd.Add(card);
            }
            if (NameTxt.Text == "")
            {
                DGridConsumable.ItemsSource = tbd.ToList();
            }
            else if (ManufacturerCmb.SelectedIndex == 0)
            {
                DGridConsumable.ItemsSource = tbd.Where(w => w.MaterialCard.Materials.MaterialName.StartsWith(NameTxt.Text)).ToList();
            }
            else
            {
                DGridConsumable.ItemsSource = tbd.Where(w => w.MaterialCard.Materials.MaterialName.StartsWith(NameTxt.Text) && w.MaterialCard.Materials.Manufacturer.ManufacturerName == ManufacturerCmb.Text).ToList();
            }
        }

        private void Manufacturer_DropDownClosed(object sender, EventArgs e)
        {
            var name1 = AccountingForConsumablesEntities.GetContext().OrderedMaterial.Distinct().ToList();
            var name = AccountingForConsumablesEntities.GetContext().OrderedMaterial.Select(s => s.MaterialCard.id).Distinct().ToArray();

            for (int i = 0; i < name.Count(); i++)
            {
                int stdasd = name[i];
                int tbs = AccountingForConsumablesEntities.GetContext().OrderedMaterial.Where(w => w.FK_MaterialCard == stdasd).Sum(s => s.OrderedQuantity);
                OrderedMaterial tasd = name1.Where(s => s.FK_MaterialCard == stdasd).FirstOrDefault();
                OrderedMaterial card = new OrderedMaterial() { FK_MaterialCard = tasd.FK_MaterialCard, MaterialCard = tasd.MaterialCard, counter = tbs, FK_Order = 1 };
                tbd.Add(card);
            }
            if (ManufacturerCmb.SelectedIndex == 0)
            {
                DGridConsumable.ItemsSource = tbd;
            }
            else if (NameTxt.Text == "")
            {
                DGridConsumable.ItemsSource = tbd.
                    Where(w => w.MaterialCard.Materials.Manufacturer.ManufacturerName == ManufacturerCmb.Text).ToList();
            }
            else
            {
                DGridConsumable.ItemsSource = tbd.Where(w => w.MaterialCard.Materials.MaterialName.StartsWith(NameTxt.Text) && w.MaterialCard.Materials.Manufacturer.ManufacturerName == ManufacturerCmb.Text).ToList();
            }
        }
        private void BtnDel_Click(object sender, RoutedEventArgs e)
        {
            var EquipmentForRemoving = DGridConsumable.SelectedItems.Cast<MaterialCard>().ToList();
            if (MessageBox.Show($"Вы точно хотите удалить следующие {EquipmentForRemoving.Count} элементов?", "Внимание",
                MessageBoxButton.YesNo, MessageBoxImage.Question) == MessageBoxResult.Yes)
            {
                try
                {
                    AccountingForConsumablesEntities.GetContext().MaterialCard.RemoveRange(EquipmentForRemoving);
                    AccountingForConsumablesEntities.GetContext().SaveChanges();
                    MessageBox.Show("Данные удалены");
                    DGridConsumable.ItemsSource = AccountingForConsumablesEntities.GetContext().MaterialCard.ToList();
                }
                catch (Exception ex)
                {
                    MessageBox.Show(ex.Message.ToString());

                }
            }
        }

        private void BtnAdd_Click(object sender, RoutedEventArgs e)
        {
            ManagerOfFrame.MainFrame.Navigate(new ConsumablePageWorkWithData(null));
        }

        private void BtnEdit_Click(object sender, RoutedEventArgs e)
        {
           // ManagerOfFrame.MainFrame.Navigate(new ConsumablePageWorkWithData((sender as Button).DataContext as OrderedMaterial));
        }

        private void Page_IsVisibleChanged(object sender, DependencyPropertyChangedEventArgs e)
        {
            if (Visibility == Visibility.Visible)
            {
                AccountingForConsumablesEntities.GetContext().ChangeTracker.Entries().ToList().ForEach(p => p.Reload());
                DGridConsumable.ItemsSource = AccountingForConsumablesEntities.GetContext().MaterialCard.ToList();
            }
        }
       

        private void ReplaceWordStub(string stubToReplace, string text, Word.Document wordDocument)
        {
            var range = wordDocument.Content;
            range.Find.ClearFormatting();
            range.Find.Execute(FindText: stubToReplace, ReplaceWith: text);

        }

        private void BtxExport_Copy_Click(object sender, RoutedEventArgs e)
        {
            var wordApp = new Microsoft.Office.Interop.Word.Application();
            var wordDocument = wordApp.Documents.Open(@"G:\G;chromesaves\FileIfCorrect.docx");

            wordDocument.ExportAsFixedFormat(@"G:\G;chromesaves\FileIfCorrect.pdf", Microsoft.Office.Interop.Word.WdExportFormat.wdExportFormatPDF);

            wordDocument.Close(Microsoft.Office.Interop.Word.WdSaveOptions.wdDoNotSaveChanges,
                               Microsoft.Office.Interop.Word.WdOriginalFormat.wdOriginalDocumentFormat,
                               false); //Close document

            wordApp.Quit();
        }
        private void BtnConsumable_Click(object sender, RoutedEventArgs e)
        {
            ManagerOfFrame.MainFrame.Navigate(new ConsumablePage());
        }

        private void BtnIssue_Click(object sender, RoutedEventArgs e)
        {
            ManagerOfFrame.MainFrame.Navigate(new ConsumPageAbout());
        }

        private void BtnIssue_Click_1(object sender, RoutedEventArgs e)
        {
            ManagerOfFrame.MainFrame.Navigate(new ConsumableIssue());
        }
    }
}
