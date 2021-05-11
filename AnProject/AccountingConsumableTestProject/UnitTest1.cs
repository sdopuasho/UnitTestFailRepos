using System;
using System.Reflection;
using System.Windows;
using System.Windows.Controls;
using AccountigConsumable;
using Microsoft.VisualStudio.TestTools.UnitTesting;

namespace AccountingConsumableTestProject
{
    [TestClass]
    public class AccountingConsumableTest
    {      
        [TestInitialize()]
        public void init()
        {
         //   < ResourceDictionary >
         //   < ResourceDictionary.MergedDictionaries >
         //       < ResourceDictionary Source = "pack://application:,,,/AccountigConsumable;component/UIThemes/ThemeSimple.xaml" />
 
         //    </ ResourceDictionary.MergedDictionaries >
 
         //</ ResourceDictionary >
        }
        [TestMethod]
        public void WithSpecialSymbolLoginTest()
        {
            bool predict = true;
            string Login = "Abc#2";
            AuthorizationDataCheck AuData = new AuthorizationDataCheck();
            bool result = AuData.LoginCheck(Login);
            Assert.AreEqual(predict, result);
        }
        [TestMethod]
        public void WithoutSpecialSymbolLoginTest()
        {
            bool predict = false;
            string Login = "Abc312e";
            AuthorizationDataCheck AuData = new AuthorizationDataCheck();
            bool result = AuData.LoginCheck(Login);
            Assert.AreEqual(predict, result);
        }
        [TestMethod]
        public void MinLenghtLoginTest()
        {
            bool predict = false;
            string Login = "asd";
            AuthorizationDataCheck AuData = new AuthorizationDataCheck();
            bool result = AuData.LoginCheck(Login);
            Assert.AreEqual(predict, result);
        }
        [TestMethod]
        public void MaxLenghtLoginTest()
        {
            bool predict = false;
            string Login = "aW2faBasdasdhAScXzTasdaQWasTRVh@t$dasdasdasdasd";
            AuthorizationDataCheck AuData = new AuthorizationDataCheck();
            bool result = AuData.LoginCheck(Login);
            Assert.AreEqual(predict, result);
        }
        [TestMethod]
        public void LoginWithUpperText()
        {
            bool predict = true;
            string Login = "Abc#2";
            AuthorizationDataCheck AuData = new AuthorizationDataCheck();
            bool result = AuData.LoginCheck(Login);
            Assert.AreEqual(predict, result);
        }
        [TestMethod]
        public void LoginWithoutUpperText()
        {
            bool predict = false;
            string Login = "aw241gc$";
            AuthorizationDataCheck AuData = new AuthorizationDataCheck();
            bool result = AuData.LoginCheck(Login);
            Assert.AreEqual(predict, result);
        }
        [TestMethod]
        public void LoginWithLowerText()
        {
            bool predict = true;
            string Login = "Abc#2";
            AuthorizationDataCheck AuData = new AuthorizationDataCheck();
            bool result = AuData.LoginCheck(Login);
            Assert.AreEqual(predict, result);
        }
        [TestMethod]
        public void LoginWithoutLowerText()
        {
            bool predict = false;
            string Login = "AW241GC$";
            AuthorizationDataCheck AuData = new AuthorizationDataCheck();
            bool result = AuData.LoginCheck(Login);
            Assert.AreEqual(predict, result);
        }
        [TestMethod]
        public void LoginWithNumberText()
        {
            bool predict = true;
            string Login = "Abc#2";
            AuthorizationDataCheck AuData = new AuthorizationDataCheck();
            bool result = AuData.LoginCheck(Login);
            Assert.AreEqual(predict, result);
        }
        [TestMethod]
        public void LoginWithoutNumerText()
        {
            bool predict = false;
            string Login = "AWsbeGC$";
            AuthorizationDataCheck AuData = new AuthorizationDataCheck();
            bool result = AuData.LoginCheck(Login);
            Assert.AreEqual(predict, result);
        }
        [TestMethod]
        public void WithSpecialSymbolPasswordTest()
        {
            bool predict = true;
            string Password = "Abc#2";
            AuthorizationDataCheck AuData = new AuthorizationDataCheck();
            bool result = AuData.PasswordCheck(Password);
            Assert.AreEqual(predict, result);
        }
        [TestMethod]
        public void WithoutSpecialSymbolPasswordTest()
        {
            bool predict = false;
            string Password = "Abc312e";
            AuthorizationDataCheck AuData = new AuthorizationDataCheck();
            bool result = AuData.PasswordCheck(Password);
            Assert.AreEqual(predict, result);
        }
        [TestMethod]
        public void MinLenghtPasswordTest()
        {
            bool predict = false;
            string Password = "asd";
            AuthorizationDataCheck AuData = new AuthorizationDataCheck();
            bool result = AuData.PasswordCheck(Password);
            Assert.AreEqual(predict, result);
        }
        [TestMethod]
        public void MaxLenghtPasswordTest()
        {
            bool predict = false;
            string Password = "aW2faBasdasdhAScXzTasdaQWasTRVh@t$dasdasdasdasd";
            AuthorizationDataCheck AuData = new AuthorizationDataCheck();
            bool result = AuData.PasswordCheck(Password);
            Assert.AreEqual(predict, result);
        }
        [TestMethod]
        public void PasswordWithUpperText()
        {
            bool predict = true;
            string Password = "Abc#2";
            AuthorizationDataCheck AuData = new AuthorizationDataCheck();
            bool result = AuData.PasswordCheck(Password);
            Assert.AreEqual(predict, result);
        }
        [TestMethod]
        public void PasswordWithoutUpperText()
        {
            bool predict = false;
            string Password = "aw241gc$";
            AuthorizationDataCheck AuData = new AuthorizationDataCheck();
            bool result = AuData.PasswordCheck(Password);
            Assert.AreEqual(predict, result);
        }
        [TestMethod]
        public void PasswordWithLowerText()
        {
            bool predict = true;
            string Password = "Abc#2";
            AuthorizationDataCheck AuData = new AuthorizationDataCheck();
            bool result = AuData.PasswordCheck(Password);
            Assert.AreEqual(predict, result);
        }
        [TestMethod]
        public void PasswordWithoutLowerText()
        {
            bool predict = false;
            string Password = "AW241GC$";
            AuthorizationDataCheck AuData = new AuthorizationDataCheck();
            bool result = AuData.PasswordCheck(Password);
            Assert.AreEqual(predict, result);
        }
        [TestMethod]
        public void PasswordWithNumberText()
        {
            bool predict = true;
            string Login = "Abc#2";
            AuthorizationDataCheck AuData = new AuthorizationDataCheck();
            bool result = AuData.PasswordCheck(Login);
            Assert.AreEqual(predict, result);
        }
        [TestMethod]
        public void PasswordWithoutNumerText()
        {
            bool predict = false;
            string Password = "AWsbeGC$";
            AuthorizationDataCheck AuData = new AuthorizationDataCheck();
            bool result = AuData.PasswordCheck(Password);
            Assert.AreEqual(predict, result);
        }
        [TestMethod]
        public void Check()
        {
            AccountigConsumable.SenderMail.IntId = 1;
            NewInventPAge AuData = new NewInventPAge(null);
            bool predict = true;
            bool result = AuData.check();
            Assert.AreEqual(predict, result);
        }
    }
}
