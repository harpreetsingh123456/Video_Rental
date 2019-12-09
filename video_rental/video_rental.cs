using System;
using System.Data;
using System.Windows.Forms;

namespace video_rental
{
    public partial class video_rental : Form
    {
        database_operation f = new database_operation();
        public video_rental()
        {
            InitializeComponent();
        }

        private void addmoview_button_Click(object sender, EventArgs e)
        {
            f.Add_movi(rating_text.Text, title_text.Text, year_text.Text, copies_text.Text, plot_text.Text, genre_text.Text);
            MessageBox.Show("Movie Added");
            DataTable h = f.MoviData();
            movie_Grid.DataSource = h;

        }

        private void delete_button_Click(object sender, EventArgs e)
        {
            bool result = f.Delete_movi(Convert.ToInt16(moveid_text.Text));

            if (result == true)
            {
                MessageBox.Show("Movie deleted");
            }
            else
            {
                MessageBox.Show("Movie rented by customer so not deleted");
            }
            DataTable h = f.MoviData();
            movie_Grid.DataSource = h;
        }

        private void update_button_Click(object sender, EventArgs e)
        {
            f.Update_movi(Convert.ToInt16(moveid_text.Text), rating_text.Text, title_text.Text, year_text.Text, copies_text.Text, plot_text.Text, genre_text.Text);
            MessageBox.Show("Movie updated");
            DataTable h = f.MoviData();
            movie_Grid.DataSource = h;
        }

        private void issue_button_Click(object sender, EventArgs e)
        {
            f.Issue_Movi(Convert.ToInt16(movieid_text.Text), Convert.ToInt16(Custid_text.Text), Convert.ToDateTime(rentdate_text.Text), 1);
            MessageBox.Show("Movie issues");
            DataTable g = f.RentData();
            rentalGrid.DataSource = g;
        }

        private void return_button_Click(object sender, EventArgs e)
        {
            f.Return_Movi(Convert.ToInt16(RMID_text.Text), Convert.ToInt16(movieid_text.Text), Convert.ToDateTime(rentdate_text.Text), Convert.ToDateTime(returndate_text.Text), 1);
            MessageBox.Show("Book Returned");
            DataTable g = f.RentData();
            rentalGrid.DataSource = g;


        }

        private void Form1_Load(object sender, EventArgs e)
        {
            DataTable g = f.RentData();
            rentalGrid.DataSource = g;
            DataTable h = f.MoviData();
            movie_Grid.DataSource = h;
            DataTable h1 = f.CustData();
            customer_Grid.DataSource = h1;
        }

        private void rentedout__CheckedChanged(object sender, EventArgs e)
        {
            DataTable g = f.RentoutData();
            rentalGrid.DataSource = g;
        }

        private void allrent_radio_CheckedChanged(object sender, EventArgs e)
        {
            DataTable g = f.RentData();
            rentalGrid.DataSource = g;
        }

        private void movie_Grid_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            try
            {
                if (e.RowIndex >= 0)//check the rowindex
                {
                    DataGridViewRow row = this.movie_Grid.Rows[e.RowIndex];//pick the row index
                    moveid_text.Text = row.Cells[0].Value.ToString();//will get the vale for moveid
                    rating_text.Text = row.Cells[1].Value.ToString();//will get the vale for rating
                    title_text.Text = row.Cells[2].Value.ToString();//will get the vale for title
                    year_text.Text = row.Cells[3].Value.ToString();//will get the vale for year
                    rentalcost_text.Text = row.Cells[4].Value.ToString();//will get the vale for rental cost
                    copies_text.Text = row.Cells[5].Value.ToString();//will get the vale for copies
                    plot_text.Text = row.Cells[6].Value.ToString();//will get the vale for plot
                    genre_text.Text = row.Cells[7].Value.ToString();//will get the vale for genre


                }
            }
            catch (Exception e1)
            {
            }
        }

        private void rentalGrid_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            if (e.RowIndex >= 0)
            {
                DataGridViewRow row = this.rentalGrid.Rows[e.RowIndex];

                RMID_text.Text = row.Cells[0].Value.ToString();

                movieid_text.Text = row.Cells[1].Value.ToString();//setting the movie text
                Custid_text.Text = row.Cells[2].Value.ToString();//setting the customerid
                rentdate_text.Text = row.Cells[3].Value.ToString();//setting the rent date
                returndate_text.Text = row.Cells[4].Value.ToString();//setting return date


            }
        }

        private void customer_Grid_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            if (e.RowIndex >= 0)
            {
                DataGridViewRow row = this.customer_Grid.Rows[e.RowIndex];//setting the index
                textBox1.Text = row.Cells[0].Value.ToString();//setting custid

                fname_text.Text = row.Cells[1].Value.ToString();//setting fname
                lname_text.Text = row.Cells[2].Value.ToString();//setting lname
                address_text.Text = row.Cells[3].Value.ToString();//setting address
                phone_text.Text = row.Cells[4].Value.ToString();//setting phone


            }
        }

        private void addcustomer_button_Click(object sender, EventArgs e)
        {
            f.Add_cust(fname_text.Text, lname_text.Text, address_text.Text, phone_text.Text);
            MessageBox.Show("Customer Added");
            DataTable h1 = f.CustData();
            customer_Grid.DataSource = h1;
        }

        private void button2_Click(object sender, EventArgs e)
        {
            f.Update_cust(Convert.ToInt16(textBox1.Text), fname_text.Text, lname_text.Text, address_text.Text, Convert.ToInt32(phone_text.Text));
            MessageBox.Show("Customer Updated");
            DataTable h1 = f.CustData();
            customer_Grid.DataSource = h1;
        }



        private void Top_buy_Click_1(object sender, EventArgs e)
        {

            String str = f.Top_Movie();
            MessageBox.Show(str);
        }

        private void Best_buy_Click(object sender, EventArgs e)
        {
            String str = f.Best_Buyer();
            MessageBox.Show(str);
        }

        private void DeleteCust_Click(object sender, EventArgs e)
        {
            bool result = f.Delete_cust(Convert.ToInt16(textBox1.Text));
            if (result == true)
            {
                MessageBox.Show("Customer deleted");
            }
            else
            {
                MessageBox.Show("Customer rented a movie so not deleted");
            }
            DataTable h1 = f.CustData();
            customer_Grid.DataSource = h1;
        }
    }
}
