using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace MyNotepad
{
    public partial class formNotepad : Form
    {
        bool b = false;
        bool s = true;
        public formNotepad()
        {
            InitializeComponent();
        }

        private void tsmiFile_Click(object sender, EventArgs e)
        {

        }

        private void rtxtNotepad_TextChanged(object sender, EventArgs e)
        {
            // 文本被修改后，设置s为false，表示文件未保存
            s = false;
        }

        private void tsmiNew_Click(object sender, EventArgs e)
        {
            // 判断当前文件是否从磁盘打开，或者新建时文档不为空，并且文件未被保存
            if (b == true || rtxtNotepad.Text.Trim() != "")
            {
                // 若文件未保存
                if (s == false)
                {
                    string result;
                    result = MessageBox.Show("文件尚未保存,是否保存?",
                        "保存文件", MessageBoxButtons.YesNoCancel).ToString();
                    switch (result)
                    {
                        case "Yes":
                            // 若文件是从磁盘打开的
                            if (b == true)
                            {
                                // 按文件打开的路径保存文件
                                rtxtNotepad.SaveFile(odlgNotepad.FileName);
                            }
                            // 若文件不是从磁盘打开的
                            else if (sdlgNotepad.ShowDialog() == DialogResult.OK)
                            {
                                rtxtNotepad.SaveFile(sdlgNotepad.FileName);
                            }
                            s = true;
                            rtxtNotepad.Text = "";
                            break;
                        case "No":
                            b = false;
                            rtxtNotepad.Text = "";
                            break;
                    }
                }
            }

        }

        private void tsmiOpen_Click(object sender, EventArgs e)
        {
            if (b == true || rtxtNotepad.Text.Trim() != "")
            {
                if (s == false)
                {
                    string result;
                    result = MessageBox.Show("文件尚未保存,是否保存?",
                        "保存文件", MessageBoxButtons.YesNoCancel).ToString();
                    switch (result)
                    {
                        case "Yes":
                            if (b == true)
                            {
                                rtxtNotepad.SaveFile(odlgNotepad.FileName);
                            }
                            else if (sdlgNotepad.ShowDialog() == DialogResult.OK)
                            {
                                rtxtNotepad.SaveFile(sdlgNotepad.FileName);
                            }
                            s = true;
                            break;
                        case "No":
                            b = false;
                            rtxtNotepad.Text = "";
                            break;
                    }
                }
            }
            odlgNotepad.RestoreDirectory = true;
            if ((odlgNotepad.ShowDialog() == DialogResult.OK) && odlgNotepad.FileName != "")
            {
                rtxtNotepad.LoadFile(odlgNotepad.FileName);//打开代码语句
                b = true;
            }
            s = true;

        }

        private void tsmiSave_Click(object sender, EventArgs e)
        {
            // 若文件从磁盘打开并且修改了其内容
            if (b == true && rtxtNotepad.Modified == true)
            {
                rtxtNotepad.SaveFile(odlgNotepad.FileName);
                s = true;
            }
            else if (b == false && rtxtNotepad.Text.Trim() != "" &&
                sdlgNotepad.ShowDialog() == DialogResult.OK)
            {
                rtxtNotepad.SaveFile(sdlgNotepad.FileName);//保存语句
                s = true;
                b = true;
                odlgNotepad.FileName = sdlgNotepad.FileName;
            }

        }

        private void tsmiSaveAs_Click(object sender, EventArgs e)
        {
            if (sdlgNotepad.ShowDialog() == DialogResult.OK)
            {
                rtxtNotepad.SaveFile(sdlgNotepad.FileName);
                s = true;
            }

        }

        private void tsmiClose_Click(object sender, EventArgs e)
        {
            Application.Exit();//程序结束
        }

        private void tsmiUndo_Click(object sender, EventArgs e)
        {
            rtxtNotepad.Undo();//撤销
        }

        private void tsmiCopy_Click(object sender, EventArgs e)
        {
            rtxtNotepad.Copy();//复制
        }

        private void tsmiCut_Click(object sender, EventArgs e)
        {
            rtxtNotepad.Cut();//剪切
        }

        private void tsmiPaste_Click(object sender, EventArgs e)
        {
            rtxtNotepad.Paste();//粘贴
        }

        private void tsmiSelectAll_Click(object sender, EventArgs e)
        {
            rtxtNotepad.SelectAll();//全选
        }

        private void tsmiDate_Click(object sender, EventArgs e)
        {
            rtxtNotepad.AppendText(System.DateTime.Now.ToString());//显示当前日期
        }

        private void tsmiAuto_Click(object sender, EventArgs e)
        {
            if (tsmiAuto.Checked == false)
            {
                tsmiAuto.Checked = true;            // 选中该菜单项
                rtxtNotepad.WordWrap = true;        // 设置为自动换行
            }
            else
            {
                tsmiAuto.Checked = false;
                rtxtNotepad.WordWrap = false;
            }

        }

        private void tsmiFont_Click(object sender, EventArgs e)
        {
            fdlgNotepad.ShowColor = true;
            if (fdlgNotepad.ShowDialog() == DialogResult.OK)
            {
                rtxtNotepad.SelectionColor = fdlgNotepad.Color;
                rtxtNotepad.SelectionFont = fdlgNotepad.Font;
            }

        }
    }
}
