﻿'------------------------------------------------------------------------------
' <auto-generated>
'     This code was generated by a tool.
'     Runtime Version:4.0.30319.42000
'
'     Changes to this file may cause incorrect behavior and will be lost if
'     the code is regenerated.
' </auto-generated>
'------------------------------------------------------------------------------

Option Strict On
Option Explicit On

Imports System

Namespace My.Resources
    
    'This class was auto-generated by the StronglyTypedResourceBuilder
    'class via a tool like ResGen or Visual Studio.
    'To add or remove a member, edit your .ResX file then rerun ResGen
    'with the /str option, or rebuild your VS project.
    '''<summary>
    '''  A strongly-typed resource class, for looking up localized strings, etc.
    '''</summary>
    <Global.System.CodeDom.Compiler.GeneratedCodeAttribute("System.Resources.Tools.StronglyTypedResourceBuilder", "4.0.0.0"),  _
     Global.System.Diagnostics.DebuggerNonUserCodeAttribute(),  _
     Global.System.Runtime.CompilerServices.CompilerGeneratedAttribute(),  _
     Global.Microsoft.VisualBasic.HideModuleNameAttribute()>  _
    Friend Module Resources
        
        Private resourceMan As Global.System.Resources.ResourceManager
        
        Private resourceCulture As Global.System.Globalization.CultureInfo
        
        '''<summary>
        '''  Returns the cached ResourceManager instance used by this class.
        '''</summary>
        <Global.System.ComponentModel.EditorBrowsableAttribute(Global.System.ComponentModel.EditorBrowsableState.Advanced)>  _
        Friend ReadOnly Property ResourceManager() As Global.System.Resources.ResourceManager
            Get
                If Object.ReferenceEquals(resourceMan, Nothing) Then
                    Dim temp As Global.System.Resources.ResourceManager = New Global.System.Resources.ResourceManager("eXperDB.Monitoring.Resources", GetType(Resources).Assembly)
                    resourceMan = temp
                End If
                Return resourceMan
            End Get
        End Property
        
        '''<summary>
        '''  Overrides the current thread's CurrentUICulture property for all
        '''  resource lookups using this strongly typed resource class.
        '''</summary>
        <Global.System.ComponentModel.EditorBrowsableAttribute(Global.System.ComponentModel.EditorBrowsableState.Advanced)>  _
        Friend Property Culture() As Global.System.Globalization.CultureInfo
            Get
                Return resourceCulture
            End Get
            Set
                resourceCulture = value
            End Set
        End Property
        
        '''<summary>
        '''  Looks up a localized resource of type System.Drawing.Bitmap.
        '''</summary>
        Friend ReadOnly Property alert_off() As System.Drawing.Bitmap
            Get
                Dim obj As Object = ResourceManager.GetObject("alert_off", resourceCulture)
                Return CType(obj,System.Drawing.Bitmap)
            End Get
        End Property
        
        '''<summary>
        '''  Looks up a localized resource of type System.Drawing.Bitmap.
        '''</summary>
        Friend ReadOnly Property alert_on() As System.Drawing.Bitmap
            Get
                Dim obj As Object = ResourceManager.GetObject("alert_on", resourceCulture)
                Return CType(obj,System.Drawing.Bitmap)
            End Get
        End Property
        
        '''<summary>
        '''  Looks up a localized resource of type System.Drawing.Bitmap.
        '''</summary>
        Friend ReadOnly Property eXperDBMonitoring() As System.Drawing.Bitmap
            Get
                Dim obj As Object = ResourceManager.GetObject("eXperDBMonitoring", resourceCulture)
                Return CType(obj,System.Drawing.Bitmap)
            End Get
        End Property
        
        '''<summary>
        '''  Looks up a localized resource of type System.Drawing.Bitmap.
        '''</summary>
        Friend ReadOnly Property lock_off() As System.Drawing.Bitmap
            Get
                Dim obj As Object = ResourceManager.GetObject("lock_off", resourceCulture)
                Return CType(obj,System.Drawing.Bitmap)
            End Get
        End Property
        
        '''<summary>
        '''  Looks up a localized resource of type System.Drawing.Bitmap.
        '''</summary>
        Friend ReadOnly Property lock_on() As System.Drawing.Bitmap
            Get
                Dim obj As Object = ResourceManager.GetObject("lock_on", resourceCulture)
                Return CType(obj,System.Drawing.Bitmap)
            End Get
        End Property
        
        '''<summary>
        '''  Looks up a localized resource of type System.Drawing.Bitmap.
        '''</summary>
        Friend ReadOnly Property power_hib() As System.Drawing.Bitmap
            Get
                Dim obj As Object = ResourceManager.GetObject("power_hib", resourceCulture)
                Return CType(obj, System.Drawing.Bitmap)
            End Get
        End Property

        '''<summary>
        '''  Looks up a localized resource of type System.Drawing.Bitmap.
        '''</summary>
        Friend ReadOnly Property power_sus() As System.Drawing.Bitmap
            Get
                Dim obj As Object = ResourceManager.GetObject("power_sus", resourceCulture)
                Return CType(obj, System.Drawing.Bitmap)
            End Get
        End Property

        '''<summary>
        '''  Looks up a localized string similar to &lt;?xml version=&quot;1.0&quot; encoding=&quot;utf-8&quot;?&gt;
        '''&lt;ROWS&gt;
        '''  &lt;ROW ID=&quot;CHECKPASSWORD&quot; PARAMS=&quot;2&quot;&gt;
        '''    &lt;DESC&gt;Check User Password&lt;/DESC&gt;
        '''    &lt;DATA&gt;
        '''      &lt;![CDATA[
        '''      SELECT COUNT(*) FROM TB_CONFIG WHERE ADMIN_USER_ID = &apos;{0}&apos; AND ADMIN_PASSWORD = &apos;{1}&apos;
        '''      ]]&gt;
        '''    &lt;/DATA&gt;
        '''  &lt;/ROW&gt;
        '''  &lt;ROW ID=&quot;GETDATABASELIST&quot; PARAMS=&quot;0&quot;&gt;
        '''    &lt;DESC&gt;Get Database List&lt;/DESC&gt;
        '''    &lt;DATA&gt;
        '''      &lt;![CDATA[
        '''      SELECT DATNAME FROM PG_DATABASE
        '''    ]]&gt;
        '''    &lt;/DATA&gt;
        '''  &lt;/ROW&gt;
        '''  &lt;ROW ID=&quot;GETSCHEMALIST&quot; PARAMS=&quot;0&quot;&gt;
        '''    &lt;DESC&gt;Get D [rest of string was truncated]&quot;;.
        '''</summary>
        Friend ReadOnly Property Querys() As String
            Get
                Return ResourceManager.GetString("Querys", resourceCulture)
            End Get
        End Property
        
        '''<summary>
        '''  Looks up a localized resource of type System.Drawing.Bitmap.
        '''</summary>
        Friend ReadOnly Property SplitBar_Collapse() As System.Drawing.Bitmap
            Get
                Dim obj As Object = ResourceManager.GetObject("SplitBar_Collapse", resourceCulture)
                Return CType(obj,System.Drawing.Bitmap)
            End Get
        End Property
        
        '''<summary>
        '''  Looks up a localized resource of type System.Drawing.Bitmap.
        '''</summary>
        Friend ReadOnly Property SplitBar_Expand() As System.Drawing.Bitmap
            Get
                Dim obj As Object = ResourceManager.GetObject("SplitBar_Expand", resourceCulture)
                Return CType(obj,System.Drawing.Bitmap)
            End Get
        End Property
    End Module
End Namespace
