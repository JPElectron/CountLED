VERSION 5.00
Object = "{648A5603-2C6E-101B-82B6-000000000014}#1.1#0"; "MSCOMM32.OCX"
Begin VB.Form Form1 
   Caption         =   "DNSRLED"
   ClientHeight    =   855
   ClientLeft      =   60
   ClientTop       =   450
   ClientWidth     =   2055
   Icon            =   "dnsrled.frx":0000
   LinkTopic       =   "Form1"
   ScaleHeight     =   855
   ScaleWidth      =   2055
   StartUpPosition =   3  'Windows Default
   Begin MSCommLib.MSComm Comm 
      Left            =   120
      Top             =   120
      _ExtentX        =   1005
      _ExtentY        =   1005
      _Version        =   393216
      DTREnable       =   -1  'True
      BaudRate        =   2400
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
