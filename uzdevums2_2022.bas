Sub uzd1()
 For i = 3 To 9
  a = Cells(i, "B").Value
  b = Cells(i, "C").Value
  c = Cells(i, "D").Value
  d = Cells(i, "E").Value
  e = a + b + c + d
  Cells(i, "G").Value = e
 Next i
End Sub

Sub uzd2()
 For i = 3 To 9
  If Cells(i, "G") > 150 Then
   Cells(i, "G").Font.Color = vbGreen
  End If
 Next i
End Sub

Sub uzd3()
 For i = 3 To 9
  For j = 8 To 11
   If Cells(i, j - 6).Value > 40 Then
    Cells(i, j).Value = "IR"
    Cells(i, j).Interior.Color = vbGreen
    Else: Cells(i, j).Value = "NE"
    Cells(i, j).Interior.Color = vbRed
   End If
  Next j
 Next i
End Sub

Sub uzd4()
 For i = 3 To 9
  l = Cells(i, "F").Value
  For j = 12 To 15
   Cells(i, j).Value = Cells(i, j - 10).Value * l
   If Cells(i, j - 4).Value = "IR" Then
    Cells(i, j) = Cells(i, j).Value + ((Cells(i, j - 10).Value - 40) * l * 1.5)
   End If
  Next j
 Next i
End Sub

Sub uzd5()
 For i = 3 To 9
  s = 0
  For j = 12 To 15
   s = s + Cells(i, j)
  Next j
  Cells(i, 16).Font.Bold = True
  Cells(i, 16).Font.Color = vbRed
  If s <> 0 Then
   Cells(i, 16).Value = s
  Else: Cells(i, 16).Value = "---"
  End If
 Next i
End Sub
