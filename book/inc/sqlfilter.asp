<%
Function SafeRequest(ParaName,ParaType)
       '--- ������� ---
       'ParaName:��������-�ַ���
       'ParaType:��������-������(1��ʾ���ϲ��������֣�0��ʾ���ϲ���Ϊ�ַ�)

       Dim ParaValue
       ParaValue=Trim(Request(ParaName))
	   If ParaValue<>"" Then 
			If ParaType=1 then
				If not isNumeric(ParaValue) then
                     Response.write "����" & ParaName & "����Ϊ�����ͣ�"
                     Response.End
				End if
			 Else
              ParaValue=replace(ParaValue,"'","''")
			End if
		End If
       SafeRequest=ParaValue
End function
%>
