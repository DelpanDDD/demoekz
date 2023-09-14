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
using TourAgentstvo.classes;

namespace TourAgentstvo.pages
{
    /// <summary>
    /// Логика взаимодействия для Avtorizacia.xaml
    /// </summary>
    public partial class Avtorizacia : Page
    {
        public Avtorizacia()
        {
            InitializeComponent();

        }
        private void Vxod(object sender, RoutedEventArgs e)
        {
            if (login.Text == "root" && password.Text == "12345")
            {
                Manager.MainFrame.Navigate(new Admin());
            }
            if (login.Text == "user" && password.Text == "12345")
            {
                Manager.MainFrame.Navigate(new User());
            }
        }

        private void Checked(object sender, RoutedEventArgs e)
        {
            passwordBox.Visibility = Visibility.Collapsed;
            password.Visibility = Visibility.Visible;
            password.Text = passwordBox.Password;
        }

        private void Unchecked(object sender, RoutedEventArgs e)
        {
            passwordBox.Visibility = Visibility.Visible;
            password.Visibility = Visibility.Collapsed;
        }
    }
}
