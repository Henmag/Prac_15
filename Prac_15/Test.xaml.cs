using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Timers;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;
using System.Windows.Threading;

using System.ComponentModel;
using System.Threading;

namespace Prac_15
{
    /// <summary>
    /// Логика взаимодействия для Test.xaml
    /// </summary>
    public partial class Test : Window
    {
        public string NameUser;
        public int NumberTest;

        public string _NameTest;
        public int AllCountQuest;
        public int QuestCount = 0;
        public int CurrentAnswer = 0;
        List<List<string>> list = new List<List<string>>();

        public Test(string NameTest1, string NameUser, int Number)
        {
            InitializeComponent();

            this.NumberTest = Number;
            this.NameUser = NameUser;
            this._NameTest = NameTest1;
            TimerStart();
        }

        private void Window_Loaded(object sender, RoutedEventArgs e)
        {
            AllCountQuest = Sub.SumQuest(_NameTest);
            list = Sub.Questions(_NameTest);

            NextQuest();
        }
        public void NextQuest()
        {
            if (QuestCount < AllCountQuest)
            {
                NameTest.Content = _NameTest;
                NumberQuest.Content = $"Вопрос {list[QuestCount][0]} / {AllCountQuest}";
                Quest.Content = list[QuestCount][1];
                Answer1.Content = list[QuestCount][2];
                Answer2.Content = list[QuestCount][3];
                Answer3.Content = list[QuestCount][4];
            }
            else
            {
                TimeSpan Time = TimeSpan.FromMinutes(10).Subtract(counter);
                Result r = new Result(CurrentAnswer, AllCountQuest, NameUser, NumberTest, Time);
                r.Show();
                this.Close();
            }
        }

        private void Next_Click(object sender, RoutedEventArgs e)
        {
            if (list[QuestCount][5] == this.GroupRadio.Children.OfType<RadioButton>().FirstOrDefault(n => n.IsChecked.Value).Content.ToString())
                CurrentAnswer++;
            QuestCount++;
            NextQuest();
        }

        public TimeSpan counter =  TimeSpan.FromMinutes(10);
        private void TimerStart()
        {
            DispatcherTimer timer1 = new DispatcherTimer();
            timer1.Tick += new EventHandler(timer1_Tick);
            timer1.Interval = TimeSpan.FromSeconds(1); // 1 second
            timer1.Start();
            Timer.Content = counter.ToString();
        }

        private void timer1_Tick(object sender, EventArgs e)
        {
            counter = counter.Subtract(new TimeSpan(0,0,1));

            if (counter == TimeSpan.Zero)
            {
                MessageBox.Show("Время вышло, попробуйте заного!");
                StartTest st = new StartTest(NameUser);
                st.Show();
                this.Close();
            }
            Timer.Content= counter.ToString();
        }
    }
}
