// _lcid="2052" _version="11.0.5510"
// _localBinding
// Version: "11.0.5510"
// Copyright (c) Microsoft Corporation.  All rights reserved.
var L_ContainIllegalChar_Text   = "^1 \u5305\u542b\u975e\u6cd5\u5b57\u7b26\u201c^2\u201d\u3002"; 
var L_ContainIllegalString_Text = "^1 \u5305\u542b\u975e\u6cd5\u5b57\u7b26\u6216\u5b50\u5b57\u7b26\u4e32\u3002"; 
var LegalUrlChars = new Array
(
    false, false, false, false, false, false, false, false,     false, false, false, false, false, false, false, false, 
    false, false, false, false, false, false, false, false,     false, false, false, false, false, false, false, false, 
    true,  true, false, false, true, false,  false, true,      true,  true, false, true,  true,  true,  true,  true, 
    true,  true,  true,  true,  true,  true,  true,  true,      true,  true, false,  true, false,  true, false, false, 
    true,  true,  true,  true,  true,  true,  true,  true,      true,  true,  true,  true,  true,  true,  true,  true, 
    true,  true,  true,  true,  true,  true,  true,  true,      true,  true,  true, true, false, true,  true,  true, 
    true,  true,  true,  true,  true,  true,  true,  true,      true,  true,  true,  true,  true,  true,  true,  true, 
    true,  true,  true,  true,  true,  true,  true,  true,      true,  true,  true,  false, false, false, false, false
);
function AdmBuildParam(stPattern)
{
    var re;
    var i;
    for (i = 1; i < AdmBuildParam.arguments.length; i++)
        {
        re = new RegExp("\\^" + i);
        stPattern = stPattern.replace(re, AdmBuildParam.arguments[i]);
        }
    return stPattern;
}
function IndexOfIllegalCharInUrlLeafName(strLeafName)
{
    for(var i=0; i<strLeafName.length; i++)
    {
        var ch = strLeafName.charCodeAt(i);
        if(ch < 128 && ( strLeafName.charAt(i) == '/' || !LegalUrlChars[ch]) )
            return i;
    }
    return -1;
}
function IndexOfIllegalCharInUrlPath(strPath)
{
    for(var i=0; i<strPath.length; i++)
    {
        var ch = strPath.charCodeAt(i);
        if( ch < 128 && !LegalUrlChars[ch])
            return i;
    }
    return -1;
}
function UrlContainsIllegalStrings(strPath)
{
    if(strPath.indexOf("..") >=0 
        || strPath.indexOf("//") >=0
        || strPath.indexOf("./") >= 0
        || strPath.indexOf("/.") >=0
        || strPath.indexOf(".") == 0
        || strPath.lastIndexOf(".") == (strPath.length-1)
        )
    {
        return true;
    }
    return false;
}
function UrlLeafNameValidate(source, args)
{
    var strMessagePrefix = "";
    if( typeof(source.MessagePrefix) == "string" )
    {
        strMessagePrefix = source.MessagePrefix;
    }
    else
    {
        strMessagePrefix = source.id;
    }
    var i = IndexOfIllegalCharInUrlLeafName(args.Value);
    if( i >=0 )
    {
        if(typeof(source.errormessage) == "string")
        {
            source.errormessage = AdmBuildParam(L_ContainIllegalChar_Text, strMessagePrefix, args.Value.charAt(i));
        }
        args.IsValid = false;
    }
    else if( UrlContainsIllegalStrings(args.Value) )
    {
        if(typeof(source.errormessage) == "string" )
        {
            source.errormessage = AdmBuildParam(L_ContainIllegalString_Text, strMessagePrefix);
        }
        args.IsValid = false;
    }    
    else
    {
        args.IsValid = true;
    }
}
function UrlPathValidate(source, args)
{
    var strMessagePrefix = "";
    if( typeof(source.MessagePrefix) == "string" )
    {
        strMessagePrefix = source.MessagePrefix;
    }
    else
    {
        strMessagePrefix = source.id;
    }
    var i = IndexOfIllegalCharInUrlPath(args.Value);
    if( i >= 0)
    {
        if(typeof(source.errormessage) == "string")
        {        
            source.errormessage = AdmBuildParam(L_ContainIllegalChar_Text, strMessagePrefix, args.Value.charAt(i));
        }
        args.IsValid = false;
    }
    else if( UrlContainsIllegalStrings(args.Value) )
    {
        if(typeof(source.errormessage) == "string" )
        {
            source.errormessage = AdmBuildParam(L_ContainIllegalString_Text, strMessagePrefix);
        }
        args.IsValid = false;
    }    
    else
    {
        args.IsValid = true;
    }    
}
function IsCheckBoxListSelected(checkboxlist)
{
    if(checkboxlist == null )
        return false;
    var len = checkboxlist.length ;
    if (len == null) 
    {   
        return checkboxlist.checked;
    }
    else
    {
        for (var i=0; i < len ; i++)
        {
            if (checkboxlist[i].checked)
            {
                return true;
            }
        }
    }
    return false;
}
function STSValidatorEnable(val, bEnable, bSilent)
{
    var objVal = document.getElementById(val);
    if (objVal == null)
        return;
    if (bSilent == true)
    {
        objVal.enabled = (bEnable == true);
    }
    else
    {
        ValidatorEnable(objVal, bEnable);
    }
}
var L_Language_Text="2052";
var L_ClickOnce1_text    = "\u60a8\u5df2\u5c1d\u8bd5\u8fc7\u4fdd\u5b58\u6b64\u9879\u3002\u5982\u679c\u5c1d\u8bd5\u518d\u6b21\u4fdd\u5b58\u6b64\u9879\uff0c\u5219\u53ef\u80fd\u4f1a\u4ea7\u751f\u91cd\u590d\u4fe1\u606f\u3002\u662f\u5426\u518d\u6b21\u4fdd\u5b58\u6b64\u9879?";
var L_STSDelConfirm_Text  = "\u662f\u5426\u786e\u5b9e\u8981\u5220\u9664\u6b64\u9879\u76ee?";
var L_STSDelConfirm1_Text = "\u662f\u5426\u786e\u5b9e\u8981\u5220\u9664\u6b64\u6587\u4ef6\u5939\u53ca\u5176\u6240\u6709\u5185\u5bb9?";
var L_NewDocLibTb1_Text = "\u65e0\u6cd5\u521b\u5efa\u8be5\u6587\u6863\u3002\n\u53ef\u80fd\u662f\u6240\u9700\u7684\u5e94\u7528\u7a0b\u5e8f\u5b89\u88c5\u4e0d\u6b63\u786e\uff0c\u6216\u8005\u662f\u65e0\u6cd5\u6253\u5f00\u6b64\u6587\u6863\u5e93\u7684\u6a21\u677f\u3002\n\n\u8bf7\u5c1d\u8bd5\u4ee5\u4e0b\u64cd\u4f5c:\n1. \u68c0\u67e5\u6b64\u6587\u6863\u5e93\u5bf9\u4e8e\u8be5\u6a21\u677f\u540d\u7684\u201c\u5e38\u89c4\u8bbe\u7f6e\u201d\uff0c\u5e76\u5b89\u88c5\u6253\u5f00\u8be5\u6a21\u677f\u6240\u5fc5\u9700\u7684\u5e94\u7528\u7a0b\u5e8f\u3002\u5982\u679c\u8be5\u5e94\u7528\u7a0b\u5e8f\u8bbe\u7f6e\u4e3a\u5728\u9996\u6b21\u4f7f\u7528\u65f6\u5b89\u88c5\uff0c\u5219\u8fd0\u884c\u8be5\u5e94\u7528\u7a0b\u5e8f\uff0c\u7136\u540e\u518d\u5c1d\u8bd5\u65b0\u5efa\u6587\u6863\u3002\n\n2.  \u5982\u679c\u60a8\u5177\u6709\u4fee\u6539\u6b64\u6587\u6863\u5e93\u7684\u6743\u9650\uff0c\u5219\u8f6c\u5230\u8be5\u5e93\u7684\u201c\u5e38\u89c4\u8bbe\u7f6e\u201d\uff0c\u7136\u540e\u914d\u7f6e\u65b0\u6a21\u677f\u3002";
var L_NewDocLibTb2_Text = "\u201c\u65b0\u5efa\u6587\u6863\u201d\u9700\u8981\u4f7f\u7528\u4e0e Windows SharePoint Services \u517c\u5bb9\u7684\u5e94\u7528\u7a0b\u5e8f\u548c Microsoft Internet Explorer 5.0 \u6216\u66f4\u9ad8\u7248\u672c\u3002\u82e5\u8981\u5411\u6b64\u6587\u6863\u5e93\u6dfb\u52a0\u6587\u6863\uff0c\u8bf7\u5355\u51fb\u201c\u4e0a\u8f7d\u6587\u6863\u201d\u6309\u94ae\u3002";
var L_NewFormLibTb1_Text = "\u65e0\u6cd5\u521b\u5efa\u8be5\u8868\u5355\u3002\n\u53ef\u80fd\u662f\u6240\u9700\u7684\u5e94\u7528\u7a0b\u5e8f\u5b89\u88c5\u4e0d\u6b63\u786e\uff0c\u6216\u8005\u662f\u65e0\u6cd5\u6253\u5f00\u6b64\u8868\u5355\u5e93\u7684\u6a21\u677f\u3002\n\n\u8bf7\u5c1d\u8bd5\u4ee5\u4e0b\u64cd\u4f5c:\n1. \u68c0\u67e5\u6b64\u8868\u5355\u5e93\u5bf9\u4e8e\u8be5\u6a21\u677f\u540d\u7684\u201c\u5e38\u89c4\u8bbe\u7f6e\u201d\uff0c\u5e76\u5b89\u88c5\u6253\u5f00\u8be5\u6a21\u677f\u6240\u5fc5\u9700\u7684\u5e94\u7528\u7a0b\u5e8f\u3002\u5982\u679c\u8be5\u5e94\u7528\u7a0b\u5e8f\u8bbe\u7f6e\u4e3a\u5728\u9996\u6b21\u4f7f\u7528\u65f6\u5b89\u88c5\uff0c\u5219\u8fd0\u884c\u8be5\u5e94\u7528\u7a0b\u5e8f\uff0c\u7136\u540e\u518d\u5c1d\u8bd5\u65b0\u5efa\u8868\u5355\u3002\n\n2.  \u5982\u679c\u60a8\u5177\u6709\u4fee\u6539\u6b64\u8868\u5355\u5e93\u7684\u6743\u9650\uff0c\u5219\u8f6c\u5230\u8be5\u5e93\u7684\u201c\u5e38\u89c4\u8bbe\u7f6e\u201d\uff0c\u7136\u540e\u914d\u7f6e\u65b0\u6a21\u677f\u3002";
var L_NewFormLibTb2_Text = "\u6b64\u529f\u80fd\u9700\u8981\u4f7f\u7528 Microsoft Internet Explorer 5.0 \u6216\u66f4\u9ad8\u7248\u672c\uff0c\u4ee5\u53ca\u4e0e Windows SharePoint Services \u517c\u5bb9\u7684 XML \u7f16\u8f91\u5668\uff0c\u4f8b\u5982 Microsoft Office InfoPath\u3002";
var L_NewFormLibTb3_Text = "\u65e0\u6cd5\u5408\u5e76\u8868\u5355\u3002\n\u53ef\u80fd\u662f\u6240\u9700\u7684\u5e94\u7528\u7a0b\u5e8f\u5b89\u88c5\u4e0d\u6b63\u786e\uff0c\u6216\u8005\u662f\u65e0\u6cd5\u6253\u5f00\u6b64\u8868\u5355\u5e93\u7684\u6a21\u677f\u3002\n\n\u8bf7\u5c1d\u8bd5\u4ee5\u4e0b\u64cd\u4f5c:\n1. \u68c0\u67e5\u6b64\u8868\u5355\u5e93\u5bf9\u4e8e\u8be5\u6a21\u677f\u540d\u7684\u201c\u5e38\u89c4\u8bbe\u7f6e\u201d\uff0c\u5e76\u5b89\u88c5\u6253\u5f00\u8be5\u6a21\u677f\u6240\u5fc5\u9700\u7684\u5e94\u7528\u7a0b\u5e8f\u3002\u5982\u679c\u8be5\u5e94\u7528\u7a0b\u5e8f\u8bbe\u7f6e\u4e3a\u5728\u9996\u6b21\u4f7f\u7528\u65f6\u5b89\u88c5\uff0c\u5219\u8fd0\u884c\u8be5\u5e94\u7528\u7a0b\u5e8f\uff0c\u7136\u540e\u518d\u5c1d\u8bd5\u65b0\u5efa\u8868\u5355\u3002\n\n2.  \u5982\u679c\u60a8\u5177\u6709\u4fee\u6539\u6b64\u8868\u5355\u5e93\u7684\u6743\u9650\uff0c\u5219\u8f6c\u5230\u8be5\u5e93\u7684\u201c\u5e38\u89c4\u8bbe\u7f6e\u201d\uff0c\u7136\u540e\u914d\u7f6e\u65b0\u6a21\u677f\u3002";
var L_NewFormLibTb4_Text = "\u8bf7\u9009\u62e9\u8981\u5408\u5e76\u7684\u8868\u5355\uff0c\u7136\u540e\u5355\u51fb\u5de5\u5177\u680f\u4e0a\u7684\u201c\u5408\u5e76\u8868\u5355\u201d\u3002";
var L_NewFormLibTb5_Text = "\u9009\u62e9\u9700\u8981\u91cd\u65b0\u94fe\u63a5\u7684\u8868\u5355\u5e76\u5355\u51fb\u5de5\u5177\u680f\u4e0a\u7684\u201c\u91cd\u65b0\u94fe\u63a5\u8868\u5355\u201d\u3002";
var L_NewFormLibTb6_Text = "\u4e00\u6b21\u53ea\u80fd\u91cd\u65b0\u94fe\u63a5 100 \u4e2a\u8868\u5355\uff0c\u8bf7\u4fee\u6539\u9009\u62e9\u8303\u56f4\u5e76\u91cd\u8bd5\u3002";
var L_NewFormClickOnce1_Text = "\u65b0\u5efa\u6587\u4ef6\u5939";
var UTF8_1ST_OF_2         = 0xc0   ;   
var UTF8_1ST_OF_3         = 0xe0   ;   
var UTF8_1ST_OF_4         = 0xf0   ;  
var UTF8_TRAIL            = 0x80   ;   
var HIGH_SURROGATE_BITS   = 0xD800 ;
var LOW_SURROGATE_BITS    = 0xDC00 ;
var SURROGATE_6_BIT       = 0xFC00 ;
var SURROGATE_ID_BITS     = 0xF800 ;
var SURROGATE_OFFSET      = 0x10000;
function escapeProperlyCore(str, bAsUrl)
{
    var strOut = "";
    var strByte = "";
    var ix = 0;
    var strEscaped = " \"%<>\'&";
    for (ix = 0; ix < str.length; ix++)
    {
        var charCode = str.charCodeAt(ix);
        var curChar = str.charAt(ix);
        if(bAsUrl && (curChar == '#' || curChar == '?') ) 
        {
            strOut += str.substr(ix);
            break;
        }
        if ( (charCode >= 97 && charCode <= 122) ||
             (charCode >= 65 && charCode <= 90) ||
             (charCode >= 48 && charCode <= 57) ||
             (bAsUrl && (charCode >= 32 && charCode <= 95) && strEscaped.indexOf(curChar) < 0))
        {
            strOut += curChar;
        }
        else if (charCode <= 0x0f)
        {
            strOut += "%0" + charCode.toString(16).toUpperCase();
        }
        else if (charCode <= 0x7f)
        {
            strOut += "%" + charCode.toString(16).toUpperCase();
        }
        else if (charCode <= 0x07ff)
        {
            strByte = UTF8_1ST_OF_2 | (charCode >> 6);
            strOut += "%" + strByte.toString(16).toUpperCase() ; 
            strByte = UTF8_TRAIL | (charCode & 0x003f);
            strOut += "%" + strByte.toString(16).toUpperCase();
        }
        else if ((charCode & SURROGATE_6_BIT) != HIGH_SURROGATE_BITS)
        {
            strByte = UTF8_1ST_OF_3 | (charCode >> 12);
            strOut += "%" + strByte.toString(16).toUpperCase();
            strByte = UTF8_TRAIL | ((charCode & 0x0fc0) >> 6);  
            strOut += "%" + strByte.toString(16).toUpperCase();
            strByte = UTF8_TRAIL | (charCode & 0x003f);         
            strOut += "%" + strByte.toString(16).toUpperCase();
        }
        else if (ix < str.length - 1)
        {
            var charCode = (charCode & 0x03FF) << 10;           
            ix ++; 
            var nextCharCode = str.charCodeAt(ix);
            charCode |= nextCharCode & 0x03FF;                  
            charCode += SURROGATE_OFFSET;
            strByte =UTF8_1ST_OF_4 | (charCode >> 18);
            strOut += "%" + strByte.toString(16).toUpperCase();
            strByte =UTF8_TRAIL | ((charCode & 0x3f000) >> 12); 
            strOut += "%" + strByte.toString(16).toUpperCase();
            strByte =UTF8_TRAIL | ((charCode & 0x0fc0) >> 6);   
            strOut += "%" + strByte.toString(16).toUpperCase();
            strByte =UTF8_TRAIL | (charCode & 0x003f);          
            strOut += "%" + strByte.toString(16).toUpperCase();
        }
    }
    return strOut;
}
function escapeForSync(str)
{
    var strOut = "";
    var ix = 0;
    var bDoingUnicode = 0;
    var strSyncEscaped = "\\&|[]";
    for (ix = 0; ix < str.length; ix++)
    {
        var charCode = str.charCodeAt(ix);
        var curChar = str.charAt(ix);
        if(strSyncEscaped.indexOf(curChar) >= 0)
            strOut +="|";
        if (bDoingUnicode && charCode <= 0x7f) {
            strOut += "]";
            bDoingUnicode = 0;
        }
        if (!bDoingUnicode && charCode > 0x7f) {
            strOut += "[";
            bDoingUnicode = 1;
        }
        if ( (charCode >= 97 && charCode <= 122) ||
             (charCode >= 65 && charCode <= 90) ||
             (charCode >= 48 && charCode <= 57) )
        {
            strOut += curChar;
        }
        else if (charCode <= 0x0f)
        {
            strOut += "%0" + charCode.toString(16).toUpperCase();
        }
        else if (charCode <= 0x7f)
        {
            strOut += "%" + charCode.toString(16).toUpperCase();
        }
        else if (charCode <= 0x00ff)
        {
            strOut += "00" + charCode.toString(16).toUpperCase();
        }
        else if (charCode <= 0x0fff)
        {
            strOut += "0" + charCode.toString(16).toUpperCase();
        }
        else {
            strOut += charCode.toString(16).toUpperCase();
        }
    }
    if (bDoingUnicode)
        strOut += "]";
    return strOut;
}
function escapeProperly(str)
{
    return escapeProperlyCore(str, false);
}
var g_rgdwchMinEncoded = new Array([
                                     0x00000000,
                                     0x00000080,
                                     0x00000800,
                                     0x00010000,
                                     0x00200000,
                                     0x04000000,
                                     0x80000000
                                     ]);
function Vutf8ToUnicode(rgBytes)
{
    var ix = 0;
    var strResult = "";
    var dwch, wch, uch;
    var nTrailBytes, nTrailBytesOrig;
    while (ix < rgBytes.length)
    {
        if (rgBytes[ix] < 0x007f)
        {
            strResult += String.fromCharCode(rgBytes[ix++]);
        }
        else
        {
            uch = rgBytes[ix++];
            nTrailBytes = ((uch) & 0x20) ? (((uch) & 0x10) ? 3 : 2) : 1;
            dwch = uch & (0xff >>> (2 + nTrailBytes));
            while (nTrailBytes && (ix < rgBytes.length))
            {
                --nTrailBytes;
                uch = rgBytes[ix++];
                if (uch == 0)
                {
                    return strResult;
                }
                if ((uch & 0xC0) != 0x80)
                {
                    strResult += '?';
                    break;
                }
                dwch = (dwch << 6) | ((uch) & 0x003f);
            }
            if (nTrailBytes)
            {
                strResult += '?';
                break;
            }
            if (dwch < g_rgdwchMinEncoded[nTrailBytesOrig])
            {
                strResult += '?';
                break;
            }
            else if (dwch <= 0xffff)
            {
                strResult += String.fromCharCode(dwch);
            }
            else if (dwch <= 0x10ffff)
            {
                dwch -= SURROGATE_OFFSET;
                strResult += String.fromCharCode(
                    HIGH_SURROGATE_BITS | dwch >>> 10);
                strResult += String.fromCharCode(
                    LOW_SURROGATE_BITS | ((dwch) & 0x003FF));
            }
            else
            {
                strResult += '?';        
            }
        }
    }
    return strResult;
}   
function unescapeProperlyInternal(str)
{
    var ix = 0, ixEntity = 0;
    var strResult = "";
    var rgUTF8Bytes = new Array;
    var ixUTF8Bytes = 0;
    var hexString, hexCode;
    while (ix < str.length)
    {
        if (str.charAt(ix) == '%')
        {
            if (str.charAt(++ix) == 'u')
            {
                hexString = "";
                for (ixEntity = 0; ixEntity < 4 && ix < str.length; ++ixEntity)
                {
                    hexString += str.charAt(++ix);
                }
                while (hexString.length < 4)
                {
                    hexString += '0';
                }
                hexCode = parseInt(hexString, 16);
                if (isNaN(hexCode))
                {
                    strResult += '?';
                }
                else
                {
                    strResult += String.fromCharCode(hexCode);
                }
            }
            else
            {
                hexString = "";
                for (ixEntity = 0; ixEntity < 2 && ix < str.length; ++ixEntity)
                {
                    hexString += str.charAt(ix++);
                }
                while (hexString.length < 2)
                {
                    hexString += '0';
                }
                hexCode = parseInt(hexString, 16);
                if (isNaN(hexCode))
                {
                    if (ixUTF8Bytes)
                    {
                        strResult += Vutf8ToUnicode(rgUTF8Bytes);
                        ixUTF8Bytes = 0;
                        rgUTF8Bytes.length = ixUTF8Bytes;
                    }
                    strResult += '?';
                }
                else
                {
                    rgUTF8Bytes[ixUTF8Bytes++] = hexCode;
                }
            }
        }
        else
        {
            if (ixUTF8Bytes)
            {
                strResult += Vutf8ToUnicode(rgUTF8Bytes);
                ixUTF8Bytes = 0;
                rgUTF8Bytes.length = ixUTF8Bytes;
            }
            strResult += str.charAt(ix++);
        }
    }
    if (ixUTF8Bytes)
    {
        strResult += Vutf8ToUnicode(rgUTF8Bytes);
        ixUTF8Bytes = 0;
        rgUTF8Bytes.length = ixUTF8Bytes;
    }
    return strResult;
}
function unescapeProperly(str)
{
    var strResult = null;
    if ((browseris.ie55up || browseris.nav6up) &&
        (typeof(decodeURIComponent) != "undefined"))
    {
        strResult = decodeURIComponent(str);
    }
    else
    {
        strResult = unescapeProperlyInternal(str);
    }
    return strResult;
}
function encodeScriptQuote(str)
{
    var strOut = "";
    var ix = 0;
    for (ix = 0; ix < str.length; ix++)
    {
	var ch = str.charAt(ix);
        if (ch == '\'')
            strOut += "%27";
        else
            strOut += ch;
    }
    return strOut;
}
function STSHtmlEncode(str)
{
    var strOut = "";
    var ix = 0;
    for (ix = 0; ix < str.length; ix++)
    {
	    var ch = str.charAt(ix);
        switch (ch)
        {
            case '<':
                strOut += "&lt;";
                break;
            case '>':
                strOut += "&gt;";
                break;
            case '&':
                strOut += "&amp;";
                break;
            case '\"':
                strOut += "&quot;";
                break;
            case '\'':
                strOut += "&#39;";
                break;
            default:
                strOut += ch;
                break;
        }
   }
   return strOut;
}
function StAttrQuote(st)
{
	st = st.toString();
	st = st.replace(/&/g, '&amp;');
	st = st.replace(/\"/g, '&quot;'); 
	st = st.replace(/\r/g, '&#13;');
	return '"' + st + '"';
}
function STSScriptEncode(str)
{
    var strOut = "";
    var ix = 0;
    for (ix = 0; ix < str.length; ix++)
    {
        var charCode = str.charCodeAt(ix);
        if (charCode > 0x0fff)
        {
            strOut += ("\\u" + charCode.toString(16).toUpperCase());
        }
        else if (charCode > 0x00ff)
        {
            strOut += ("\\u0" + charCode.toString(16).toUpperCase());
        }
        else if (charCode > 0x007f)
        {
            strOut += ("\\u00" + charCode.toString(16).toUpperCase());
        }
        else
        {
            switch (str.charAt(ix))
            {
            case '\\':
                strOut += "\\\\";
                break;
            case '\"':
                strOut += "\\\"";
                break;
            case '\r':
                strOut += "\\r";
                break;
            case '\n':
                strOut += "\\n";
                break;
            case '\'':
                strOut += "\\'";
                break;
            case '<':
                strOut += "\\u003c";
                break;
            case '>':
                strOut += "\\u003e";
                break;
            default:
                strOut += str.charAt(ix);
            };
        }
    }
    return strOut;
}
function STSScriptEncodeWithQuote(str)
{
    return '"' + STSScriptEncode(str) + '"';
}
function makeAbsUrl(strUrl)
{
    if (strUrl.length > 0 && "/" == strUrl.substr(0, 1))
    {
        strUrl = window.location.protocol + "//" + window.location.host + strUrl;
    }
    return strUrl;
}
function FilterNoteField(view, fieldName, fieldValue, keyCode)
{
    if (keyCode != 13) return;
    event.returnValue=false;
    var strDocUrl = window.location.href;
    pagedPart = /&Paged=TRUE&p_[^&]*&PageFirstRow=[^&]*/gi;
    strDocUrl = strDocUrl.replace(pagedPart, "");
    viewGuid = GetUrlKeyValue("View");
    if (view.toUpperCase() != viewGuid.toUpperCase())
    {
        var encodedView = escapeProperly(view);
        if (encodedView.toUpperCase() != viewGuid.toUpperCase())
        {
            var pattern = /\?[^?]*/i;
            var idxQuery = strDocUrl.indexOf("?");
            if (idxQuery != -1)
               strDocUrl = strDocUrl.replace(pattern,"?View=" + view);
            else
               strDocUrl = strDocUrl + "?View=" + view;
        }
    }
    var arrayField = strDocUrl.match("FilterField([0-9]+)=" + fieldName);
    if (!arrayField)
    {
        var idxQuery = strDocUrl.indexOf("?");
        if (idxQuery != -1)
            strDocUrl = strDocUrl + "&";
        else
            strDocUrl = strDocUrl + "?";
        i=0;
        do
        {
            i++;
            FilterArray = strDocUrl.match("FilterField" + 
                            i + "=[^&]*" + "&FilterValue" + 
                            i + "=[^&]*");
        } while (FilterArray);
        strDocUrl = strDocUrl + "FilterField" + i +
                            "=" + fieldName + "&FilterValue"+
                            i + "=" + escapeProperly(fieldValue);
        strDocUrl = strDocUrl.replace("Filter=1&", "");
    }
    else
    {
        filterNo = parseInt(arrayField[1]);
        var arrayValue = strDocUrl.match("&FilterValue" + 
                            filterNo + "=[^&]*");
        strTemp="&" + arrayField[0] + arrayValue[0];
        strNewFilter = "&FilterField" + arrayField[1] +
                            "=" + fieldName + "&FilterValue"+
                            arrayField[1] + "=" + escapeProperly(fieldValue);
        strDocUrl = strDocUrl.replace(strTemp, strNewFilter);
        strDocUrl = strDocUrl.replace("Filter=1&", "");
    }
    window.location.href = STSPageUrlValidation(strDocUrl);
}
function SelectField(view, selectID)
{
   var strDocUrl = window.location.href;
   var strHash = window.location.hash;
   var fViewReplaced = false;
   var pattern = /\#.*/i;
   strDocUrl = strDocUrl.replace(pattern, "");
	viewGuid = GetUrlKeyValue("View");
	pageView = GetUrlKeyValue("PageView");
	if (view.toUpperCase() != viewGuid.toUpperCase())
	{
      var encodedView = escapeProperly(view);
      if (encodedView.toUpperCase() != viewGuid.toUpperCase())
      {
         var pattern = /\?[^?]*/i;
         var idxQuery = strDocUrl.indexOf("?");
         if (idxQuery != -1)
            strDocUrl = strDocUrl.replace(pattern,"?View=" + view);
         else
            strDocUrl = strDocUrl + "?View=" + view;
         fViewReplaced = true;
      }
	}
   if (!fViewReplaced && (GetUrlKeyValue("SelectedID") != ""))
   {
      var selectIDOld = /&SelectedID=[^&]*/gi;
      strDocUrl = strDocUrl.replace(selectIDOld, "");
   }
   strDocUrl = strDocUrl + "&SelectedID=";
   strDocUrl = strDocUrl + selectID;
   if (fViewReplaced && (pageView != ""))
   {
      strDocUrl = strDocUrl + "&PageView=" + pageView;
   }
   if (strHash != "")
   {
      strDocUrl = strDocUrl + strHash;
   }
	SubmitFormPost(strDocUrl);
}
function FilterField(view, fieldName, fieldValue, selOption)
{
    var strDocUrl = window.location.href;
    pagedPart = /&Paged=TRUE&p_[^&]*&PageFirstRow=[^&]*/gi;
    strDocUrl = strDocUrl.replace(pagedPart, "");
    viewGuid = GetUrlKeyValue("View");
    if (view.toUpperCase() != viewGuid.toUpperCase())
    {
        var encodedView = escapeProperly(view);
        if (encodedView.toUpperCase() != viewGuid.toUpperCase())
        {
            var pattern = /\?[^?]*/i;
            var idxQuery = strDocUrl.indexOf("?");
            if (idxQuery != -1)
               strDocUrl = strDocUrl.replace(pattern,"?View=" + view);
            else
               strDocUrl = strDocUrl + "?View=" + view;
        }
    }
	var arrayField = strDocUrl.match("FilterField([0-9]+)=" + fieldName + "&");
	if (!arrayField)
	{
		if (0 == selOption)
		{
            strDocUrl = strDocUrl.replace("Filter=1&", "");
            strDocUrl = strDocUrl.replace("?Filter=1", "");
		}
		else
		{
		   	var idxQuery = strDocUrl.indexOf("?");
		   	if (idxQuery != -1)
				strDocUrl = strDocUrl + "&";
			else
				strDocUrl = strDocUrl + "?";
			i=0;
			do
			{
				i++;
				FilterArray = strDocUrl.match("FilterField" + i + "=[^&]*" + 
	                                              "&FilterValue" + i + "=[^&]*");
			} while (FilterArray);
	        strDocUrl = strDocUrl + "FilterField" + i + "=" + fieldName +
	                                "&FilterValue"+ i + "=" + escapeProperly(fieldValue);
	        strDocUrl = strDocUrl.replace("Filter=1&", "");
		}
    }
    else
    {
        filterNo = parseInt(arrayField[1]);
        var arrayValue = strDocUrl.match("FilterValue" + filterNo + "=[^&]*");
        strTemp="&" + arrayField[0] + arrayValue[0];
        if (0 == selOption)
        {
            strDocUrl = strDocUrl.replace(strTemp, "");
            j = filterNo + 1;
            FilterArray = strDocUrl.match("FilterField" +
                            j + "=[^&]*" + "&FilterValue" +
                            j + "=[^&]*");
            for ( i=filterNo ; FilterArray; i++)
            {
                strNew = "FilterField" + i;
                strOld = "FilterField" + j;
                strDocUrl = strDocUrl.replace(strOld, strNew);
                strNew = "FilterValue" + i;
                strOld = "FilterValue" + j;
                strDocUrl = strDocUrl.replace(strOld, strNew);
                j++;
                FilterArray = strDocUrl.match("FilterField" +
                                j + "=[^&]*" + "&FilterValue"+
                                j + "=[^&]*");
            }
            strDocUrl = strDocUrl.replace("Filter=1&", "");
            strDocUrl = strDocUrl.replace("?Filter=1", "");
        }
        else
        {
            strNewFilter = "&FilterField" + arrayField[1] +
                            "=" + fieldName + "&FilterValue"+
                            arrayField[1] + "=" + escapeProperly(fieldValue);
            strDocUrl = strDocUrl.replace(strTemp, strNewFilter);
            strDocUrl = strDocUrl.replace("Filter=1&", "");
        }
    }
	SubmitFormPost(strDocUrl);
}
function SetControlValue(controlId, value)
{
	var control = document.getElementById(controlId);
	if (control != null)
		 control.value = value;
}
var bValidSearchTerm = false;
function SetSearchView()
{
    if (typeof(bValidSearchTerm) != "undefined")
        bValidSearchTerm = true;
}
function SubmitFormPost(url)
{
    if (typeof(MSOWebPartPageFormName) != "undefined")
    {
        var form = document.forms[MSOWebPartPageFormName];
        if (null != form)
        {
            form.action = STSPageUrlValidation(url);
            form.method="POST";
            if (isPortalTemplatePage(url))
                    form.target="_top";
            if (!bValidSearchTerm)
                ClearSearchTerm("");
            form.submit();
        }
    }
}
function TrimSpaces( str )
{
    var start;
    var end;
    str = str.toString();
    var len = str.length;
    for (start = 0; start < len; start ++)
    {
        if (str.charAt(start) != ' ')
            break;
    }
    if (start == len)
        return "";
    for (end = len - 1; end > start; end --)
    {
        if (str.charAt(end) != ' ')
            break;
    }
    end ++;
    return str.substring(start, end);
}
function TrimWhiteSpaces( str ) 
{
    var start;
    var end;
    str = str.toString();
    var len = str.length;
    for (start = 0; start < len; start ++)
    {
        ch = str.charAt(start);
        if (ch!=' ' && ch!='\t' && ch!='\n' && ch!='\r' && ch!='\f')
            break;
    }
    if (start == len)
        return "";
    for (end = len - 1; end > start; end --)
    {
        ch = str.charAt(end);
        if (ch!=' ' && ch!='\t' && ch!='\n' && ch!='\r' && ch!='\f')
            break;
    }
    end ++;
    return str.substring(start, end);
}
var g_varSkipRefreshOnFocus = 0;
function RefreshOnFocus()
{
    if (typeof(g_varSkipRefreshOnFocus) == "undefined" ||
        !g_varSkipRefreshOnFocus)
    {
        window.location.href = window.location;
    }
}
function DisableRefreshOnFocus()
{
    g_varSkipRefreshOnFocus = 1;
}
function SetWindowRefreshOnFocus()
{
    window.onbeforeunload = DisableRefreshOnFocus;
    window.onfocus = RefreshOnFocus;
}
function STSPageUrlValidation(url)
{
	if (url.substr(0, 4) != "http")
	{   
		var L_InvalidPageUrl_Text = "\u65e0\u6548\u7684\u7f51\u9875 URL: ";
		alert(L_InvalidPageUrl_Text + url);
		return "";
	}
	else
		return url;      
}
function GetSource(defaultSource)
{
    var source = GetUrlKeyValue("Source");  
    if (source == "")
    {
        if (defaultSource != null && defaultSource != "")
            source = defaultSource;
        else
		    source = escapeProperly(window.location.href);
    }    
    return STSPageUrlValidation(source);
}
function GetUrlKeyValue(keyName, url)
{
    var keyValue = "";
    if (url == null)
        url = window.location.href + "";
    var ndx = url.indexOf("&" + keyName + "=");
    if (ndx == -1)
        ndx = url.indexOf("?" + keyName + "=");
    if (ndx != -1)
    {
        ndx2 = url.indexOf("&", ndx + 1);
        if (ndx2 == -1)
            ndx2 = url.length;
        keyValue = url.substring(ndx + keyName.length + 2, ndx2);
    }
    return keyValue;
}
function GoToPage(url)
{
	var ch = url.indexOf("?") >= 0 ? "&" : "?";
    var srcUrl = GetSource();
    if (srcUrl != null && srcUrl != "")
	    url += ch + "Source=" + srcUrl;
	STSNavigate(url);
}
function isPortalTemplatePage(Url)
{
    if (GetUrlKeyValue("PortalTemplate")=="1" || 
        GetUrlKeyValue("PortalTemplate", Url) == "1" || 
        (currentCtx != null && currentCtx.isPortalTemplate))
        return true;
    else
        return false;
}
function STSNavigate(Url)
{
	if (isPortalTemplatePage(Url))
        window.top.location = STSPageUrlValidation(Url);
    else
        window.location = STSPageUrlValidation(Url);
}
function NewItem(url)
{
   GoToPage(url);
}
function EditItem(url)
{
    GoToPage(url);
}
function GoToLink(elm)
{
    if (elm.href == null)
        return;
    var ch = elm.href.indexOf("?") >= 0 ? "&" : "?";
    var srcUrl = GetSource();
    if (srcUrl != null && srcUrl != "")
	    srcUrl = ch + "Source=" + srcUrl;
    var targetUrl = elm.href + srcUrl;
    if (isPortalTemplatePage(targetUrl))
	    window.top.location = STSPageUrlValidation(targetUrl);
    else
	    window.location = STSPageUrlValidation(targetUrl);
}
function GoBack(defViewUrl)
{
	window.location.href = unescapeProperly(GetSource(defViewUrl));
}
function ReplyItem(url, threading, guid, subject)
{
    if(threading.length>=504) 
    {
        var L_ReplyLimitMsg_Text="\u65e0\u6cd5\u7b54\u590d\u6b64\u7ebf\u7d22\u3002\u5df2\u8fbe\u5230\u7b54\u590d\u9650\u5236\u3002";
        alert(L_ReplyLimitMsg_Text);
    } else 
    {
        url += "?Threading=" + threading;
        url += "&Guid=" + guid;
        url += "&Subject=" + subject;
        GoToPage(url);
    }
}
function GoBacktoCurrentIssue(url, issueid)
{
	url += '?ID=' + issueid;
	GoToPage(url);
}
function RemoveRelated(url, itemid, listid)
{    
    var L_DeleteRelated_text = "\u4ece\u6b64\u5217\u8868\u4e2d\u5220\u9664\u95ee\u9898\u5c06\u4ec5\u5220\u9664\u5176\u4e0e\u76f8\u5173\u9879\u4e4b\u95f4\u7684\u5173\u7cfb\u3002\u5176\u4ed6\u76f8\u5173\u9879\u76ee\u90fd\u4e0d\u53d7\u5f71\u54cd\u3002";
    if (confirm(L_DeleteRelated_text))
    {
        var rowid = "idRelatedIssueRow"+itemid;
        document.getElementsByName("RelatedIssueToBeRemovedFromServer").item(0).value += itemid + ";";
        var relatedIssueTable = document.getElementById("idRelatedIssueTable");
        if (relatedIssueTable != null)
        {
           var rowTobeDeleted = relatedIssueTable.rows.item(rowid);
           if (rowTobeDeleted != null)
            relatedIssueTable.deleteRow(rowTobeDeleted.rowIndex);
           if (relatedIssueTable.rows.length == 1)
           {
             relatedIssueTable.style.display='none';    
             document.getElementById("idRelatedIssueHeadtable").style.display='none';
           } 
        }               
    }              
}
var fSSImporter = false;
var SSImporterObj;
function CatchCreateError(strIgnore1, strIgnore2, strIgnore3)
{
    return true;
}
function EnsureSSImporter()
{
    if (!fSSImporter)
    {
        if (browseris.ie5up && browseris.win32)
        {
            var functionBody = "";
            functionBody += "try";
            functionBody += "{";
            functionBody += "    SSImporterObj = new ActiveXObject(\"SharePoint.SpreadsheetLauncher.1\");";
            functionBody += "    if (SSImporterObj)";
            functionBody += "        fSSImporter = true;";
            functionBody += "} catch (e)";
            functionBody += "{";
            functionBody += "    fSSImporter = false;";
            functionBody += "};";
            var EnsureSSImportInner = new Function(functionBody);
            EnsureSSImportInner();
        }
        else
        {
            window.onerror = CatchCreateError;
            SSImporterObj = new ActiveXObject("SharePoint.SpreadsheetLauncher.1");
            if (SSImporterObj)
                fSSImporter = true;
        }
    }
    return fSSImporter;
}
function ExportList(using)
{
    var L_ExportListSpreadsheet_Text = "\u82e5\u8981\u5bfc\u51fa\u5217\u8868\uff0c\u5fc5\u987b\u8981\u6709\u4e0e Windows SharePoint Services \u517c\u5bb9\u7684\u5e94\u7528\u7a0b\u5e8f\u3002";
    if ((fSSImporter && SSImporterObj.IqyImportEnabled()) ||
        confirm(L_ExportListSpreadsheet_Text))
        window.location.href = STSPageUrlValidation(using) + "&Source=" + GetSource();
}
function GetStssyncAppName(strDefault)
{
    if (browseris.ie5up && browseris.win32)
    {
        try
        {
            var strAppName;
            var objStssync = new ActiveXObject("SharePoint.StssyncHandler");
            if (!objStssync || !(strAppName = objStssync.GetStssyncAppName()))
            {
                return false;
            }
            else
            {
                var L_LinkToBefore_Text = "\u94fe\u63a5\u5230";
                var L_LinkToAfter_Text = "";
                return L_LinkToBefore_Text + strAppName + L_LinkToAfter_Text;
            }
        }
        catch (e)
        {
            return false;
        }
    }
    else
    {
        return strDefault;
    }
}
function ExportHailStorm(type,weburl,guid,webname,listname,listurl,passport)
{
    var maxLinkLength = 500;
   var link = "stssync://sts/?ver=1.0"
    + "&type=" + escapeProperly(type)
    + "&cmd=add-folder"
    + "&base-url=" + escapeForSync(weburl)
    + "&list-url=" + escapeForSync("/" + listurl.substr(weburl.length+1))
    + "&guid=" + escapeProperly(guid)
    + "&site-name=" + escapeForSync(webname)
    + "&list-name=" + escapeForSync(listname);
   var L_StssyncTooLong_Text = "\u6b64\u7f51\u7ad9\u6216\u5217\u8868\u7684\u6807\u9898\u592a\u957f\u3002\u8bf7\u7f29\u77ed\u6807\u9898\u5e76\u91cd\u8bd5\u3002";
   if (link.length > maxLinkLength)
       alert(L_StssyncTooLong_Text);
   else
   {
       try
       {
           window.location.href = link;
       }
       catch (e)
       {
       }
   }
}
var ListCtrlObj;
var fListControl = false;
var fListErrorShown = false;
var L_EditInGrid_Text = "\u7531\u4e8e\u4e0b\u5217\u539f\u56e0\uff0c\u5217\u8868\u4e0d\u80fd\u5728\u201c\u6570\u636e\u8868\u201d\u89c6\u56fe\u4e2d\u663e\u793a: \n\n- \u6ca1\u6709\u5b89\u88c5\u4e0e Windows SharePoint Services \u517c\u5bb9\u7684\u6570\u636e\u8868\u7ec4\u4ef6\u3002\n- \u6d4f\u89c8\u5668\u4e0d\u652f\u6301 ActiveX \u63a7\u4ef6\u3002\n- \u5bf9 ActiveX \u63a7\u4ef6\u7684\u652f\u6301\u88ab\u7981\u7528\u3002";
function CatchListCreateError(strIgnore1, strIgnore2, strIgnore3)
{
	alert(L_EditInGrid_Text);
	fListErrorShown = true;
    return false;
}
function EnsureListControl()
{
    if (!fListControl)
    {
    	fListErrorShown = false;
        if (browseris.ie5up && browseris.win32)
        {
            var functionBody = "";
            functionBody += "try";
            functionBody += "{";
            functionBody += "    ListCtrlObj = new ActiveXObject(\"ListNet.ListNet.11\");";
            functionBody += "    if (ListCtrlObj)";
            functionBody += "        fListControl = true;";
            functionBody += "} catch (e)";
            functionBody += "{";
            functionBody += "    fListControl = false;";
            functionBody += "};";
            var EnsureListControlInner = new Function(functionBody);
            EnsureListControlInner();
        }
        else
        {
            window.onerror = CatchListCreateError;
            ListCtrlObj = new ActiveXObject("ListNet.ListNet.11");
            if (ListCtrlObj)
                fListControl = true;
        }
    }
    ListCtrlObj = null;
    return fListControl;
}
function EditInGrid(using, viewguid)
{
    EnsureListControl();
    if (fListControl)
    {
        encViewId = escapeProperly(viewguid);
        strDocUrl = using + "?ShowInGrid=True&View=" + encViewId;
	    pageView = GetUrlKeyValue("PageView");
        if (pageView != "")
        {
            strDocUrl = strDocUrl + "&PageView=" + pageView;
        }
	 showWebPart = GetUrlKeyValue("ShowWebPart");
        if (showWebPart != "")
        {
            strDocUrl = strDocUrl + "&ShowWebPart=" + showWebPart;
        }
        viewId = GetUrlKeyValue("View");
        if ((viewId.toUpperCase() == viewguid.toUpperCase()) || (viewId.toUpperCase() == encViewId.toUpperCase()))
        {
            rootFolder = GetUrlKeyValue("RootFolder");
            if (rootFolder != "")
            {
                strDocUrl = strDocUrl + "&RootFolder=" + rootFolder;
            }
        }
		SubmitFormPost(strDocUrl);
    }
    else
    	{
    	if (!fListErrorShown)
    		{
	    	alert(L_EditInGrid_Text);
	    	fListErrorShown = true;
    		}
    	}
}
function ExitGrid(using)
{
    var strDocUrl;
    var pageView;
    var viewId;
    var rootFolder; 
    strDocUrl = using;
    pageView = GetUrlKeyValue("PageView");
    viewId = GetUrlKeyValue("View");
    if (viewId != "")
    {
        strDocUrl = strDocUrl + "?View=" + viewId;
        rootFolder = GetUrlKeyValue("RootFolder");
        if (rootFolder != "")
        {
            strDocUrl = strDocUrl + "&RootFolder=" + rootFolder;
        }
        if (pageView != "")
        {
            strDocUrl = strDocUrl + "&PageView=" + pageView;
        }
        showWebPart = GetUrlKeyValue("ShowWebPart");
        if (showWebPart != "")
        {
            strDocUrl = strDocUrl + "&ShowWebPart=" + showWebPart;
        }
        strDocUrl = strDocUrl + "&ShowInGrid=HTML";
    }
    else
    {
        strDocUrl = strDocUrl + "?ShowInGrid=HTML";
        if (pageView != "")
        {
            strDocUrl = strDocUrl + "&PageView=" + pageView;
        }
        showWebPart = GetUrlKeyValue("ShowWebPart");
        if (showWebPart != "")
        {
            strDocUrl = strDocUrl + "&ShowWebPart=" + showWebPart;
        }
    }
	SubmitFormPost(strDocUrl);
}
var L_NoQuestion_Text = "\u6b64\u8c03\u67e5\u6ca1\u6709\u5305\u542b\u95ee\u9898\u3002";
var L_NoVoteAllowed_Text = "\u4e0d\u5141\u8bb8\u518d\u6b21\u7b54\u590d\u6b64\u8c03\u67e5\u3002";
function IsVoteOK(notAllowed)
{
    if (1 == notAllowed)
        alert(L_NoQuestion_Text);
    else if (2 == notAllowed)
        alert(L_NoVoteAllowed_Text);
    else
        return true;
}
function hasHighChar(str)
{
    var ix = 0;
    for (ix = 0; ix < str.length; ix++)
    {
        if (str.charCodeAt(ix)>127)
	    return true;
    }
    return false;
}
function RemovePagingArgs(strUrl)
{
    var rePagedFlag = /&*Paged=TRUE/gi;
    strUrl = strUrl.replace(rePagedFlag, "");
    var rePagedArgs = /&p_[^&]*/gi;
	strUrl = strUrl.replace(rePagedArgs, "");
    var rePagedRow = /&PageFirstRow=[^&]*/gi;
	strUrl = strUrl.replace(rePagedRow, "");
    var reFilter1 = /\?Filter=1&*/gi;
    strUrl = strUrl.replace(reFilter1, "?");
    var reFilter2 = /&Filter=1/gi;
    strUrl = strUrl.replace(reFilter2, "");
    var reOrphanedQMark = /\?$/;
    strUrl = strUrl.replace(reOrphanedQMark, "");
    return strUrl;
}
function ClearSearchTerm(guidView)
{
    if (typeof(MSOWebPartPageFormName) != "undefined")
    {
        var form = document.forms[MSOWebPartPageFormName];
        if (null != form)
        {
            if (guidView != null)
            {
                var frmElem = form["SearchString"+guidView];
                if (frmElem != null)
                    frmElem.value = "";
            }
        }
    }
    bValidSearchTerm = true;
}           
function SubmitSearchRedirect(strUrl)
{
    var frm = document.forms["frmSiteSearch"];
    if (frm == null)
    {
        if (typeof(MSOWebPartPageFormName) != "undefined")
            frm = document.forms[MSOWebPartPageFormName];
    }
    if (frm != null)
    {
        frm.action = strUrl;
        frm.submit();
    }
}
function ShowGridUrlInHTML(strUrl)
{
    if (strUrl.indexOf("?") > 0)
        strUrl = strUrl + "&";
    else
        strUrl = strUrl + "?";
    strUrl = strUrl + "ShowInGrid=HTML";
    return strUrl;
}
function SubmitSearch()
{
    SubmitSearchForView("");
}
function SubmitSearchForView(ViewGuid)
{
    var frm = document.forms[0];
    var srchCtlName = "SearchString" + ViewGuid;
    var searchText = frm.elements[srchCtlName].value;
    if ("" == searchText)
    {
    	var L_Enter_Text = "\u8bf7\u8f93\u5165\u641c\u7d22\u8bcd\u6c47\u3002";
    	alert(L_Enter_Text);
        frm.elements[srchCtlName].focus();
    }
    else
    {
        var strDocUrl;
        strDocUrl = RemovePagingArgs(frm.action);
        if (typeof(bGridViewPresent) != "undefined" && bGridViewPresent)
            strDocUrl = ShowGridUrlInHTML(strDocUrl);
        frm.action = strDocUrl;
    	frm.submit();
    }
}
function IsKeyDownSubmit(event)
{
    if (event != null)
    {
        var charCode;
        var bKeyModifiers;
        if (browseris.ie)
        {
            charCode = event.keyCode;
            bKeyModifiers = event.altKey || event.ctrlKey;
        }
        else
        {
            charCode = event.which;
            bKeyModifiers = event.modifers &
                           (event.ALT_MASK | event.CONTROL_MASK);
        }
        if ((charCode == 13) && !bKeyModifiers)
            return true;
    }
    return false;
}
function SearchViewKeyDown(guidView)
{
    if (IsKeyDownSubmit(event))
        SubmitSearchForView(guidView);
}
function SearchKeyDown(event, strUrl)
{
    if (IsKeyDownSubmit(event))
    {
        SubmitSearchRedirect(strUrl);
        return false;
    }
    return true;
}
function AlertAndSetFocus(msg, fieldName)
{
    fieldName.focus();
    fieldName.select();
    window.alert(msg);
}
function AlertAndSetFocusForDropdown(msg, fieldName)
{
   fieldName.focus();
   window.alert(msg);
}
function setElementValue(elemName, elemValue)
{
    var elem = document.getElementsByName(elemName).item(0);
    if (elem == null)
        return false;
    elem.value = elemValue;
    return true;
}
function GetSelectedValue (frmElem) {
    if (frmElem && (frmElem.selectedIndex >-1)) {
        return frmElem.options[frmElem.selectedIndex].value
    }
    else
        return "";
}
function GetSelectedText(frmElem) {
    if (frmElem && (frmElem.selectedIndex >-1)) {
        return frmElem.options[frmElem.selectedIndex].text
    }
    else
        return "";
}
function GetMultipleSelectedText(frmElem) {
    if (frmElem) {
        var strret;
        strret = "";
        for(var i=0; i < frmElem.options.length; i++)
            {
            if (frmElem.options[i].selected)
                strret += "," + frmElem.options[i].text;
            }
        if (strret.length > 0)
            strret = strret.substring(1);
        return strret;        
    }
    else
        return "";
}
function GetCBSelectedValues(frm) {
    if (frm == null)
        return;
    var value = new Object();
    value.strList = "";
    value.fAllChecked = true;
    for (var i=0;i<frm.elements.length;i++)
        {
        var e = frm.elements[i];
        if (e.type == "checkbox" && !e.disabled )
            {
            if (e.checked)
                {
                if (value.strList != "")  
                    value.strList += ",";  
                value.strList += e.value; 
                }
            else
                value.fAllChecked = false;
            }
        }
    return value;
}   
var fNewDoc = false;
var fNewDoc2 = false;
var L_EditDocumentProgIDError_Text = "\u201c\u7f16\u8f91\u6587\u6863\u201d\u9700\u8981\u4f7f\u7528\u4e0e Windows SharePoint Services \u517c\u5bb9\u7684\u5e94\u7528\u7a0b\u5e8f\u548c Microsoft Internet Explorer 5.0 \u6216\u66f4\u9ad8\u7248\u672c\u3002";
var L_EditDocumentRuntimeError_Text = "\u65e0\u6cd5\u7f16\u8f91\u8be5\u6587\u6863\u3002 \n\u53ef\u80fd\u662f\u6240\u9700\u7684\u5e94\u7528\u7a0b\u5e8f\u5b89\u88c5\u4e0d\u6b63\u786e\uff0c\u6216\u8005\u662f\u65e0\u6cd5\u6253\u5f00\u6240\u9700\u7684\u6587\u6863\u3002\n\n\u8bf7\u786e\u4fdd\u5df2\u5b89\u88c5\u5fc5\u9700\u7684\u5e94\u7528\u7a0b\u5e8f\uff0c\u5e76\u4e14\u6587\u6863\u7684\u8def\u5f84\u6b63\u786e\u3002\u5982\u679c\u8be5\u5e94\u7528\u7a0b\u5e8f\u8bbe\u7f6e\u4e3a\u5728\u9996\u6b21\u4f7f\u7528\u65f6\u5b89\u88c5\uff0c\u5219\u8fd0\u884c\u8be5\u5e94\u7528\u7a0b\u5e8f\uff0c\u7136\u540e\u518d\u5c1d\u8bd5\u7f16\u8f91\u6587\u6863\u3002";
function editDocumentWithProgID(strDocument, varProgID)
{
    if (fNewDoc)
    {
      if (strDocument.charAt(0) == "/" || strDocument.substr(0,3).toLowerCase() == "%2f")
        strDocument = document.location.protocol + "//" + document.location.host + strDocument;
      if (!fNewDoc2)
      {
         if(!EditDocumentButton.EditDocument(strDocument, varProgID))
            alert(L_EditDocumentRuntimeError_Text);
      }
      else
      {
         if(!EditDocumentButton.EditDocument2(window, strDocument, varProgID))
            alert(L_EditDocumentRuntimeError_Text);
      }
    }
    else
    {
      alert(L_EditDocumentProgIDError_Text);
    }
}
function editDocumentWithProgID2(strDocument, varProgID, varEditor)
{
    var objEditor;
    if (strDocument.charAt(0) == "/" || strDocument.substr(0,3).toLowerCase() == "%2f")
        strDocument = document.location.protocol + "//" + document.location.host + strDocument;
    try
    {
        objEditor = new ActiveXObject(varEditor + ".2");
        if (!objEditor.EditDocument2(window, strDocument, varProgID))
            alert(L_EditDocumentRuntimeError_Text);
        window.onfocus = RefreshOnNextFocus;
        return;
    }
    catch (e)
    {
    }
    try
    {
        objEditor = new ActiveXObject(varEditor + ".1");
        window.onfocus = null;
        if (SzExtension(strDocument) == "ppt" && varProgID == "")
            varProgID = "PowerPoint.Slide";
        if (!objEditor.EditDocument(strDocument, varProgID))
            alert(L_EditDocumentRuntimeError_Text);
        SetWindowRefreshOnFocus();
        return;
    }
    catch (e)
    {
        alert(L_EditDocumentProgIDError_Text);
    }
}
function RefreshOnNextFocus()
{
    SetWindowRefreshOnFocus();
}
function createNewDocumentWithProgID(strTemplate, strSaveLocation, strProgID, bXMLForm)
{
    var objEditor;
    var L_NewDocumentRuntimeError_Text;
    var L_NewDocumentError_Text;
    var fRefreshOnNextFocus = false;
    if (bXMLForm)
    {
        var L_NewDocumentRuntimeError_Text = L_NewFormLibTb1_Text;
        var L_NewDocumentError_Text = L_NewFormLibTb2_Text;
    }
    else
    {
        var L_NewDocumentRuntimeError_Text = L_NewDocLibTb1_Text;
        var L_NewDocumentError_Text = L_NewDocLibTb2_Text;
    }
    try
    {
        objEditor = new ActiveXObject(strProgID + ".2");
        if (!objEditor.CreateNewDocument2(window, strTemplate, strSaveLocation))
            alert(L_NewDocumentRuntimeError_Text);
        fRefreshOnNextFocus = objEditor.PromptedOnLastOpen();
        if (fRefreshOnNextFocus)
        {
            window.onfocus = RefreshOnNextFocus;
        }
        else
        {
            SetWindowRefreshOnFocus();
        }
        return;
    }
    catch (e)
    {
    }
    try
    {
        objEditor = new ActiveXObject(strProgID + ".1");
        window.onfocus = null;
        if (!objEditor.CreateNewDocument(strTemplate, strSaveLocation))
            alert(L_NewDocumentRuntimeError_Text);
        SetWindowRefreshOnFocus();
        return;
    }
    catch (e)
    {
        alert(L_NewDocumentError_Text);
    }
}
function retrieveCurrentThemeLink()
{
    var cssLink;
    var links = document.getElementsByTagName("link");
    for(var i=0; i<links.length; i++)
    {
        if((links[i].type == "text/css") && (links[i].id == "onetidThemeCSS"))
            cssLink = links[i];
    }
    if(cssLink)
    {
        var re = /(\.\.\/)+/;
        var relativeURL = cssLink.href;
        var newURL = relativeURL.replace(re, "/");
        return newURL;
    }
}
var L_strExpand_Text="\u5c55\u5f00";
var L_strCollapse_Text="\u6298\u53e0";
function DiscussionBoard(flag, id)
{
    CheckNav();
    if (!Array.prototype.push)
    {
        function array_push()
        {
            for (var i = 0; i < arguments.length; i++)
                this[this.length] = arguments[i];
            return this.length;
        }
        Array.prototype.push = array_push;
    }
    this.id = id;
    this.name="board"+id;
    this.rootPosts = new Array();     
    this.allPosts = new Array();        
    this.lastInsert = 0;                     
    this.lastNode = 0;                      
    this.expanded = false;               
    this.threaded = flag;                  
    this.initialized = false;               
    this.widgetBaseSrc = null;          
    this.init = function()
    {
        this.mainTable = document.getElementById(this.id);
        var childAnchors = this.mainTable.getElementsByTagName("A");
        if(this.threaded)
        {
            for (var counter = 0; counter < childAnchors.length; counter++)
            {
                if (childAnchors[counter].name == "post")
                    this.insert(new Post(childAnchors[counter], this));
            }
            this.setReplyCountAndIndent();
        } else
        {
            for (var counter = 0; counter < childAnchors.length; counter++)
            {
                if (childAnchors[counter].name == "post")
                    this.allPosts.push(new Post(childAnchors[counter], this));
            }        
        }
        this.initialized = true;
    }
    this.setReplyCountAndIndent = function()
    {
        var nextRoot;
        for(var counter = 0; counter < this.rootPosts.length; counter++)
        {
            nextRoot = this.rootPosts[counter];
            nextRoot.setReplyCountAndIndent(true); 
        }
    }
    this.insert = function(newNode)
    {        
        var nextRoot;
        for(var counter = this.lastInsert; counter < this.rootPosts.length; counter++)
        {
            nextRoot = this.rootPosts[counter];
            if((newNode.id.indexOf(nextRoot.id) == 0) && (newNode.id != nextRoot.id))
            {
                newNode.hide();                                 
                return nextRoot.insert(newNode);
            } else 
                this.lastInsert++;
        }
        this.rootPosts.push(newNode);
    }
    this.retrieve = function(id, guid)
    {
        if(this.threaded)
        {
            var nextRoot;
            var node;
            for(var counter = 0; counter < this.rootPosts.length; counter++)
            {
                nextRoot = this.rootPosts[counter];
                if(id.indexOf(nextRoot.id) == 0)
                    if((node = nextRoot.retrieve(id, guid)) != -1)
                        return node;
            }
        } else
        {
            var nextPost;
            for(var counter = 0; counter < this.allPosts.length; counter++)
            {
                nextPost = this.allPosts[counter];
                if((id == nextPost.id) && (guid == nextPost.guid))
                    return nextPost;
            }
        }
        return -1;
    }
     this.expandCollapse = function()
    {
        if(!this.initialized)
            return false;
        if(this.expanded)
        {
            var nextRoot;
            for(var counter = 0; counter < this.rootPosts.length; counter++)
            {
                nextRoot = this.rootPosts[counter];
                nextRoot.hideTextAndChildren();
            }
            this.expanded = false;
        }
        else
        {
            var nextRoot;
            for(var counter = 0; counter < this.rootPosts.length; counter++)
            {
                nextRoot = this.rootPosts[counter];
                nextRoot.showTextAndChildren(true); 
            }
            this.expanded = true;
        }
    }
    this.handleClicks = function(evt)
    {
        if(!this.initialized)
            return true;
        evt = (evt) ? evt : ((window.event) ? window.event : "");
        if (evt) 
        {
            var elem;
            if (evt.target) 
                elem = evt.target;
            else
                elem = evt.srcElement;
            if (evt.type=="keydown")
            {
               if (String.fromCharCode(evt.keyCode) == '\r')
                    elem = elem.firstChild;
                else
                    return true;
            }
            if (elem)
            {
                if(elem.name && ("widget" == elem.name.valueOf()))
                {
                    srcPath = elem.getAttribute("src");
                    if(srcPath)
                    {
                        index = srcPath.lastIndexOf("/");
                        imgName = srcPath.slice(index+1);
                        if ((imgName.valueOf()=="discbul.gif") || ((imgName.valueOf()!="plus.gif") && (imgName.valueOf()!="minus.gif")))
                            return true;
                        var node;
                        var action;
                        if((evt.type == "click") || (evt.type == "keydown"))
                        {
                            node = this.retrieve(elem.id, elem.parentNode.parentNode.parentNode.parentNode.parentNode.getAttribute("PostID"));
                            this.lastNode = node;               
                            action = (imgName.valueOf()=="plus.gif") ? "expand" : "collapse";
                        } else if(evt.type == "dblclick")
                        {
                            node = this.lastNode;               
                            action = (imgName.valueOf()=="plus.gif") ? "collapse" : "expandRecursively"; 
                        }
                        switch(action)
                        {
                            case "expand":
                                if(this.threaded)
                                    node.showTextAndChildren(false);    
                                else
                                    node.showText();                               
                                break;
                            case "expandRecursively":
                                if(this.threaded)
                                    node.showTextAndChildren(true);     
                                else
                                    node.showText();                               
                                break;
                            case "collapse":
                                if(this.threaded)
                                {
                                    node.hideTextAndChildren();             
                                    this.expanded = false;                      
                                }
                                else
                                    node.hideText();                                
                                break;
                        }
                    }
               }
            }
        }
        return true;
    }
}
function Post(elem, discussionBoard)
{    
    this.board = discussionBoard;
    this.depth = 0;
    this.replyCount = 0;
    this.lastInsert = 0;
    this.childNodes = new Array();
    this.anchor = elem;
    this.widget = elem.firstChild;
    this.widgetPadding = this.widget.parentNode.parentNode;
    if(!this.board.widgetBaseSrc)
    {
        currentWidgetSrcPath = this.widget.getAttribute("src");
        marker = currentWidgetSrcPath.lastIndexOf("/");
        this.board.widgetBaseSrc = currentWidgetSrcPath.slice(0,marker+1);
    }
    this.id = this.widget.id;                                                               
    this.guid = this.widgetPadding.parentNode.parentNode.parentNode.getAttribute("PostID"); 
    if(this.board.threaded)
    {
        this.indent = elem.parentNode.parentNode.parentNode.parentNode.parentNode.parentNode.firstChild;
        if (browseris.ie && !browseris.mac)
            this.body = this.indent.parentNode.childNodes[1].childNodes[1]; 
        else
            this.body = this.indent.parentNode.childNodes[1].childNodes[2]; 
        this.row = this.indent.parentNode.parentNode.parentNode.parentNode.parentNode;
        this.reply = this.row.childNodes[1];
        this.bodyPadding = this.body.firstChild.firstChild.firstChild;
        this.bodyPadding.setAttribute("width",8);
    } else
        this.body = elem.parentNode.parentNode.parentNode.parentNode.parentNode.childNodes[1];
    this.insert = function(newNode)
    {
        this.replyCount++;
        newNode.depth++;
        var nextChild;
        for(var counter = this.lastInsert; counter < this.childNodes.length; counter++)
        {
            nextChild = this.childNodes[counter];
            if((newNode.id.indexOf(nextChild.id) == 0) && (newNode.id != nextChild.id))
                return nextChild.insert(newNode);
            else 
                this.lastInsert++;
        }
        this.childNodes.push(newNode);
    }
    this.retrieve = function(id, guid)
    {
        var nextChild;
        var node;
        for(var counter = 0; counter < this.childNodes.length; counter++)
        {
            nextChild = this.childNodes[counter];
            if(id.indexOf(nextChild.id) == 0)
                if((node = nextChild.retrieve(id, guid)) != -1)
                    return node;
        }
        if (this.guid == guid)
            return this;
        else
            return -1;
    }
    this.show = function ()
    {
        this.row.style.display = "";
    }
    this.hide = function ()
    {
        this.row.style.display = "none";
    }
    this.showTextThreaded = function()
    {
        this.show();    
        this.widget.src = this.board.widgetBaseSrc + "minus.gif";
        this.widget.alt =  L_strCollapse_Text;
        this.body.style.display = "";
    }
    this.showText = function()
    {
        this.widget.src = this.board.widgetBaseSrc + "minus.gif";
        this.widget.alt =  L_strCollapse_Text;
        this.body.style.display = "";
    }
    this.hideText = function ()
    {
        this.widget.src = this.board.widgetBaseSrc + "plus.gif";
        this.widget.alt =  L_strExpand_Text;
        if (browseris.nav6)
            this.body.setAttribute('style', 'display: none');
        else
            this.body.style.display = "none";
    }
    this.showTextAndChildren = function(recurse)
    {
        this.showTextThreaded();
        if(recurse)
        {
            var nextChild;
            for(var counter = 0; counter < this.childNodes.length; counter++)
            {
                nextChild = this.childNodes[counter];
                nextChild.showTextAndChildren(recurse);            
            }
        } else
        {
            var nextChild;
            for(var counter = 0; counter < this.childNodes.length; counter++)
            {
                nextChild = this.childNodes[counter];
                nextChild.show();
            }
        }
    }
    this.hideTextAndChildren = function() 
    {
        this.hideText();
        var nextChild;
        for(var counter = 0; counter < this.childNodes.length; counter++)
        {
            nextChild = this.childNodes[counter];
            nextChild.hide()
            nextChild.hideTextAndChildren();
        }        
    }
    this.setReplyCountAndIndent = function(recurse)
    {
        this.reply.innerHTML = this.replyCount;
        this.indent.setAttribute("width",this.depth*16); 
        if(recurse)
        {
            var nextChild;
            for(var counter = 0; counter < this.childNodes.length; counter++)
            {
                nextChild = this.childNodes[counter];
                nextChild.setReplyCountAndIndent(recurse);            
            }
        }
    }
    this.hideText();
    this.widget.parentNode.style.cursor='hand';
    this.widgetPadding.style.paddingTop='2px';      
}
function CheckNav()
{
    if (browseris.nav4)
    {
        var L_ShowMsg_Txt="\u89c6\u56fe\u9700\u8981\u4f7f\u7528 Internet Explorer \u6216 Netscape 6.0 for Windows\u3002\u8bf7\u4f7f\u7528\u6458\u8981\u89c6\u56fe";
        alert(L_ShowMsg_Txt);
        window.back();
        history.back();
    }
    return;
}
function ExpCollGroup(groupName, imgName)
{
    if (browseris.nav)
        return;
    viewTable = document.getElementById("titl"+groupName).parentNode;
    tbodyTags = viewTable.getElementsByTagName("TBODY");
    numElts = tbodyTags.length;
    len = groupName.length;
    img = document.getElementById(imgName);
    srcPath = img.src;
    index = srcPath.lastIndexOf("/");
    imgName = srcPath.slice(index+1);
    if (imgName =='plus.gif')
    {
        fOpen = true;
        displayStr = "";
        img.src = '/_layouts/images/minus.gif';
    }
    else
    {
        fOpen = false;
        displayStr = "none";
        img.src = '/_layouts/images/plus.gif';
    }
    for(var i=0;i<numElts;i++)
    {
        var childObj = tbodyTags[i];
        if ( (childObj.id !=null)
                    && (childObj.id.length > len +4)
                    && (groupName == childObj.id.slice(4).substr(0,len)) )
        {
            if (fOpen)
            {
                index = childObj.id.indexOf("_", len+4);
                if (index!=-1)
                {
                    index = childObj.id.indexOf("_", index+1);
                    if (index!=-1)
                        continue;
                }
            }
            childObj.style.display = displayStr;
            if (fOpen && childObj.id.substr(0,4) == "titl")
            {
                imgObj = document.getElementById("img_" + childObj.id.slice(4));
                imgObj.src = '/_layouts/images/plus.gif';
            }
        }
    }
}
function ExpGroupBy(formObj)
{
    if (browseris.nav)
        return;
    if ((browseris.w3c) && (!browseris.ie)) {
        document.all = document.getElementsByTagName("*");  
    }
    docElts = document.all;
    numElts = docElts.length;
    img = formObj.children[0];
    srcPath = img.src;
    index = srcPath.lastIndexOf("/");
    imgName = srcPath.slice(index+1);
    if (imgName =='plus.gif')
    {
        fOpen = true;
        displayStr = "block";
        img.src = '/_layouts/images/minus.gif';
    }
    else
    {
        fOpen = false;
        displayStr = "none";
        img.src = '/_layouts/images/plus.gif';
    }
    oldName = img.name;
    img.name = img.alt;
    img.alt = oldName;
    spanNode = img;
    while(spanNode != null)
    {
        spanNode = spanNode.parentElement;
        if (spanNode != null &&
            spanNode.id != null &&
            spanNode.id.length > 5 &&
            spanNode.id.substr(0, 5) == "group")
            break;
    }
    parentNode = spanNode;
    while(parentNode != null)
    {
        parentNode = parentNode.parentElement;
        if (parentNode != null &&
            parentNode.tagName == "TABLE")
            break;
    }
    lastNode = null;
    if (parentNode != null)
    {
        lastNode = parentNode.lastChild;
        if (lastNode != null && lastNode.tagName == "TBODY")
            lastNode = lastNode.lastChild;
        if (lastNode != null && lastNode.tagName == "TR" && lastNode.lastChild != null)
            lastNode = lastNode.lastChild;
    }
    for(var i=0;i<numElts;i++)
    {
        var childObj = docElts(i);
        if (childObj == spanNode)
            break;
    }
    ID = spanNode.id.slice(5);
    for(var j=i + 1; j<numElts; j++)
    {
        var childObj = docElts(j);        
        if (childObj.id.length > 5 &&
            childObj.id.substr(0, 5) == "group")
        {
            curID = childObj.id.slice(5);
            if (curID <= ID)
                return;
        }
        if (childObj != img && 
            childObj.tagName=="IMG" &&
            childObj.src && 
            childObj.src.slice(childObj.src.length - 25) == '/_layouts/images/plus.gif')
        {
            childObj.src = '/_layouts/images/minus.gif';
            oldName = childObj.name;
            childObj.name = childObj.alt;
            childObj.alt = oldName;
        }
        if (childObj.tagName == spanNode.tagName &&
            childObj.id != "footer")
        {
            childObj.style.display = displayStr;
        }
        if ((childObj.tagName == "TABLE" && lastNode == null) || childObj == lastNode)
            break;
    }
}
var BASETYPE_GENERIC_LIST           =   0	;
var BASETYPE_DOCUMENT_LIBRARY       =	1	;
var BASETYPE_SHARED_TEMPLATES       =	2	;
var BASETYPE_DISCUSSION	            =	3	;
var BASETYPE_SURVEY                 =	4	;
var BASETYPE_ISSUE                 =	5	;	
var LISTTEMPLATE_GENERIC_LIST	    =   100	;
var LISTTEMPLATE_DOCUMENT_LIBRARY   =	101	;
var LISTTEMPLATE_SURVEY             =	102	;
var LISTTEMPLATE_LINKS              =	103	;
var LISTTEMPLATE_ANNOUNCEMENTS      =	104	;
var LISTTEMPLATE_CONTACTS           =	105	;
var LISTTEMPLATE_EVENTS             =	106	;	
var LISTTEMPLATE_TASKS              =	107	;
var LISTTEMPLATE_DISCUSSION         =	108	;
var LISTTEMPLATE_IMAGE_LIBRARY      =	109	;
var LISTTEMPLATE_ISSUE_TRACKER      =   1100;
var LISTTEMPLATE_MEETINGS           =	200	;
var LISTTEMPLATE_MEETING_USER       =	202	;
var LISTTEMPLATE_MY_DOCUMENTS       =   2002;
var LISTTEMPLATE_PRIVATE_DOCUMENTS  =   2003;
function SzExtension(szHref)
{
    var sz = new String(szHref);
    var re = /^.*\.([^\.]*)$/;
    return sz.replace(re, "$1").toLowerCase();
}
var v_stsOpenDoc = null;
var v_strStsOpenDoc = null;
function StsOpenEnsureEx(szProgId)
{
    if (v_stsOpenDoc == null || v_strStsOpenDoc != szProgId)
    {
//@cc_on
//@if (@_jscript_version >= 5)
//@            try
//@            {
//@                v_stsOpenDoc = new ActiveXObject(szProgId);
//@                v_strStsOpenDoc = szProgId;
//@            } catch(e)
//@            {
//@                v_stsOpenDoc = null;
//@                v_strStsOpenDoc = null;
//@            };
//@else
//@end
    }
    return v_stsOpenDoc;
}
function DispDocItem(ele)
{
    return;
}
function DispDocItemEx(ele, fTransformServiceOn, fShouldTransformExtension, fTransformHandleUrl, strProgId)
{
    if (!browseris.ie || !browseris.win32)
    {
		itemTable = FindSTSMenuTable(ele);
		if (itemTable == null)
			return true;
		var createCtx = new Function("setupMenuContext(" + 
		            itemTable.getAttribute("CTXName") + ");");
		createCtx();
		var RootFolder = GetRootFolder(currentCtx);
		if (itemTable.getAttribute("FSObjType") != 1 &&
			currentCtx.displayFormUrl != null)
		{
			ele.href = currentCtx.displayFormUrl+"?ID="+ 
					itemTable.getAttribute("ItemId") + 
					"&Source=" + GetSource() + RootFolder;
		}
		return true;
    }
    var stsOpen;
    var szHref;
    var szExt;
    var fRet;
    var ele;
    var tblFileDlg = document.getElementById("FileDialogViewTable");            
    if (tblFileDlg != null)
    {
        event.cancelBubble = false;
        event.returnValue = false;
        return;
    }
    szHref = ele.href;
    szExt = SzExtension(szHref);
    if(strProgId != '')
        stsOpen = StsOpenEnsureEx(strProgId);
    if (stsOpen == null)
    {
        if (fTransformServiceOn == 'TRUE' && 
            fShouldTransformExtension == 'TRUE' &&
            fTransformHandleUrl == 'TRUE')
        {
            itemTable = FindSTSMenuTable(ele);
            if (itemTable == null)
                return;
            event.cancelBubble = true;
            event.returnValue = false;
            var getHttpRoot = new Function("return " + itemTable.getAttribute("CTXName") + ".HttpRoot;");
            GoToPage(getHttpRoot() + "/_layouts/" + L_Language_Text +  
                "/htmltrverify.aspx?doc=" + escapeProperly(szHref));
        }
        return;
    }
    fRet = stsOpen.ViewDocument2(window, szHref);
    stsOpen = null;
    if (fRet)
    {
        event.cancelBubble = true;
        event.returnValue = false;
    }
    return;
}
function ViewDoc(url)
{
    return false;
}
function PortalPinToMyPage(eForm, portalUrl, instanceID)
{
    eForm.action = portalUrl + '_vti_bin/portalapi.aspx?Cmd=PinToMyPage';
    eForm.ReturnUrl.value = window.location.href;
    eForm.ListViewUrl.value = MakeMtgInstanceUrl(eForm.ListViewUrl.value, instanceID);
    eForm.submit();
}
var L_CutToolTip_TEXT = "\u526a\u5207";
var L_CopyToolTip_TEXT = "\u590d\u5236";
var L_PasteToolTip_TEXT = "\u7c98\u8d34";
var L_BoldToolTip_TEXT = "\u52a0\u7c97";
var L_ItalicToolTip_TEXT = "\u503e\u659c";
var L_UnderlineToolTip_TEXT = "\u4e0b\u5212\u7ebf";
var L_JustifyLeftToolTip_TEXT = "\u5de6\u5bf9\u9f50";
var L_JustifyCenterToolTip_TEXT = "\u5c45\u4e2d";
var L_JustifyRightToolTip_TEXT = "\u53f3\u5bf9\u9f50";
var L_OrderedListToolTip_TEXT = "\u7f16\u53f7\u5217\u8868";
var L_UnorderedListToolTip_TEXT = "\u9879\u76ee\u7b26\u53f7\u5217\u8868";
var L_OutdentToolTip_TEXT = "\u51cf\u5c11\u7f29\u8fdb\u91cf";
var L_IndentToolTip_TEXT = "\u589e\u52a0\u7f29\u8fdb\u91cf";
var L_ForeColorToolTip_TEXT = "\u6587\u672c\u989c\u8272";
var L_BackColorToolTip_TEXT = "\u80cc\u666f\u8272";
var L_LTRToolTip_TEXT = "\u4ece\u5de6\u5411\u53f3";
var L_RTLToolTip_TEXT = "\u4ece\u53f3\u5411\u5de6";
var L_CreateLinkToolTip_TEXT = "\u63d2\u5165\u8d85\u94fe\u63a5";
var L_InsertImageToolTip_TEXT = "\u63d2\u5165\u56fe\u50cf";
var L_FontNameLabel_TEXT = "\u5b57\u4f53";
var L_FontNameToolTip_TEXT = "\u5b57\u4f53";
var L_FontSizeLabel_TEXT	 = "\u5927\u5c0f";
var L_FontSizeToolTip_TEXT = "\u5b57\u53f7";
var L_ExampleText_TEXT = "\u793a\u4f8b\u6587\u672c";
var L_EditorIFrameTitle_TEXT = "RTF \u7f16\u8f91\u5668";
var L_Black_TEXT = "\u9ed1\u8272";
var L_Brown_TEXT = "\u8910\u8272";
var L_OliveGreen_TEXT = "\u6a44\u6984\u8272";
var L_DarkGreen_TEXT = "\u6df1\u7eff\u8272";
var L_DarkTeal_TEXT = "\u6df1\u9752\u8272";
var L_DarkBlue_TEXT = "\u6df1\u84dd\u8272";
var L_Indigo_TEXT = "\u975b\u84dd\u8272";
var L_Gray80_TEXT = "\u7070\u8272 80%";
var L_DarkRed_TEXT = "\u6df1\u7ea2\u8272";
var L_Orange_TEXT = "\u6a59\u8272";
var L_DarkYellow_TEXT = "\u6df1\u9ec4\u8272";
var L_Green_TEXT = "\u7eff\u8272";
var L_Teal_TEXT = "\u9752\u8272";
var L_Blue_TEXT = "\u84dd\u8272";
var L_BlueGray_TEXT = "\u84dd\u7070\u8272";
var L_Gray50_TEXT = "\u7070\u8272 50% ";
var L_Red_TEXT = "\u7ea2\u8272";
var L_LightOrange_TEXT = "\u6d45\u6a59\u8272";
var L_Lime_TEXT = "\u9178\u6a59\u8272";
var L_SeaGreen_TEXT = "\u6d77\u7eff\u8272";
var L_Aqua_TEXT = "\u6c34\u7eff\u8272";
var L_LightBlue_TEXT = "\u6d45\u84dd\u8272";
var L_Violet_TEXT = "\u7d2b\u7f57\u5170\u8272";
var L_Gray40_TEXT = "\u7070\u8272 40%";
var L_Pink_TEXT = "\u7c89\u7ea2\u8272";
var L_Gold_TEXT = "\u91d1\u8272";
var L_Yellow_TEXT = "\u9ec4\u8272";
var L_BrightGreen_TEXT = "\u9c9c\u7eff\u8272";
var L_Turquoise_TEXT = "\u9752\u7eff\u8272";
var L_SkyBlue_TEXT = "\u5929\u84dd\u8272";
var L_Plum_TEXT = "\u6885\u7ea2\u8272";
var L_Gray25_TEXT = "\u7070\u8272 25%";
var L_Rose_TEXT = "\u73ab\u7470\u7ea2";
var L_Tan_TEXT = "\u8336\u8272";
var L_LightYellow_TEXT = "\u6d45\u9ec4\u8272";
var L_LightGreen_TEXT = "\u6d45\u7eff\u8272";
var L_LightTurquoise_TEXT = "\u6d45\u9752\u7eff\u8272";
var L_PaleBlue_TEXT = "\u6de1\u84dd\u8272";
var L_Lavender_TEXT = "\u6de1\u7d2b\u8272";
var L_White_TEXT = "\u767d\u8272";
var L_Font1_TEXT = "\u5b8b\u4f53";
var L_Font2_TEXT = "Courier";
var L_Font3_TEXT = "Simsun";
var L_Font4_TEXT = "\u6b21\u6570";
var L_Font5_TEXT = "\u5b8b\u4f53";
var L_Font6_TEXT = "";
var L_Font7_TEXT = "";
var L_Font8_TEXT = "";
var L_BoldKey_TEXT = "B"; 
var L_BoldShiftKey_TEXT = "false"; 
var L_BoldAltKey_TEXT = "false"; 
var L_ItalicKey_TEXT = "I"; 
var L_ItalicShiftKey_TEXT = "false"; 
var L_ItalicAltKey_TEXT = "false"; 
var L_UnderlineKey_TEXT = "U"; 
var L_UnderlineShiftKey_TEXT = "false"; 
var L_UnderlineAltKey_TEXT = "false"; 
var L_JustifyLeftKey_TEXT = "L"; 
var L_JustifyLeftShiftKey_TEXT = "false"; 
var L_JustifyLeftAltKey_TEXT = "false"; 
var L_JustifyCenterKey_TEXT = "E"; 
var L_JustifyCenterShiftKey_TEXT = "false"; 
var L_JustifyCenterAltKey_TEXT = "false"; 
var L_JustifyRightKey_TEXT = "R"; 
var L_JustifyRightShiftKey_TEXT = "false"; 
var L_JustifyRightAltKey_TEXT = "false"; 
var L_SelectFontNameKey_TEXT = "F"; 
var L_SelectFontNameShiftKey_TEXT = "true"; 
var L_SelectFontNameAltKey_TEXT = "false"; 
var L_SelectFontSizeKey_TEXT = "P"; 
var L_SelectFontSizeShiftKey_TEXT = "true"; 
var L_SelectFontSizeAltKey_TEXT = "false"; 
var L_OutdentKey_TEXT = "M"; 
var L_OutdentShiftKey_TEXT = "true"; 
var L_OutdentAltKey_TEXT = "false"; 
var L_IndentKey_TEXT = "M"; 
var L_IndentShiftKey_TEXT = "false"; 
var L_IndentAltKey_TEXT = "false"; 
var L_UnorderedListKey_TEXT = "L"; 
var L_UnorderedListShiftKey_TEXT = "true"; 
var L_UnorderedListAltKey_TEXT = "false"; 
var L_OrderedListKey_TEXT = "E"; 
var L_OrderedListShiftKey_TEXT = "true"; 
var L_OrderedListAltKey_TEXT = "false"; 
var L_CreateLinkKey_TEXT = "K"; 
var L_CreateLinkShiftKey_TEXT = "false"; 
var L_CreateLinkAltKey_TEXT = "false"; 
var L_SelectForeColorKey_TEXT = "C"; 
var L_SelectForeColorShiftKey_TEXT = "true"; 
var L_SelectForeColorAltKey_TEXT = "false"; 
var L_SelectBackColorKey_TEXT = "W"; 
var L_SelectBackColorShiftKey_TEXT = "true"; 
var L_SelectBackColorAltKey_TEXT = "false"; 
var L_InsertImageKey_TEXT = "G"; 
var L_InsertImageShiftKey_TEXT = "true"; 
var L_InsertImageAltKey_TEXT = "false"; 
var L_LTRKey_VALUE = 190; 
var L_RTLKey_VALUE = 188; 
var g_strRTEUnselectedClassName = "ms-rtetoolbarunsel";
var g_strRTESelectedClassName = "ms-rtetoolbarsel";
var g_strRTEDisabledClassName = "ms-rtetoolbardis";
var g_strRTEHoverClassName = "ms-rtetoolbarhov";
var g_strRTETextEditorPullDownMenuID = "RTETextEditorPullDownMenu";
var g_strRTEDialogHelperID = "RTEDialogHelper";
var g_strRTECutMnemonic = "Cut";
var g_strRTECopyMnemonic = "Copy";
var g_strRTEPasteMnemonic = "Paste";
var g_strRTEFontNameMnemonic = "FontName";
var g_strRTEFontSizeMnemonic = "FontSize";
var g_strRTEBoldMnemonic = "Bold";
var g_strRTEItalicMnemonic = "Italic";
var g_strRTEUnderlineMnemonic = "Underline";
var g_strRTEJustifyLeftMnemonic = "JustifyLeft";
var g_strRTEJustifyCenterMnemonic = "JustifyCenter";
var g_strRTEJustifyRightMnemonic = "JustifyRight";
var g_strRTEOrderedListMnemonic = "InsertOrderedList";
var g_strRTEUnorderedListMnemonic = "InsertUnorderedList";
var g_strRTEOutdentMnemonic = "Outdent";
var g_strRTEIndentMnemonic = "Indent";
var g_strRTEForeColorMnemonic = "ForeColor";
var g_strRTEBackColorMnemonic = "BackColor";
var g_strRTELTRMnemonic = "LTR";
var g_strRTERTLMnemonic = "RTL";
var g_strRTECreateLinkMnemonic = "CreateLink";
var g_strRTEInsertImageMnemonic = "InsertImage";
var g_strRTERestrictedModeAttributeName = "RestrictedMode";
var g_strRTEAllowHyperlinkAttributeName = "AllowHyperlink";
var g_strRTEBaseElementIDAttributeName = "BaseElementID";
var g_strRTEWebLocaleAttributeName = "WebLocale";
var g_strRTEButtonMnemonicAttributeName = "ButtonMnemonic";
var g_strRTECommandToExecuteAttributeName = "CommandToExecute";
var g_strRTECommandValueAttributeName = "CommandValue";
var g_strRTEMenuItemBaseName = "MenuItem";
var g_strRTEMenuItemAttributeName = "MenuItem";
var g_strRTEMenuOpeningAttributeName = "MenuOpening";
var g_strRTEMenuTableElementName = "MenuTable";
var g_strRTEBegBoldItalicToken = "%BEGBI%";
var g_strRTEEndBoldItalicToken = "%ENDBI%";
var g_strRTEFontNameToken = "%FONTNAME%";
var g_strRTEFontSizeToken = "%FONTSIZE%";
var g_ntRTEElement = 1;
var g_ntRTEText = 3;
var g_iLineHeight = 14;
var g_rgstRTETextEditorSelectionType = new Array();
var g_rgrngRTETextEditorSelection = new Array();
function RTE_SaveSelection(strBaseElementID)
{
	var docEditor = RTE_GetEditorDocument(strBaseElementID);
	g_rgrngRTETextEditorSelection[strBaseElementID] = docEditor.selection.createRange();
	g_rgstRTETextEditorSelectionType[strBaseElementID] = docEditor.selection.type;
}
function RTE_RestoreSelection(strBaseElementID)
{
	var sel = g_rgrngRTETextEditorSelection[strBaseElementID];
	if (null != sel)
	{
		sel.select();
	}
}
function RTE_GetSelection(strBaseElementID)
{
	return g_rgrngRTETextEditorSelection[strBaseElementID];
}
var g_elemRTELastTextAreaConverted = null;
var g_strRTETextEditorWithTheFocus = null;
var g_strRTEPrevTextEditor = null;
var g_strRTEEditorFirstFocus = null;
var g_rgstrRTEAllEditorsInThePage = new Array();
var g_fRTEDialogIsOpen = false;
function RTE_GetEditorIFrameID(strBaseElementID)
{
	return strBaseElementID + "_iframe";
}
function RTE_GetEditorTextArea(strBaseElementID)
{
	var elemTextArea = document.getElementById(strBaseElementID);
	return elemTextArea;
}
function RTE_GetEditorIFrame(strBaseElementID)
{
	var ifmEditor = null;
	if ((null != document.frames) && (document.frames.length > 0))
	{
		var ifmContainer = document.getElementById(RTE_GetEditorIFrameID(strBaseElementID));
		if (ifmContainer != null)
		{
		   	ifmEditor = document.frames(RTE_GetEditorIFrameID(strBaseElementID));
		}
	}
	return ifmEditor;
}
function RTE_GetEditorElement(strBaseElementID)
{
	var elemEditorIFrame = document.getElementById(RTE_GetEditorIFrameID(strBaseElementID));
	return elemEditorIFrame;
}
function RTE_GetEditorDocument(strBaseElementID)
{
	var ifmEditor = RTE_GetEditorIFrame(strBaseElementID);
	if (null == ifmEditor)
	{
		return null;
	}
	var docEditor = ifmEditor.document;
	return docEditor;
}
function RTE_GetWebLocale(strBaseElementID)
{
	return RTE_GetEditorDocument(strBaseElementID).body.getAttribute(g_strRTEWebLocaleAttributeName);
}
function RTE_IsInRestrictedMode(strBaseElementID)
{
	var docEditor = RTE_GetEditorDocument(strBaseElementID);
	if (null != docEditor.body.getAttribute(g_strRTERestrictedModeAttributeName))
	{
		return true;
	}
	return false;
}
function RTE_IsHyperlinkAllowed(strBaseElementID)
{
	var docEditor = RTE_GetEditorDocument(strBaseElementID);
	if (null != docEditor.body.getAttribute(g_strRTEAllowHyperlinkAttributeName))
	{
		return true;
	}
	return false;
}
function RTE_ShouldShowDirection()
{
	return true;
}
function RTE_EditorWithTheFocus()
{
	return g_strRTETextEditorWithTheFocus;
}
function RTE_PrevEditor()
{
	return g_strRTEPrevTextEditor;
}
function RTE_GetRichEditTextOnly(strBaseElementID)
{
	return RTE_GetEditorDocument(strBaseElementID).body.innerText;
}
function RTE_GiveEditorFocus(strBaseElementID)
{
	RTE_GetEditorIFrame(strBaseElementID).focus();
}
function RTE_GiveEditorFirstFocus(strBaseElementID)
{
	RTE_GetEditorIFrame(strBaseElementID).focus();
	g_strRTEEditorFirstFocus = strBaseElementID;
}
function RTE_ConvertTextAreaToRichEdit(
            strBaseElementID,
            fRestrictedMode,
            fAllowHyperlink,
            strDirection,
            strWebLocale)
{
	;
	if (!(browseris.ie5up && browseris.win32))
	{
		return;
	}
	var elemTextArea = RTE_GetEditorTextArea(strBaseElementID);
	var strHtmlToEdit = elemTextArea.innerText;
	if ((null == strHtmlToEdit) || (0 == strHtmlToEdit.length))
	{
		strHtmlToEdit = "<div></div>";
	}
	g_elemRTELastTextAreaConverted = elemTextArea;
	window.attachEvent("onload", new Function("RTE_TextAreaWindow_OnLoad('" + strBaseElementID + "');"));
	var strHtmlToAppend = "";
	strHtmlToAppend += RTE_GenerateToolBarHtml(strBaseElementID, strWebLocale, elemTextArea, fRestrictedMode, fAllowHyperlink);
	strHtmlToAppend += RTE_GenerateIFrameEditorHtml(strBaseElementID, elemTextArea, fRestrictedMode, fAllowHyperlink);
	elemTextArea.insertAdjacentHTML("afterEnd", strHtmlToAppend);
	elemTextArea.onfocus = new Function("RTE_TextArea_OnFocus('" + strBaseElementID + "')");
	elemTextArea.style.display = "none";
	window.attachEvent("onbeforeunload", new Function("RTE_TransferIFrameContentsToTextArea('" + strBaseElementID + "');"));
	var strEditorHtml = "<html><head><link rel=\"stylesheet\" type=\"text/css\" href=\"";
	strEditorHtml += RTE_GetServerRelativeStylesheetUrl("ows.css", strWebLocale);
	strEditorHtml += "\"></head><body class=\"ms-formbody\" style=\"border: 1px solid black; margin: 1px;\">";
	strEditorHtml += strHtmlToEdit;
	strEditorHtml += "</body></html>";
	var docEditor = RTE_GetEditorDocument(strBaseElementID);
	docEditor.designMode = "on";
	docEditor = RTE_GetEditorDocument(strBaseElementID);
	docEditor.open("text/html", "replace");
	docEditor.write(strEditorHtml);
	docEditor.close();
	docEditor = RTE_GetEditorDocument(strBaseElementID);
	docEditor.body.scroll = "yes";
	docEditor.body.wordWrap = false;
	docEditor.body.onkeydown = new Function("RTE_OnKeyDown('" + strBaseElementID + "', this)");
	docEditor.body.onkeyup = new Function("RTE_OnKeyUp('" + strBaseElementID + "', this)");
	docEditor.body.onmouseup = new Function("RTE_OnMouseUp('" + strBaseElementID + "')");
	docEditor.body.oncontextmenu = new Function("return false");
	docEditor.body.onblur = new Function("RTE_OnBlur('" + strBaseElementID + "');");
	if (fRestrictedMode)
	{
		docEditor.body.ondragenter = new Function("RTE_OnDragEnter(this);");
		docEditor.body.ondragover = new Function("RTE_OnDragOver(this);");
		docEditor.body.ondragdrop = new Function("RTE_OnDrop(this);");
	}
	RTE_GetEditorElement(strBaseElementID).onfocus = new Function("RTE_OnFocus('" + strBaseElementID + "');");
	if(strDirection != "")
	{
	    docEditor.dir = strDirection;
	}
	else
	{
	    docEditor.dir = document.dir;
	}
	if (fRestrictedMode)
	{
		docEditor.body.setAttribute(g_strRTERestrictedModeAttributeName, "true");
		docEditor.body.onpaste = new Function("RTE_OnPaste_Restricted('" + strBaseElementID + "', this);");
	}
	if (fAllowHyperlink)
	{
	    docEditor.body.setAttribute(g_strRTEAllowHyperlinkAttributeName, "true");
	}
	docEditor.body.setAttribute(g_strRTEBaseElementIDAttributeName, strBaseElementID);
	docEditor.body.setAttribute(g_strRTEWebLocaleAttributeName, strWebLocale);
	g_rgstrRTEAllEditorsInThePage[g_rgstrRTEAllEditorsInThePage.length] = strBaseElementID;
	RTE_GiveEditorFocus(strBaseElementID);
	RTE_ResetAllToolBarStates(strBaseElementID);
}
function RTE_DisableToolBar(strBaseElementID)
{
		var fRestrictedMode = RTE_IsInRestrictedMode(strBaseElementID);
		var fAllowHyperlink = RTE_IsHyperlinkAllowed(strBaseElementID);
		if (!fRestrictedMode)
		{
			RTE_TB_SetButtonDisabled(RTE_TB_GetToolBarButton(strBaseElementID, g_strRTECutMnemonic));
			RTE_TB_SetButtonDisabled(RTE_TB_GetToolBarButton(strBaseElementID, g_strRTECopyMnemonic));
			RTE_TB_SetButtonDisabled(RTE_TB_GetToolBarButton(strBaseElementID, g_strRTEPasteMnemonic));
		}
		RTE_TB_SetButtonDisabled(RTE_TB_GetToolBarButton(strBaseElementID, g_strRTEFontNameMnemonic));
		RTE_TB_SetButtonDisabled(RTE_TB_GetToolBarButton(strBaseElementID, g_strRTEFontSizeMnemonic));
		RTE_TB_SetButtonDisabled(RTE_TB_GetToolBarButton(strBaseElementID, g_strRTEBoldMnemonic));
		RTE_TB_SetButtonDisabled(RTE_TB_GetToolBarButton(strBaseElementID, g_strRTEItalicMnemonic));
		RTE_TB_SetButtonDisabled(RTE_TB_GetToolBarButton(strBaseElementID, g_strRTEUnderlineMnemonic));
		RTE_TB_SetButtonDisabled(RTE_TB_GetToolBarButton(strBaseElementID, g_strRTEJustifyLeftMnemonic));
		RTE_TB_SetButtonDisabled(RTE_TB_GetToolBarButton(strBaseElementID, g_strRTEJustifyCenterMnemonic));
		RTE_TB_SetButtonDisabled(RTE_TB_GetToolBarButton(strBaseElementID, g_strRTEJustifyRightMnemonic));
		RTE_TB_SetButtonDisabled(RTE_TB_GetToolBarButton(strBaseElementID, g_strRTEOrderedListMnemonic));
		RTE_TB_SetButtonDisabled(RTE_TB_GetToolBarButton(strBaseElementID, g_strRTEUnorderedListMnemonic));
		RTE_TB_SetButtonDisabled(RTE_TB_GetToolBarButton(strBaseElementID, g_strRTEOutdentMnemonic));
		RTE_TB_SetButtonDisabled(RTE_TB_GetToolBarButton(strBaseElementID, g_strRTEIndentMnemonic));
		RTE_TB_SetButtonDisabled(RTE_TB_GetToolBarButton(strBaseElementID, g_strRTEForeColorMnemonic));
		RTE_TB_SetButtonDisabled(RTE_TB_GetToolBarButton(strBaseElementID, g_strRTEBackColorMnemonic));
		if (RTE_ShouldShowDirection())
		{
			RTE_TB_SetButtonDisabled(RTE_TB_GetToolBarButton(strBaseElementID, g_strRTELTRMnemonic));
			RTE_TB_SetButtonDisabled(RTE_TB_GetToolBarButton(strBaseElementID, g_strRTERTLMnemonic));
		}
		if (!fRestrictedMode || fAllowHyperlink)
		{
			RTE_TB_SetButtonDisabled(RTE_TB_GetToolBarButton(strBaseElementID, g_strRTECreateLinkMnemonic));
		}
		if (!fRestrictedMode)
		{
			RTE_TB_SetButtonDisabled(RTE_TB_GetToolBarButton(strBaseElementID, g_strRTEInsertImageMnemonic));
		}
}
function RTE_ResetAllToolBarStates(strBaseElementID)
{
	if ((browseris.ie55up) && (RTE_EditorWithTheFocus() != strBaseElementID) && (RTE_ToolBarButtonWithTheFocus() == null) && (!RTE_DD_MenuIsOpen()) 
	     && (!g_fRTEDialogIsOpen))
	{
		RTE_DisableToolBar(strBaseElementID);
		return;
	}
	var docEditor = RTE_GetEditorDocument(strBaseElementID);
	var fRestrictedMode = RTE_IsInRestrictedMode(strBaseElementID);
	var fAllowHyperlink = RTE_IsHyperlinkAllowed(strBaseElementID);
	if (!fRestrictedMode)
	{
		RTE_TB_SetEnabledFromCommandEnabled(strBaseElementID, docEditor, g_strRTECutMnemonic, true);
		RTE_TB_SetEnabledFromCommandEnabled(strBaseElementID, docEditor, g_strRTECopyMnemonic, true);
		RTE_TB_ClearButtonDisabled(RTE_TB_GetToolBarButton(strBaseElementID, g_strRTEPasteMnemonic));
	}
	RTE_TB_ClearButtonDisabled(RTE_TB_GetToolBarButton(strBaseElementID, g_strRTEFontNameMnemonic));
	RTE_TB_ClearButtonDisabled(RTE_TB_GetToolBarButton(strBaseElementID, g_strRTEFontSizeMnemonic));
	RTE_TB_ClearButtonDisabled(RTE_TB_GetToolBarButton(strBaseElementID, g_strRTEBoldMnemonic));
 	RTE_TB_SetCheckFromCommandValue(strBaseElementID, docEditor, g_strRTEBoldMnemonic);
	RTE_TB_ClearButtonDisabled(RTE_TB_GetToolBarButton(strBaseElementID, g_strRTEItalicMnemonic));
	RTE_TB_SetCheckFromCommandValue(strBaseElementID, docEditor, g_strRTEItalicMnemonic);
	RTE_TB_ClearButtonDisabled(RTE_TB_GetToolBarButton(strBaseElementID, g_strRTEUnderlineMnemonic));
	RTE_TB_SetCheckFromCommandValue(strBaseElementID, docEditor, g_strRTEUnderlineMnemonic);
	RTE_TB_ClearButtonDisabled(RTE_TB_GetToolBarButton(strBaseElementID, g_strRTEJustifyLeftMnemonic));
	RTE_TB_SetCheckFromCommandValue(strBaseElementID, docEditor, g_strRTEJustifyLeftMnemonic);
	RTE_TB_ClearButtonDisabled(RTE_TB_GetToolBarButton(strBaseElementID, g_strRTEJustifyCenterMnemonic));
	RTE_TB_SetCheckFromCommandValue(strBaseElementID, docEditor, g_strRTEJustifyCenterMnemonic);
	RTE_TB_ClearButtonDisabled(RTE_TB_GetToolBarButton(strBaseElementID, g_strRTEJustifyRightMnemonic));
	RTE_TB_SetCheckFromCommandValue(strBaseElementID, docEditor, g_strRTEJustifyRightMnemonic);
	RTE_TB_ClearButtonDisabled(RTE_TB_GetToolBarButton(strBaseElementID, g_strRTEOrderedListMnemonic));
	RTE_TB_SetCheckFromCommandValue(strBaseElementID, docEditor, g_strRTEOrderedListMnemonic);
	RTE_TB_ClearButtonDisabled(RTE_TB_GetToolBarButton(strBaseElementID, g_strRTEUnorderedListMnemonic));
	RTE_TB_SetCheckFromCommandValue(strBaseElementID, docEditor, g_strRTEUnorderedListMnemonic);
	RTE_TB_ClearButtonDisabled(RTE_TB_GetToolBarButton(strBaseElementID, g_strRTEOutdentMnemonic));
	RTE_TB_ClearButtonDisabled(RTE_TB_GetToolBarButton(strBaseElementID, g_strRTEIndentMnemonic));
	RTE_TB_ClearButtonDisabled(RTE_TB_GetToolBarButton(strBaseElementID, g_strRTEForeColorMnemonic));
	RTE_TB_ClearButtonDisabled(RTE_TB_GetToolBarButton(strBaseElementID, g_strRTEBackColorMnemonic));
	if (RTE_ShouldShowDirection())
	{
		RTE_TB_ClearButtonDisabled(RTE_TB_GetToolBarButton(strBaseElementID, g_strRTELTRMnemonic));
		RTE_TB_ClearButtonDisabled(RTE_TB_GetToolBarButton(strBaseElementID, g_strRTERTLMnemonic));
	}
	if (!fRestrictedMode || fAllowHyperlink)
	{
		RTE_TB_SetEnabledFromCommandEnabled(strBaseElementID, docEditor, g_strRTECreateLinkMnemonic, true);
	}
	if (!fRestrictedMode)
	{
		RTE_TB_ClearButtonDisabled(RTE_TB_GetToolBarButton(strBaseElementID, g_strRTEInsertImageMnemonic));
	}
}
function RTE_TransferTextAreaContentsToIFrame(strBaseElementID)
{
	var elemTextArea = RTE_GetEditorTextArea(strBaseElementID);
	var strHtmlToEdit = elemTextArea.innerText;
	var docEditor = RTE_GetEditorDocument(strBaseElementID);
	if (null == docEditor)
		return;
	if ((null == strHtmlToEdit) || (0 == strHtmlToEdit.length))
	{
		strHtmlToEdit = "<div></div>";
	}
	docEditor.body.innerHTML = strHtmlToEdit;
	if (strBaseElementID == g_strRTEEditorFirstFocus)
	{
	   var tr = docEditor.body.createTextRange();
	   tr.collapse(true);
	   tr.select();
	   g_strRTEEditorFirstFocus = null;
	}
}
function RTE_TransferIFrameContentsToTextArea(strBaseElementID)
{
	var strHtml, strText;
	var elemTextArea = RTE_GetEditorTextArea(strBaseElementID);
	var docEditor = RTE_GetEditorDocument(strBaseElementID);
	if (null == docEditor)
		return; 
	strHtml = docEditor.body.innerHTML;
	strText =  docEditor.body.innerText;
	if (0 >= strText.length)
	{
		strHtml = "";
	}
	elemTextArea.innerText = strHtml;
}
function RTE_TextAreaWindow_OnLoad(strBaseElementID)
{
	;
	RTE_TransferTextAreaContentsToIFrame(strBaseElementID);
}
function RTE_TextArea_OnFocus(strBaseElementID)
{
	;
	RTE_GiveEditorFocus(strBaseElementID);
}
function RTE_OnFocus(strBaseElementID)
{
	;
	g_strRTETextEditorWithTheFocus = strBaseElementID;
	if ((g_strRTEPrevTextEditor != null) && (g_strRTEPrevTextEditor.length > 0) && (g_strRTEPrevTextEditor != strBaseElementID))
	{
		RTE_DisableToolBar(g_strRTEPrevTextEditor);
	}
	RTE_StartResetToolBarTimer(strBaseElementID);
}
function RTE_OnBlur(strBaseElementID)
{
	;
	RTE_SaveSelection(strBaseElementID);
	g_strRTEPrevTextEditor = g_strRTETextEditorWithTheFocus;
	g_strRTETextEditorWithTheFocus = null;
	RTE_StartResetToolBarTimer(strBaseElementID);
}
function RTE_OnDragEnter(elemThis)
{
	;
	var evtThis = elemThis.document.parentWindow.event;
	if (null != evtThis)
	{
		evtThis.dataTransfer.dropEffect = "none";
		evtThis.returnValue = false;
	}
}
function RTE_OnDragOver(elemThis)
{
	;
	var evtThis = elemThis.document.parentWindow.event;
	if (null != evtThis)
	{
		evtThis.dataTransfer.dropEffect = "none";
		evtThis.returnValue = false;
	}
}
function RTE_OnDrop(elemThis)
{
	;
	var evtThis = elemThis.document.parentWindow.event;
	if (null != evtThis)
	{
		evtThis.dataTransfer.dropEffect = "none";
		evtThis.returnValue = false;
	}
}
function RTE_FInterpretTextAsBoolean(strBoolVal)
{
   if (strBoolVal.toLowerCase() == "true")
      return true;
   else
      return false;
}
function RTE_OnKeyDown(strBaseElementID, elem)
{
	RTE_SaveSelection(strBaseElementID);
	var fRestrictedMode = RTE_IsInRestrictedMode(strBaseElementID);
	var fAllowHyperlink = RTE_IsHyperlinkAllowed(strBaseElementID);
	var evtSource = elem.document.parentWindow.event;
	var nKeyCode = evtSource.keyCode;
	var fAltKey = evtSource.altKey;
	var fCtrlKey = evtSource.ctrlKey;
	var fShiftKey = evtSource.shiftKey;
   if (browseris.ie5up && !browseris.ie55up && (!fCtrlKey && !fAltKey && !fShiftKey))
   {
      switch (nKeyCode)
      {
         case 9: 
            var tr = RTE_GetEditorDocument(strBaseElementID).body.createTextRange();
            tr.collapse(true);
            tr.select();
            break;
      }
   }
	if (!fCtrlKey && !fAltKey && fShiftKey)
	{
		switch (nKeyCode)
		{
			case 9: 
				evtSource.returnValue = false;
				document.body.focus();
				RTE_MoveFocusBackwards(RTE_GetEditorTextArea(strBaseElementID), strBaseElementID);
				break;
		}
	}
	else if (fCtrlKey)
	{
		if ((L_BoldKey_TEXT.charCodeAt(0) == nKeyCode)
		   && (RTE_FInterpretTextAsBoolean(L_BoldShiftKey_TEXT) == fShiftKey)
		   && (RTE_FInterpretTextAsBoolean(L_BoldAltKey_TEXT ) == fAltKey)) 
	   {
			evtSource.returnValue = false;
			RTE_TB_GetToolBarButton(strBaseElementID, g_strRTEBoldMnemonic).children(0).click();
	   }
		else if (( L_ItalicKey_TEXT.charCodeAt(0) == nKeyCode)
		   && (RTE_FInterpretTextAsBoolean(L_ItalicShiftKey_TEXT) == fShiftKey)
		   && (RTE_FInterpretTextAsBoolean(L_ItalicAltKey_TEXT) == fAltKey)) 
		{
			evtSource.returnValue = false;
			RTE_TB_GetToolBarButton(strBaseElementID, g_strRTEItalicMnemonic).children(0).click();
		}
		else if (( L_UnderlineKey_TEXT.charCodeAt(0) == nKeyCode)
		   && (RTE_FInterpretTextAsBoolean(L_UnderlineShiftKey_TEXT) == fShiftKey)
		   && (RTE_FInterpretTextAsBoolean(L_UnderlineAltKey_TEXT) == fAltKey)) 
		{
			evtSource.returnValue = false;
			RTE_TB_GetToolBarButton(strBaseElementID, g_strRTEUnderlineMnemonic).children(0).click();
		}
		else if (( L_JustifyLeftKey_TEXT.charCodeAt(0) == nKeyCode)
		   && (RTE_FInterpretTextAsBoolean(L_JustifyLeftShiftKey_TEXT) == fShiftKey)
		   && (RTE_FInterpretTextAsBoolean(L_JustifyLeftAltKey_TEXT) == fAltKey)) 
		{
			evtSource.returnValue = false;
			RTE_TB_GetToolBarButton(strBaseElementID, g_strRTEJustifyLeftMnemonic).children(0).click();
		}
		else if (( L_JustifyCenterKey_TEXT.charCodeAt(0) == nKeyCode)
		   && (RTE_FInterpretTextAsBoolean(L_JustifyCenterShiftKey_TEXT) == fShiftKey)
		   && (RTE_FInterpretTextAsBoolean(L_JustifyCenterAltKey_TEXT) == fAltKey)) 
		{
			evtSource.returnValue = false;
			RTE_TB_GetToolBarButton(strBaseElementID, g_strRTEJustifyCenterMnemonic).children(0).click();
		}
		else if (( L_JustifyRightKey_TEXT.charCodeAt(0) == nKeyCode)
		   && (RTE_FInterpretTextAsBoolean(L_JustifyRightShiftKey_TEXT) == fShiftKey)
		   && (RTE_FInterpretTextAsBoolean(L_JustifyRightAltKey_TEXT) == fAltKey)) 
		{
			evtSource.returnValue = false;
			RTE_TB_GetToolBarButton(strBaseElementID, g_strRTEJustifyRightMnemonic).children(0).click();
		}
		else if (( L_IndentKey_TEXT.charCodeAt(0) == nKeyCode)
		   && (RTE_FInterpretTextAsBoolean(L_IndentShiftKey_TEXT) == fShiftKey)
		   && (RTE_FInterpretTextAsBoolean(L_IndentAltKey_TEXT) == fAltKey))  
		{
			evtSource.returnValue = false;
			RTE_TB_GetToolBarButton(strBaseElementID, g_strRTEIndentMnemonic).children(0).click();
		}
		else if (( L_CreateLinkKey_TEXT.charCodeAt(0) == nKeyCode)
		   && (RTE_FInterpretTextAsBoolean(L_CreateLinkShiftKey_TEXT) == fShiftKey)
		   && (RTE_FInterpretTextAsBoolean(L_CreateLinkAltKey_TEXT) == fAltKey)) 
		{
			evtSource.returnValue = false;
		   if (!fRestrictedMode || fAllowHyperlink)
		   {
				RTE_TB_GetToolBarButton(strBaseElementID, g_strRTECreateLinkMnemonic).children(0).click();
			}
		}
		else if (( L_SelectFontNameKey_TEXT.charCodeAt(0) == nKeyCode)
		   && (RTE_FInterpretTextAsBoolean(L_SelectFontNameShiftKey_TEXT) == fShiftKey)
		   && (RTE_FInterpretTextAsBoolean(L_SelectFontNameAltKey_TEXT) == fAltKey)) 
		{
			evtSource.returnValue = false;
			RTE_TB_GetToolBarButton(strBaseElementID, g_strRTEFontNameMnemonic).children(0).click();
		}
		else if (( L_SelectFontSizeKey_TEXT.charCodeAt(0) == nKeyCode)
		   && (RTE_FInterpretTextAsBoolean(L_SelectFontSizeShiftKey_TEXT) == fShiftKey)
		   && (RTE_FInterpretTextAsBoolean(L_SelectFontSizeAltKey_TEXT) == fAltKey)) 
		{
			evtSource.returnValue = false;
			RTE_TB_GetToolBarButton(strBaseElementID, g_strRTEFontSizeMnemonic).children(0).click();
		}
      else if (( L_SelectForeColorKey_TEXT.charCodeAt(0) == nKeyCode)
		   && (RTE_FInterpretTextAsBoolean(L_SelectForeColorShiftKey_TEXT) == fShiftKey)
		   && (RTE_FInterpretTextAsBoolean(L_SelectForeColorAltKey_TEXT) == fAltKey)) 
      {
			evtSource.returnValue = false;
			RTE_TB_GetToolBarButton(strBaseElementID, g_strRTEForeColorMnemonic).children(0).click();
      }
	   else if (( L_SelectBackColorKey_TEXT.charCodeAt(0) == nKeyCode)
		   && (RTE_FInterpretTextAsBoolean(L_SelectBackColorShiftKey_TEXT) == fShiftKey)
		   && (RTE_FInterpretTextAsBoolean(L_SelectBackColorAltKey_TEXT) == fAltKey)) 
	   {
			evtSource.returnValue = false;
			RTE_TB_GetToolBarButton(strBaseElementID, g_strRTEBackColorMnemonic).children(0).click();
	   }
		else if (( L_UnorderedListKey_TEXT.charCodeAt(0) == nKeyCode)
		   && (RTE_FInterpretTextAsBoolean(L_UnorderedListShiftKey_TEXT) == fShiftKey)
		   && (RTE_FInterpretTextAsBoolean(L_UnorderedListAltKey_TEXT) == fAltKey)) 
		{
			evtSource.returnValue = false;
			RTE_TB_GetToolBarButton(strBaseElementID, g_strRTEUnorderedListMnemonic).children(0).click();
		}
      else if (( L_OrderedListKey_TEXT.charCodeAt(0) == nKeyCode)
		   && (RTE_FInterpretTextAsBoolean(L_OrderedListShiftKey_TEXT) == fShiftKey)
		   && (RTE_FInterpretTextAsBoolean(L_OrderedListAltKey_TEXT) == fAltKey)) 
      {
			evtSource.returnValue = false;
			RTE_TB_GetToolBarButton(strBaseElementID, g_strRTEOrderedListMnemonic).children(0).click();
      }
		else if (( L_OutdentKey_TEXT.charCodeAt(0) == nKeyCode)
		   && (RTE_FInterpretTextAsBoolean(L_OutdentShiftKey_TEXT) == fShiftKey)
		   && (RTE_FInterpretTextAsBoolean(L_OutdentAltKey_TEXT) == fAltKey)) 
		{
			evtSource.returnValue = false;
			RTE_TB_GetToolBarButton(strBaseElementID, g_strRTEOutdentMnemonic).children(0).click();
		}
      else if (( L_InsertImageKey_TEXT.charCodeAt(0) == nKeyCode)
		   && (RTE_FInterpretTextAsBoolean(L_InsertImageShiftKey_TEXT) == fShiftKey)
		   && (RTE_FInterpretTextAsBoolean(L_InsertImageAltKey_TEXT) == fAltKey))
      {
			evtSource.returnValue = false;
			if (!fRestrictedMode)
			{
				RTE_TB_GetToolBarButton(strBaseElementID, g_strRTEInsertImageMnemonic).children(0).click();
			}
      }
		else if (( L_LTRKey_VALUE  == nKeyCode)
		   && (fShiftKey)) 
		{
			evtSource.returnValue = false;
			RTE_TB_GetToolBarButton(strBaseElementID, g_strRTELTRMnemonic).children(0).click();
		}
		else if (( L_RTLKey_VALUE == nKeyCode)
		   && (fShiftKey)) 
		{
			evtSource.returnValue = false;
			RTE_TB_GetToolBarButton(strBaseElementID, g_strRTERTLMnemonic).children(0).click();
		}
	}
}
function RTE_OnKeyUp(strBaseElementID, elem)
{
	;
	RTE_StartResetToolBarTimer(strBaseElementID);
}
function RTE_OnMouseUp(strBaseElementID)
{
	;
	RTE_DD_CloseMenu();
	RTE_ResetAllToolBarStates(strBaseElementID);
}
function RTE_OnPaste_Restricted(strBaseElementID, elem)
{
	;
	elem.document.parentWindow.event.returnValue = false;
	RTE_RestoreSelection(strBaseElementID);
	var rngSelection = RTE_GetSelection(strBaseElementID);
	var strFromClipboard = window.clipboardData.getData("Text");
	if ((null != rngSelection) && (null != strFromClipboard))
	{
		rngSelection.text = strFromClipboard;
	}
}
var g_cRTEResetToolBarTimerQueue = 0;
function RTE_StartResetToolBarTimer(strBaseElementID)
{
	++g_cRTEResetToolBarTimerQueue;
	window.setTimeout("RTE_OnResetToolBarTimer(\"" + strBaseElementID + "\")", 400);
}
function RTE_OnResetToolBarTimer(strBaseElementID)
{
	;
	--g_cRTEResetToolBarTimerQueue;
	if (0 == g_cRTEResetToolBarTimerQueue)
	{
		RTE_ResetAllToolBarStates(strBaseElementID);
	}
}
var g_fRTEFirstTimeGenerateCalled = true;
function RTE_GenerateIFrameEditorHtml(strBaseElementID, elemTextArea, fRestrictedMode, fAllowHyperlink)
{
	var strHtmlRet = "";
	if (g_fRTEFirstTimeGenerateCalled)
	{
		g_fRTEFirstTimeGenerateCalled = false;
		strHtmlRet += "<iframe id=\"" + g_strRTETextEditorPullDownMenuID + "\"  src=\"" + RTE_GetServerRelativeUnlocalizedImageUrl("blank.gif") +
			"\" class=\"ms-rtetoolbarmenu\" TABINDEX=-1 style=\"display:none; position:absolute;\" " +g_strRTEBaseElementIDAttributeName + "=\"x\" " + g_strRTEWebLocaleAttributeName + "=\"x\" " +
			g_strRTEButtonMnemonicAttributeName + "=\"x\"></iframe>";
		document.body.insertAdjacentHTML("afterBegin", "<object id=\"RTEDialogHelper\" name=\"RTEDialogHelper\" classid=\"clsid:3050f819-98b5-11cf-bb82-00aa00bdce0b\" style=\"width:0px; height:0px;\" TABINDEX=-1></OBJECT>");
	}
	var strWidthNameAndAttribute = ""
	var strHeightNameAndAttribute = ""
	var strClassNameAndAttribute = "";
	var cRows = elemTextArea.getAttribute("rows");
	if ((fRestrictedMode) && (null != cRows) && (cRows > 0))
	{
		strWidthNameAndAttribute = "";
		strHeightNameAndAttribute = " height=\"" + cRows * g_iLineHeight + "\"";
		if (fAllowHyperlink)
		{
			strClassNameAndAttribute = " class=\"ms-longer\"";
		}
		else
		{
			strClassNameAndAttribute = " class=\"ms-long\"";
		}
	}
	else
	{
		strWidthNameAndAttribute = " width=\"" + elemTextArea.offsetWidth + "\"";
		strHeightNameAndAttribute = " height=\"" + elemTextArea.offsetHeight + "\"";
		strClassNameAndAttribute = "";
	}
	strHtmlRet += "<div>";
	strHtmlRet += "<iframe " + strWidthNameAndAttribute + strHeightNameAndAttribute + strClassNameAndAttribute +
			" id=\"" + RTE_GetEditorIFrameID(strBaseElementID) + "\" title=\"" + L_EditorIFrameTitle_TEXT +
			"\" src=\"" + RTE_GetServerRelativeUnlocalizedImageUrl("blank.gif") + "\" TABINDEX=1></iframe>";
	strHtmlRet += "</div>";
	return strHtmlRet;
}
function RTE_GenerateToolBarHtml(strBaseElementID, strWebLanguage, elemTextArea, fRestrictedMode, fAllowHyperlink)
{
	var strHtmlRet = "";
	var strClassAttribute = " class=\"ms-toolbar rtetoolbar\" ";
	var strWidthAttribute = " width=\"" + elemTextArea.currentStyle.width + "\" ";
	if (fRestrictedMode)
	{
		if (fAllowHyperlink)
		{
			strClassAttribute = " class=\"ms-toolbar rtetoolbar ms-longer\" ";
		}
		else
		{
			strClassAttribute = " class=\"ms-toolbar rtetoolbar ms-long\" ";
		}
		strWidthAttribute = "";
	}
	strHtmlRet += "<table cellpadding=0 cellspacing=0 " + strClassAttribute + strWidthAttribute + ">";
	strHtmlRet += "<tr><td><table cellspacing=0 cellpadding=0 border=0>";
	strHtmlRet += "<tr>";
	if (!fRestrictedMode)
	{
		strHtmlRet += RTE_TB_GenerateExecCommandToolBarButtonHtml(strBaseElementID, g_strRTECutMnemonic, false, RTE_GetServerRelativeImageUrl("rtecut.gif"), "", L_CutToolTip_TEXT, true);
		strHtmlRet += RTE_TB_GenerateExecCommandToolBarButtonHtml(strBaseElementID, g_strRTECopyMnemonic, false, RTE_GetServerRelativeImageUrl("rtecopy.gif"), "", L_CopyToolTip_TEXT, true);
		strHtmlRet += RTE_TB_GenerateExecCommandToolBarButtonHtml(strBaseElementID, g_strRTEPasteMnemonic, false, RTE_GetServerRelativeImageUrl("rtepaste.gif"), "", L_PasteToolTip_TEXT, false);
		strHtmlRet += RTE_TB_GenerateToolBarSeparatorHtml();
	}
	strHtmlRet += RTE_GenerateFontNameToolBarButtonHtml(strBaseElementID, strWebLanguage, fRestrictedMode);
	strHtmlRet += RTE_GenerateFontSizeToolBarButtonHtml(strBaseElementID, strWebLanguage, fRestrictedMode);
	strHtmlRet += RTE_TB_GenerateToolBarSeparatorHtml();
	strHtmlRet += RTE_TB_GenerateExecCommandToolBarButtonHtml(strBaseElementID, g_strRTEBoldMnemonic, false, RTE_GetServerRelativeImageUrl("rtebold.gif"), "", L_BoldToolTip_TEXT, false);
	strHtmlRet += RTE_TB_GenerateExecCommandToolBarButtonHtml(strBaseElementID, g_strRTEItalicMnemonic, false, RTE_GetServerRelativeImageUrl("rteital.gif"), "", L_ItalicToolTip_TEXT, false);
	strHtmlRet += RTE_TB_GenerateExecCommandToolBarButtonHtml(strBaseElementID, g_strRTEUnderlineMnemonic, false, RTE_GetServerRelativeImageUrl("rteundl.gif"), "", L_UnderlineToolTip_TEXT, false);
	strHtmlRet += RTE_TB_GenerateToolBarSeparatorHtml();
	if (strWebLanguage == "1025" || strWebLanguage == "1037")
	{
		strHtmlRet += RTE_TB_GenerateExecCommandToolBarButtonHtml(strBaseElementID, g_strRTEJustifyRightMnemonic, false, RTE_GetServerRelativeImageUrl("rtertal.gif"), "", L_JustifyRightToolTip_TEXT, false);
		strHtmlRet += RTE_TB_GenerateExecCommandToolBarButtonHtml(strBaseElementID, g_strRTEJustifyCenterMnemonic, false, RTE_GetServerRelativeImageUrl("rtectral.gif"), "", L_JustifyCenterToolTip_TEXT, false);
		strHtmlRet += RTE_TB_GenerateExecCommandToolBarButtonHtml(strBaseElementID, g_strRTEJustifyLeftMnemonic, false, RTE_GetServerRelativeImageUrl("rteltal.gif"), "", L_JustifyLeftToolTip_TEXT, false);
	}
	else
	{
		strHtmlRet += RTE_TB_GenerateExecCommandToolBarButtonHtml(strBaseElementID, g_strRTEJustifyLeftMnemonic, false, RTE_GetServerRelativeImageUrl("rteltal.gif"), "", L_JustifyLeftToolTip_TEXT, false);
		strHtmlRet += RTE_TB_GenerateExecCommandToolBarButtonHtml(strBaseElementID, g_strRTEJustifyCenterMnemonic, false, RTE_GetServerRelativeImageUrl("rtectral.gif"), "", L_JustifyCenterToolTip_TEXT, false);
		strHtmlRet += RTE_TB_GenerateExecCommandToolBarButtonHtml(strBaseElementID, g_strRTEJustifyRightMnemonic, false, RTE_GetServerRelativeImageUrl("rtertal.gif"), "", L_JustifyRightToolTip_TEXT, false);
	}
	strHtmlRet += RTE_TB_GenerateToolBarSeparatorHtml();
	strHtmlRet += RTE_TB_GenerateExecCommandToolBarButtonHtml(strBaseElementID, g_strRTEOrderedListMnemonic, false, RTE_GetServerRelativeImageUrl("rtenlst.gif"), "", L_OrderedListToolTip_TEXT, false);
	strHtmlRet += RTE_TB_GenerateExecCommandToolBarButtonHtml(strBaseElementID, g_strRTEUnorderedListMnemonic, false, RTE_GetServerRelativeImageUrl("rteblst.gif"), "", L_UnorderedListToolTip_TEXT, false);
	if (!fRestrictedMode)
	{
		strHtmlRet += RTE_TB_GenerateToolBarSeparatorHtml();
	}
	if (strWebLanguage == "1025" || strWebLanguage == "1037")
	{
		strHtmlRet += RTE_TB_GenerateExecCommandToolBarButtonHtml(strBaseElementID, g_strRTEIndentMnemonic, false, RTE_GetServerRelativeImageUrl("rteidt.gif"), "", L_IndentToolTip_TEXT, false);
		strHtmlRet += RTE_TB_GenerateExecCommandToolBarButtonHtml(strBaseElementID, g_strRTEOutdentMnemonic, false, RTE_GetServerRelativeImageUrl("rteuidt.gif"), "", L_OutdentToolTip_TEXT, false);
	}
	else
	{
		strHtmlRet += RTE_TB_GenerateExecCommandToolBarButtonHtml(strBaseElementID, g_strRTEOutdentMnemonic, false, RTE_GetServerRelativeImageUrl("rteuidt.gif"), "", L_OutdentToolTip_TEXT, false);
		strHtmlRet += RTE_TB_GenerateExecCommandToolBarButtonHtml(strBaseElementID, g_strRTEIndentMnemonic, false, RTE_GetServerRelativeImageUrl("rteidt.gif"), "", L_IndentToolTip_TEXT, false);
	}
	if (!fRestrictedMode)
	{
		strHtmlRet += RTE_TB_GenerateToolBarSeparatorHtml();
	}
	if (!fRestrictedMode || fAllowHyperlink)
	{
		strHtmlRet += RTE_TB_GenerateExecCommandToolBarButtonHtml(strBaseElementID, g_strRTECreateLinkMnemonic, true, RTE_GetServerRelativeImageUrl("rtelnk.gif"), "", L_CreateLinkToolTip_TEXT, true);
	}
	if (!fRestrictedMode)
	{
		strHtmlRet += RTE_TB_GenerateExecCommandToolBarButtonHtml(strBaseElementID, g_strRTEInsertImageMnemonic, true, RTE_GetServerRelativeImageUrl("rteimg.gif"), "", L_InsertImageToolTip_TEXT, false);
	}
	strHtmlRet += RTE_TB_GenerateToolBarSeparatorHtml();
	strHtmlRet += RTE_GenerateForeColorToolBarButtonHtml(strBaseElementID, strWebLanguage);
	strHtmlRet += RTE_GenerateBackColorToolBarButtonHtml(strBaseElementID, strWebLanguage);
	if (RTE_ShouldShowDirection())
	{
		if (!fRestrictedMode)
		{
			strHtmlRet += RTE_TB_GenerateToolBarSeparatorHtml();
		}
		if (strWebLanguage == "1025" || strWebLanguage == "1037")
		{
			strHtmlRet += RTE_TB_GenerateToolBarButtonHtml(strBaseElementID, "rtl", "RTE_SetDirectionOfSelection('" + strBaseElementID + "', 'rtl');", RTE_GetServerRelativeImageUrl("rtertl.gif"), "", L_RTLToolTip_TEXT);
			strHtmlRet += RTE_TB_GenerateToolBarButtonHtml(strBaseElementID, "ltr", "RTE_SetDirectionOfSelection('" + strBaseElementID + "', 'ltr');", RTE_GetServerRelativeImageUrl("rteltr.gif"), "", L_LTRToolTip_TEXT);
		}
		else
		{
			strHtmlRet += RTE_TB_GenerateToolBarButtonHtml(strBaseElementID, "ltr", "RTE_SetDirectionOfSelection('" + strBaseElementID + "', 'ltr');", RTE_GetServerRelativeImageUrl("rteltr.gif"), "", L_LTRToolTip_TEXT);
			strHtmlRet += RTE_TB_GenerateToolBarButtonHtml(strBaseElementID, "rtl", "RTE_SetDirectionOfSelection('" + strBaseElementID + "', 'rtl');", RTE_GetServerRelativeImageUrl("rtertl.gif"), "", L_RTLToolTip_TEXT);
		}			
	}
	strHtmlRet += "</tr>";
	strHtmlRet += "</table></td></tr>";
	strHtmlRet += "</table>";
	return strHtmlRet;
}
function RTE_GenerateFontNameToolBarButtonHtml(strBaseElementID, strWebLanguage, fRestrictedMode)
{
	var strHtmlRet = "";
	strHtmlRet += RTE_TB_GenerateOpenCellButtonHtml(strBaseElementID, g_strRTEFontNameMnemonic);
	strHtmlRet += "<a TABINDEX=-1 href=\"#\" onfocus=\"RTE_TB_OnFocus('" + strBaseElementID + "', this);\" onblur=\"RTE_TB_OnBlur('" + strBaseElementID + "', this);\" onclick=\"RTE_DD_OpenFontNameOrSizeSelector('" + strBaseElementID + "' ,'" + strWebLanguage + "', true); return false;\" title=\"" +
			L_FontNameToolTip_TEXT + "\"";
	if (fRestrictedMode)
	{
		strHtmlRet += "><img src=\"" + RTE_GetServerRelativeImageUrl("rtefnt.gif") + "\" alt=\"" + L_FontNameToolTip_TEXT + "\" border=0>";
	}
	else
	{
		strHtmlRet += " style=\"margin-left: 2px; margin-right: 2px;\">" + L_FontNameLabel_TEXT + "&nbsp;<img alt=\"" +
				L_FontNameToolTip_TEXT + "\" src=\"" + RTE_GetServerRelativeImageUrl("rtednar.gif") + "\" border=0>";
	}
	strHtmlRet += "</a>";
	strHtmlRet += RTE_TB_GenerateCloseCellButtonHtml();
	return strHtmlRet;
}
function RTE_GenerateFontSizeToolBarButtonHtml(strBaseElementID, strWebLanguage, fRestrictedMode)
{
	var strHtmlRet = "";
	strHtmlRet += RTE_TB_GenerateOpenCellButtonHtml(strBaseElementID, g_strRTEFontSizeMnemonic);
	strHtmlRet += "<a TABINDEX=-1 href=\"#\" onfocus=\"RTE_TB_OnFocus('" + strBaseElementID + "', this);\" onblur=\"RTE_TB_OnBlur('" + strBaseElementID + "', this);\" onclick=\"RTE_DD_OpenFontNameOrSizeSelector('" + strBaseElementID + "', '" + strWebLanguage + "', false); return false;\" title=\"" +
			L_FontSizeToolTip_TEXT + "\"";
	if (fRestrictedMode)
	{
		strHtmlRet += "><img src=\"" + RTE_GetServerRelativeImageUrl("rtefntsz.gif") + "\" alt=\"" + L_FontSizeToolTip_TEXT + "\" border=0>";
	}
	else
	{
		strHtmlRet += " style=\"margin-left: 2px; margin-right: 2px;\">" + L_FontSizeLabel_TEXT + "&nbsp;<img alt=\"" +
				L_FontSizeToolTip_TEXT + "\" src=\"" + RTE_GetServerRelativeImageUrl("rtednar.gif") + "\" border=0>";
	}
	strHtmlRet += "</a>";
	strHtmlRet += RTE_TB_GenerateCloseCellButtonHtml();
	return strHtmlRet;
}
function RTE_GenerateForeColorToolBarButtonHtml(strBaseElementID, strWebLanguage)
{
	var strHtmlRet = "";
	strHtmlRet += RTE_TB_GenerateOpenCellButtonHtml(strBaseElementID, g_strRTEForeColorMnemonic);
	strHtmlRet += "<a TABINDEX=-1 href=\"#\" onfocus=\"RTE_TB_OnFocus('" + strBaseElementID + "', this);\" onblur=\"RTE_TB_OnBlur('" + strBaseElementID + "', this);\" onclick=\"RTE_DD_OpenForeColorSelector('" + strBaseElementID + "', '" + strWebLanguage + "'); return false;\"><img src=\"" + RTE_GetServerRelativeImageUrl("rtetxclr.gif") + "\" alt=\"" +
			L_ForeColorToolTip_TEXT + "\" border=0></a>";
	strHtmlRet += RTE_TB_GenerateCloseCellButtonHtml();
	return strHtmlRet;
}
function RTE_GenerateBackColorToolBarButtonHtml(strBaseElementID, strWebLanguage)
{
	var strHtmlRet = "";
	strHtmlRet += RTE_TB_GenerateOpenCellButtonHtml(strBaseElementID, g_strRTEBackColorMnemonic);
	strHtmlRet += "<a TABINDEX=-1 href=\"#\" onfocus=\"RTE_TB_OnFocus('" + strBaseElementID + "', this);\" onblur=\"RTE_TB_OnBlur('" + strBaseElementID + "', this);\" onclick=\"RTE_DD_OpenBackColorSelector('" + strBaseElementID + "', '" + strWebLanguage +"'); return false;\"><img src=\"" + RTE_GetServerRelativeImageUrl("rtebkclr.gif") + "\" alt=\"" +
			L_BackColorToolTip_TEXT + "\" border=0></a>";
	strHtmlRet += RTE_TB_GenerateCloseCellButtonHtml();
	return strHtmlRet;
}
function RTE_ShouldIgnoreElement(elem)
{
	return false;
}
function RTE_FindChildElementOfType(elemRoot, strTagNames, strBaseElementIDToSkip, fIgnoreRoot, fForwards)
{
	if ((elemRoot.nodeType != g_ntRTEElement) || (elemRoot.className.indexOf("rtetoolbar") >= 0) || (elemRoot.id == g_strRTETextEditorPullDownMenuID) || (elemRoot.id == RTE_GetEditorIFrameID(strBaseElementIDToSkip)))
	{
		return null;
	}
	if ((fForwards) && (!fIgnoreRoot) && (strTagNames.indexOf("|"+elemRoot.tagName+"|") >= 0))
	{
		return elemRoot;
	}
	if ((elemRoot.children != null) && (elemRoot.children.length > 0))
	{
		var ielemChild = 0;
		var ielemLast = elemRoot.children.length - 1;
		var ielemIncrement = 1;
		if (!fForwards)
		{
			ielemChild = ielemLast;
			ielemLast = 0;
			ielemIncrement = -1;
		}
		do
		{
			var elemChild = elemRoot.children(ielemChild);
			if (elemChild != null)
			{
				var elemFound = RTE_FindChildElementOfType(elemChild, strTagNames, strBaseElementIDToSkip, false, fForwards); 
				if (elemFound != null)
				{
					return elemFound;
				}
			}
			ielemChild += ielemIncrement;
		} while (((fForwards) && (ielemChild <= ielemLast)) || ((!fForwards) && (ielemChild >= ielemLast)));
	}
	if ((!fForwards) && (!fIgnoreRoot) && (strTagNames.indexOf("|"+elemRoot.tagName+"|") >= 0))
	{
		return elemRoot;
	}
	return null;
}
function RTE_FindNextElementOfType(elemStart, strTagNames, strBaseElementIDToSkip, fForwards)
{
	if (fForwards)
	{
		var elemChild = RTE_FindChildElementOfType(elemStart, strTagNames, strBaseElementIDToSkip, true, fForwards); 
		if (elemChild != null)
		{
			return elemFound;
		}
	}
	var elemCurrent = elemStart;
	do
	{
		if (fForwards)
		{
			if (elemCurrent.nextSibling != null)
			{
				elemCurrent = elemCurrent.nextSibling;
			}
			else
			{
				while (true)
				{
					if (elemCurrent.parentNode == null)
					{
						elemCurrent = elemCurrent.firstChild;
						break;
					}
					if (elemCurrent.parentNode.nextSibling != null)
					{
						elemCurrent = elemCurrent.parentNode.nextSibling;
						break;
					}
					elemCurrent = elemCurrent.parentNode;
				}
			}
		}
		else
		{
			if (elemCurrent.previousSibling != null)
			{
				elemCurrent = elemCurrent.previousSibling;
			}
			else
			{
				while (true)
				{
					if (elemCurrent.parentNode == null)
					{
						elemCurrent = elemCurrent.lastChild;
						break;
					}
					if (elemCurrent.parentNode.previousSibling != null)
					{
						elemCurrent = elemCurrent.parentNode.previousSibling;
						break;
					}
					elemCurrent = elemCurrent.parentNode;
				}
			}
		}
		if (elemCurrent != null)
		{
			var elemChild = RTE_FindChildElementOfType(elemCurrent, strTagNames, strBaseElementIDToSkip, false, fForwards); 
			if (elemChild != null)
			{
				return elemChild;
			}
		}
	} while (elemCurrent != null);
	return null;
}
var g_strRTEFocusElementTagNames = "|INPUT|TEXTAREA|IFRAME|A|";
function RTE_MoveFocus(elemStart, strBaseElementIDToSkip, fForwards)
{
	var elemNext = RTE_FindNextElementOfType(elemStart, g_strRTEFocusElementTagNames, strBaseElementIDToSkip, fForwards);
	while ((elemNext != null) && ((elemNext.disabled == true) || (elemNext.hidden == true)))
		   elemNext = RTE_FindNextElementOfType(elemNext, g_strRTEFocusElementTagNames, strBaseElementIDToSkip, fForwards);
	if (elemNext != null)
	{
		if (elemNext.tagName == "IFRAME")
		{
			var ifmEditor = null;
	      if ((null != document.frames) && (document.frames.length > 0))
	      {
      		var ifmContainer = document.getElementById(elemNext.id);
   		   if (ifmContainer != null)
   		   {
   		   	ifmEditor = document.frames(elemNext.id);
   		   	if (ifmEditor != null)
   		   	{
   		   	   ifmEditor.focus();
   		   	}
   		   }
	      }
		}
		else if (elemNext.tagName == "INPUT")
		{
         elemNext.focus();
         elemNext.select();
		}
		else if (elemNext.tagName == "TEXTAREA")
		{
		   elemNext.focus();
		   var tr = elemNext.createTextRange();
		   tr.collapse(false);
		   tr.select();
		}
		else
		   elemNext.focus();
	}
}
function RTE_MoveFocusBackwards(elemStart, strBaseElementIDToSkip)
{
	RTE_MoveFocus(elemStart, strBaseElementIDToSkip, false);
}
function RTE_MoveFocusForwards(elemStart, strBaseElementIDToSkip)
{
	RTE_MoveFocus(elemStart, strBaseElementIDToSkip, true);
}
function RTE_ExecuteCommandOnSelection(strBaseElementID, strCommand, fUserInterface, strValue)
{
	var docEditor = RTE_GetEditorDocument(strBaseElementID);
	RTE_RestoreSelection(strBaseElementID);
	if ((strCommand == g_strRTECreateLinkMnemonic) || (strCommand == g_strRTEInsertImageMnemonic))
	{
		g_fRTEDialogIsOpen = true;
	}
	docEditor.execCommand(strCommand, fUserInterface, strValue);
	if (g_fRTEDialogIsOpen)
	{
		g_fRTEDialogIsOpen = false;
		 RTE_OnFocus(strBaseElementID);
	}
	RTE_StartResetToolBarTimer(strBaseElementID);
}
function RTE_SetDirectionOfSelection(strBaseElementID, strDirection)
{
	var rngSelection = RTE_GetSelection(strBaseElementID);
	RTE_RestoreSelection(strBaseElementID);
	var strTagNames;
	if ("ltr" == strDirection)
	{
		strTagNames = "|H1|H2|H3|H4|H5|H6|P|PRE|LI|TD|DIV|BLOCKQUOTE|DT|DD|TABLE|HR|IMG|TR|UL|OL|";
	}
	else
	{
		strTagNames = "|H1|H2|H3|H4|H5|H6|P|PRE|LI|TD|DIV|BLOCKQUOTE|DT|DD|TABLE|HR|IMG|";
	}
	var elemSelectionParent = rngSelection.parentElement();
	while ((elemSelectionParent != null) && (strTagNames.indexOf("|"+elemSelectionParent.tagName+"|") == -1))
	{
		elemSelectionParent = elemSelectionParent.parentElement;
	}
	if (elemSelectionParent)
	{
		if ("ltr" == strDirection)
		{
			elemSelectionParent.dir = "ltr"	;
			elemSelectionParent.align = "left";
		}
		else
		{
			elemSelectionParent.dir = "rtl";
			elemSelectionParent.align = "right";
		}
	}
}
var g_strRTEToolBarButtonWithTheFocus = null;
function RTE_ToolBarButtonWithTheFocus()
{
	return g_strRTEToolBarButtonWithTheFocus;
}
function RTE_TB_GetToolBarButton(strBaseElementID, strButtonMnemonic)
{
	var elemToolBarButton = document.all(strBaseElementID + "_" + strButtonMnemonic);
	return elemToolBarButton;
}
function RTE_TB_GenerateOpenCellButtonHtml(strBaseElementID, strButtonMnemonic)
{
	var strHtmlRet = "";
	strHtmlRet += "<td class=ms-toolbar>";
	strHtmlRet += "<table cellpadding=1 cellspacing=0 border=0>";
	strHtmlRet += "<tr>";
	strHtmlRet += "<td class=\"ms-toolbar " + g_strRTEUnselectedClassName + "\" nowrap id=\"" + strBaseElementID + "_" + strButtonMnemonic + "\" onmouseover=\"RTE_TB_OnMouseOver(this);\" onmouseout=\"RTE_TB_OnMouseOut(this);\">";
	return strHtmlRet;
}
function RTE_TB_GenerateCloseCellButtonHtml()
{
	var strHtmlRet = "";
	strHtmlRet += "</td>";
	strHtmlRet += "</tr>";
	strHtmlRet += "</table>";
	strHtmlRet += "</td>";
	return strHtmlRet;
}
function RTE_TB_GenerateToolBarSeparatorHtml()
{
	return "<td class=ms-separator>|</td>";
}
function RTE_TB_GenerateToolBarButtonHtml(strBaseElementID, strButtonMnemonic, strOnClickJScript, strImageUrl, strText, strToolTip)
{
	var strHtmlRet = "";
	strHtmlRet += RTE_TB_GenerateOpenCellButtonHtml(strBaseElementID, strButtonMnemonic);	
	strHtmlRet += "<a TABINDEX=-1 href=\"#\" onfocus=\"RTE_TB_OnFocus('" + strBaseElementID + "', this);\" onblur=\"RTE_TB_OnBlur('" + strBaseElementID + "', this);\" onclick=\"" + strOnClickJScript + "; return false;\">";
	if (0 < strImageUrl.length)
	{
		strHtmlRet += "<img border=0 src=\"" + strImageUrl + "\" alt=\"" + strToolTip + "\">";
	}
	if (0 < strText.length)
	{
		strHtmlRet += " " + strText;
	}
	strHtmlRet += "</a>";
	strHtmlRet += RTE_TB_GenerateCloseCellButtonHtml();
	return strHtmlRet;
}
function RTE_TB_GenerateExecCommandToolBarButtonHtml(strBaseElementID, strCommand, fUserInterface, strImageUrl, strText, strToolTip, fOnlyIfSelectionActive)
{
	var strOnClickJScript = "";
	if (fOnlyIfSelectionActive)
	{
		strOnClickJScript += "var sel = RTE_GetEditorDocument('" + strBaseElementID + "').selection; if ((null != sel) && ('None' != sel.type)) { ";
	}
   if (browseris.ie5up && !browseris.ie55up && !browseris.ie6up)
   {
      strOnClickJScript += "RTE_SaveSelection('" + strBaseElementID + "');";
   }
	strOnClickJScript += "RTE_ExecuteCommandOnSelection('" + strBaseElementID + "', '" + strCommand + "', " + fUserInterface + ", null );";
	if (fOnlyIfSelectionActive)
	{
		strOnClickJScript += "}";
	}
	return RTE_TB_GenerateToolBarButtonHtml(strBaseElementID, strCommand, strOnClickJScript, strImageUrl, strText, strToolTip);
}
function RTE_TB_SetButtonCheck(elemButton)
{
	elemButton.className = RTE_RemoveClassFromClassList(elemButton.className, g_strRTEUnselectedClassName);
	elemButton.className = RTE_AddClassToClassList(elemButton.className, g_strRTESelectedClassName);
}
function RTE_TB_ClearButtonCheck(elemButton)
{
	elemButton.className = RTE_RemoveClassFromClassList(elemButton.className, g_strRTESelectedClassName);
	elemButton.className = RTE_AddClassToClassList(elemButton.className, g_strRTEUnselectedClassName);
}
function RTE_TB_SetButtonDisabled(elemButton)
{
	elemButton.className = RTE_AddClassToClassList(elemButton.className, g_strRTEDisabledClassName);
	elemButton.disabled = true;
	var elemChildLink = elemButton.children(0);
	if ((elemChildLink != null) && (elemChildLink.tagName == "A"))
	{
		elemChildLink.disabled = true;
	}
}
function RTE_TB_ClearButtonDisabled(elemButton)
{
	elemButton.disabled = false;
	var elemChildLink = elemButton.children(0);
	if ((elemChildLink != null) && (elemChildLink.tagName == "A"))
	{
		elemChildLink.disabled = false;
	}
	elemButton.className = RTE_RemoveClassFromClassList(elemButton.className, g_strRTEDisabledClassName);
}
function RTE_TB_SetButtonHover(elemButton)
{
	elemButton.className = RTE_AddClassToClassList(elemButton.className, g_strRTEHoverClassName);
}
function RTE_TB_ClearButtonHover(elemButton)
{
	elemButton.className = RTE_RemoveClassFromClassList(elemButton.className, g_strRTEHoverClassName);
}
function RTE_TB_SetCheckFromCommandValue(strBaseElementID, docEditor, strCommand)
{
	var btn = RTE_TB_GetToolBarButton(strBaseElementID, strCommand);
	if (docEditor.queryCommandSupported(strCommand) && docEditor.queryCommandValue(strCommand))
	{
		RTE_TB_SetButtonCheck(btn);
	}
	else
	{
		RTE_TB_ClearButtonCheck(btn);
	}
}
function RTE_TB_SetEnabledFromCommandEnabled(strBaseElementID, docEditor, strCommand, fOnlyIfSelectionActive)
{
	var fSelectionTestResults = true;
	if (fOnlyIfSelectionActive)
	{
		var sel = docEditor.selection;
		if ((null == sel) || ('none' == sel.type))
		{
			fSelectionTestResults = false;
		}
		else
		{
			var rngSel = docEditor.selection.createRange();
			if ((rngSel != null) && (rngSel.text != null) && (0 >= rngSel.text.length))
			{
				fSelectionTestResults = false;
			}
		}
	}
	var btn = RTE_TB_GetToolBarButton(strBaseElementID, strCommand);
	if ((fSelectionTestResults) && (docEditor.queryCommandEnabled(strCommand)))
	{
		RTE_TB_ClearButtonDisabled(btn);
	}
	else
	{
		RTE_TB_SetButtonDisabled(btn);
	}
}
function RTE_TB_OnMouseOver(elemButton)
{
	if (0 > elemButton.className.indexOf(g_strRTEDisabledClassName))
	{
		RTE_TB_SetButtonHover(elemButton);
	}
}
function RTE_TB_OnMouseOut(elemButton)
{
	RTE_TB_ClearButtonHover(elemButton);
}
function RTE_TB_OnFocus(strBaseElementID, elemButton)
{
	g_strRTEToolBarButtonWithTheFocus = elemButton.parentElement.id;
}
function RTE_TB_OnBlur(strBaseElementID, elemButton)
{
	g_strRTEToolBarButtonWithTheFocus = null;
}
var g_strRTEDDBaseElementID = null;
var g_strRTEDDButtonMnemonic = null;
var g_fRTEFirstCallToGetMenu = true;
var g_elemRTEHighlightedMenuItem = null;
var g_iRTEHighlightedMenuItem = -1;
var g_iRTEMenuItemMax = -1;
function RTE_DD_GetMenuElement()
{
	var elemMenu = document.getElementById(g_strRTETextEditorPullDownMenuID);
	if ((null == elemMenu) && (document.parentWindow != null) && (document.parentWindow.document != null))
	{
		elemMenu = document.parentWindow.parent.document.getElementById(g_strRTETextEditorPullDownMenuID);
	}
	return elemMenu;
}
function RTE_DD_GetMenuFrame()
{
	var ifmMenu = null;
	var elemMenu = RTE_DD_GetMenuElement();
	if (null != elemMenu)
	{
		if (document.frames.length > 0)
		{
			ifmMenu = document.frames(g_strRTETextEditorPullDownMenuID);
		}
		else
		{
			if ((document.parentWindow != null) && (document.parentWindow.frames != null))
			{
				ifmMenu = document.parentWindow.parent.document.frames(g_strRTETextEditorPullDownMenuID);
			}
		}
	}
	if (null == ifmMenu)
	{
		if (g_fRTEFirstCallToGetMenu)
		{
			g_fRTEFirstCallToGetMenu = false;
			return null;
		}
	}
	return ifmMenu;
}
function RTE_DD_GetMenuBaseElementID()
{
	return RTE_DD_GetMenuElement().getAttribute(g_strRTEBaseElementIDAttributeName);
}
function RTE_DD_GetMenuButtonMnemonic()
{
	return RTE_DD_GetMenuElement().getAttribute(g_strRTEButtonMnemonicAttributeName);
}
function RTE_DD_MenuIsOpen()
{
	if ("" == RTE_DD_GetMenuElement().style.display)
	{
		return true;
	}
	return false;
}
var g_fRTEMenuMoved = false;
function RTE_DD_OpenMenu(strBaseElementID, strButtonMnemonic, strMenuHtml, cMenuItems)
{
	var elemMenu = RTE_DD_GetMenuElement();
	var ifmMenu = RTE_DD_GetMenuFrame();
	if (!g_fRTEMenuMoved)
	{
		g_elemRTELastTextAreaConverted.insertAdjacentElement("afterEnd", elemMenu);
		elemMenu = RTE_DD_GetMenuElement();
		ifmMenu = RTE_DD_GetMenuFrame();
	}
	if ((g_strRTEDDBaseElementID == strBaseElementID) && (g_strRTEDDButtonMnemonic == strButtonMnemonic))
	{
		RTE_DD_CloseMenu();
		RTE_RestoreSelection(strBaseElementID);
		return;
	}
	if ((null != g_strRTEDDBaseElementID) && (null != g_strRTEDDButtonMnemonic))
	{
		RTE_DD_CloseMenu();
	}
	g_strRTEDDBaseElementID = strBaseElementID;
	g_strRTEDDButtonMnemonic = strButtonMnemonic;
	g_iRTEMenuItemMax = cMenuItems - 1;
   if (browseris.ie5up && !browseris.ie55up && !browseris.ie6up)
   {
   	RTE_SaveSelection(strBaseElementID);
   }
	var elemToolBarButton = RTE_TB_GetToolBarButton(strBaseElementID, strButtonMnemonic);
	elemMenu.setAttribute(g_strRTEBaseElementIDAttributeName, strBaseElementID);
	elemMenu.setAttribute(g_strRTEButtonMnemonicAttributeName, strButtonMnemonic);
	elemMenu.setAttribute(g_strRTEMenuOpeningAttributeName, "1");
	elemMenu.style.top = "";
	elemMenu.style.left = "";
	elemMenu.style.height = "";
	elemMenu.style.width = "";
	var strWebLocale = RTE_GetWebLocale(strBaseElementID);
	ifmMenu.document.open("text/html", "replace");
	ifmMenu.document.write("<html><head><link rel=\"stylesheet\" type=\"text/css\" href=\"" + RTE_GetServerRelativeStylesheetUrl("ows.css", strWebLocale) + 
			"\"><script language=\"javascript\" src=\"" + RTE_GetServerRelativeScriptUrl("ows.js", strWebLocale) + "\"></script></head>" +
			"<body class=\"ms-rtetoolbarmenu\" " + g_strRTECommandToExecuteAttributeName + "=\"x\" " + g_strRTECommandValueAttributeName + "=\"x\"><div class=\"ms-rtetoolbarmenu\" id=\"divAroundMenu\">" +
			strMenuHtml + "</div></body></html>");
	ifmMenu.document.close();
	elemMenu = RTE_DD_GetMenuElement();
	ifmMenu = RTE_DD_GetMenuFrame();
	ifmMenu.document.body.onfocus = new Function("RTE_DD_OnFocus('" + strBaseElementID + "');");
	ifmMenu.document.body.onblur = new Function("RTE_DD_OnBlur('" + strBaseElementID + "');");
	ifmMenu.document.body.onkeydown = new Function("RTE_DD_OnKeyDown(this);");
	elemMenu.style.border = "0px";
	ifmMenu.document.body.style.border = "1px solid black";
	elemMenu.style.display = "";
	var elemMenuDivInFrame = ifmMenu.document.all("divAroundMenu");
	var elemMenuTable = ifmMenu.document.all(g_strRTEMenuTableElementName);
	var cyDropDownMax = 300;
	var rgnToolBarButtonCoordinates = RTE_GetElementWindowCoordinates(elemToolBarButton);
	var xToolBarButton = rgnToolBarButtonCoordinates[g_iRTELeft];
	var yToolBarButton = rgnToolBarButtonCoordinates[g_iRTETop];
	var cxToolBarButton = elemToolBarButton.offsetWidth;
	var cyToolBarButton = elemToolBarButton.offsetHeight;
	var cxDropDown = elemMenuTable.scrollWidth + 4; 
	var cyDropDown = elemMenuTable.scrollHeight + 4;
	var cxBody = elemMenu.document.documentElement.offsetWidth;
	var cyBody = elemMenu.document.documentElement.offsetHeight;
	var yDropDown = rgnToolBarButtonCoordinates[g_iRTETop] + elemToolBarButton.offsetHeight;
	var xDropDown = rgnToolBarButtonCoordinates[g_iRTELeft];
	var fNeedVerticalScrollBar = false;
	if (cyDropDown > cyDropDownMax)
	{
		fNeedVerticalScrollBar = true;
		cyDropDown = cyDropDownMax;
	}
	if (cyDropDown > cyBody)
	{
		fNeedVerticalScrollBar = true;
		cyDropDown = cyBody - 30;
	}
	if (yDropDown + cyDropDown > cyBody)
	{
		yDropDown =  rgnToolBarButtonCoordinates[g_iRTETop] - cyDropDown - 10;
		if (0 > yDropDown)
		{
			yDropDown = 0;
		}
	}
	if (xDropDown + cxDropDown > cxBody)
	{
		xDropDown = cxBody - cxDropDown - 30;
		if (0 > xDropDown)
		{
			xDropDown = 0;
		}
	}
	if (fNeedVerticalScrollBar)
	{
		ifmMenu.document.body.scroll = "yes";
		cxDropDown += 22; 
	}
	else
	{
		ifmMenu.document.body.scroll = "";
	}
	elemMenu.style.left = xDropDown;
	elemMenu.style.top = yDropDown;
	elemMenu.style.width = cxDropDown;
	elemMenu.style.height = cyDropDown;
	RTE_DD_SetHighlightOnMenuItem(RTE_DD_GetMenuItem(0));
}
function RTE_DD_CloseMenu()
{
	var elemMenu = RTE_DD_GetMenuElement();
	if (null == elemMenu)
	{
		return;
	}
	elemMenu.style.display = "none";
	if ((g_strRTEDDBaseElementID != null) && (g_strRTEDDButtonMnemonic != null))
	{
		RTE_TB_ClearButtonHover(RTE_TB_GetToolBarButton(g_strRTEDDBaseElementID, g_strRTEDDButtonMnemonic));
	}
	g_strRTEDDBaseElementID = null;
	g_strRTEDDButtonMnemonic = null;
	g_elemRTEHighlightedMenuItem = null;
	g_iRTEHighlightedMenuItem = -1;
	g_iRTEMenuItemMax = -1;
}
function RTE_DD_GenerateMenuOpenHtml(strWebLanguage)
{
	if (strWebLanguage == "1037" || strWebLanguage == "1025")
		return "<table dir=\"rtl\" id=\"" + g_strRTEMenuTableElementName + "\"cellspacing=0 cellpading=0 border=0><tr>";
	else
		return "<table id=\"" + g_strRTEMenuTableElementName + "\"cellspacing=0 cellpading=0 border=0><tr>";
}
function RTE_DD_GenerateMenuCloseHtml()
{
	return "</tr></table>";
}
function RTE_DD_GenerateMenuItemHtml(cColumns, iMenuItem, strCommandToPerform, strCommandValue, strMenuItemHtml, strMenuItemToolTip)
{
	var strHtmlRet = "";
	if (((1 >= cColumns) || ((1 < cColumns) && (0 == (iMenuItem % cColumns)))) && (0 != iMenuItem))
	{
		strHtmlRet = "</tr><tr>";
	}
	strHtmlRet += "<td class=\"ms-toolbar " + g_strRTEUnselectedClassName + "\" nowrap id=\"" + g_strRTEMenuItemBaseName + iMenuItem + "\" " +
			g_strRTEMenuItemAttributeName + "=\"" + iMenuItem +"\" onfocus=\"RTE_DD_Item_OnFocus(this)\" onclick=\"return RTE_DD_StartCmdExec('"+ strCommandToPerform + "', '" + strCommandValue +
			"')\" onmouseover=\"RTE_DDItem_OnMouseOver(this);\" onmouseout=\"RTE_DDItem_OnMouseOut(this);\"><a TABINDEX=-1 href=\"#\" class=\"" + g_strRTEUnselectedClassName + 
			"\" style=\"text-decoration: none; color: black; cursor: hand;\" title=\"" + strMenuItemToolTip + "\" onblur=\"RTE_DD_Item_OnBlur()\" onfocus=\"RTE_DD_Item_OnFocus(this.parentElement)\" >" +
			strMenuItemHtml + "</a></td>";
	return strHtmlRet;
}
function RTE_DD_GetMenuItem(iMenuItem)
{
	var elemMenuItem = RTE_DD_GetMenuFrame().document.all(g_strRTEMenuItemBaseName + iMenuItem);
	return elemMenuItem;
}
function RTE_DD_GetHighlightedMenuItem()
{
	return g_elemRTEHighlightedMenuItem;
}
function RTE_DD_ClearHighlightOnMenuItem(elemMenuItem)
{
	RTE_TB_OnMouseOut(elemMenuItem);
}
function RTE_DD_ClearHighlightedMenuItem()
{
	RTE_DD_ClearHighlightOnMenuItem(RTE_DD_GetHighlightedMenuItem());
}
function RTE_DD_SetHighlightOnMenuItem(elemMenuItem)
{
	if (!RTE_DD_MenuIsOpen())
	{
		return;
	}
	var strMenuItemAttributeValue = elemMenuItem.getAttribute(g_strRTEMenuItemAttributeName);
	if (null != g_elemRTEHighlightedMenuItem)
	{
		RTE_DD_ClearHighlightOnMenuItem(g_elemRTEHighlightedMenuItem)
		g_elemRTEHighlightedMenuItem = null;
		g_iRTEHighlightedMenuItem = -1;
	}
	RTE_TB_OnMouseOver(elemMenuItem);
	elemMenuItem.children(0).focus();
	g_elemRTEHighlightedMenuItem = elemMenuItem;
	g_iRTEHighlightedMenuItem = parseInt(strMenuItemAttributeValue);
}
function RTE_DD_SetHighlightOnPrevMenuItem(cItemsToMove)
{
	var elemHighlighted = RTE_DD_GetHighlightedMenuItem();
	var strMenuItemAttributeValue = elemHighlighted.getAttribute(g_strRTEMenuItemAttributeName);
	var iMenuItem = parseInt(strMenuItemAttributeValue);
	if (iMenuItem > 0)
	{
		var iNewMenuItem = Math.max(iMenuItem - cItemsToMove, 0);
		var elemPrev = RTE_DD_GetMenuItem(iNewMenuItem);
		RTE_DD_SetHighlightOnMenuItem(elemPrev);
	}
}
function RTE_DD_SetHighlightOnNextMenuItem(cItemsToMove)
{
	var elemHighlighted = RTE_DD_GetHighlightedMenuItem();
	var strMenuItemAttributeValue = elemHighlighted.getAttribute(g_strRTEMenuItemAttributeName);
	var iMenuItem = parseInt(strMenuItemAttributeValue);
	if (iMenuItem < g_iRTEMenuItemMax)
	{
		var iNewMenuItem = Math.min(iMenuItem + cItemsToMove, g_iRTEMenuItemMax);
		var elemNext = RTE_DD_GetMenuItem(iNewMenuItem);
		RTE_DD_SetHighlightOnMenuItem(elemNext);
	}
}
function RTE_DD_StartCmdExec(strCommandToPerform, strCommandValue)
{
	document.body.setAttribute(g_strRTECommandToExecuteAttributeName, strCommandToPerform);
	document.body.setAttribute(g_strRTECommandValueAttributeName, strCommandValue);
	document.body.focus();
	RTE_DD_SetHighlightOnMenuItem(RTE_DD_GetMenuItem(0));
	return false;
}
function RTE_DD_OnFocus()
{
}
function RTE_DD_OnBlur()
{
	var elemMenu = RTE_DD_GetMenuElement();
	if (elemMenu.getAttribute(g_strRTEMenuOpeningAttributeName) == "1")
	{
		return;
	}
	var strBaseElementID = RTE_DD_GetMenuBaseElementID();
	var ifmMenu = RTE_DD_GetMenuFrame();
	var strCommandToPerform = ifmMenu.document.body.getAttribute(g_strRTECommandToExecuteAttributeName);
	var strCommandValue = ifmMenu.document.body.getAttribute(g_strRTECommandValueAttributeName);
	RTE_DD_CloseMenu();
	RTE_GiveEditorFocus(strBaseElementID);
	RTE_RestoreSelection(strBaseElementID);
	if ("x" != strCommandToPerform)
	{
		RTE_ExecuteCommandOnSelection(RTE_DD_GetMenuBaseElementID(), strCommandToPerform, false, strCommandValue);
	}
}
function RTE_DD_Item_OnFocus(elemMenuItemCell)
{
	var elemMenu = RTE_DD_GetMenuElement();
	elemMenu.setAttribute(g_strRTEMenuOpeningAttributeName, "0");
	RTE_DD_SetHighlightOnMenuItem(elemMenuItemCell);
}
function RTE_DD_Item_OnBlur()
{
	g_elemRTEHighlightedMenuItem = null;
	g_iRTEHighlightedMenuItem = -1;
	window.setTimeout("RTE_OnItemBlurTestCloseMenu()", 30);
}
function RTE_OnItemBlurTestCloseMenu()
{
	if (null == g_elemRTEHighlightedMenuItem)
	{
		RTE_DD_CloseMenu();
	}
}
function RTE_DD_OnKeyDown(elem)
{
	var evtSource = elem.document.parentWindow.event;
	var nKeyCode = evtSource.keyCode;
	var fAltKey = evtSource.altKey;
	var fCtrlKey = evtSource.ctrlKey;
	var fShiftKey = evtSource.shiftKey;
	if (!fCtrlKey && !fAltKey && !fShiftKey)
	{
		switch (nKeyCode)
		{
			case 27: 
				var strBaseElementID = g_strRTEDDBaseElementID;	
				RTE_DD_CloseMenu();
				RTE_GiveEditorFocus(strBaseElementID);
				RTE_ResetAllToolBarStates(strBaseElementID);
				break;
			case 38: 
				evtSource.returnValue = false;
				RTE_DD_SetHighlightOnPrevMenuItem(1);
				break;
			case 9: 
			   evtSource.returnValue = false;
			   break;
			case 40: 
				evtSource.returnValue = false;
				RTE_DD_SetHighlightOnNextMenuItem(1);
				break;
			case 33: 
				evtSource.returnValue = false;
				RTE_DD_SetHighlightOnPrevMenuItem(12);
				break;
			case 34: 
				evtSource.returnValue = false;
				RTE_DD_SetHighlightOnNextMenuItem(12);
				break;
			case 36: 
				evtSource.returnValue = false;
				break;
			case 35: 
				evtSource.returnValue = false;
				break;
		}
	} 
	if (!fCtrlKey && !fAltKey && fShiftKey)
	{
		switch (nKeyCode)
		{
			case 9: 
				evtSource.returnValue = false;
				break;
		}
	} 
}
function RTE_DDItem_OnMouseOver(elemTD)
{
	if (null != elemTD)
	{
		RTE_DD_SetHighlightOnMenuItem(elemTD);
	}
}
function RTE_DDItem_OnMouseOut(elemTD)
{
	if (null != elemTD)
	{
		RTE_DD_ClearHighlightOnMenuItem(elemTD);
	}
}
var g_rgstrRTEMenuHtml = new Array();
var g_strRTEColorMatrixMenuItemPrefixHtml = "<div unselectable=\"on\" style=\"width: 10px; height: 10px; background-color: ";
var g_strRTEColorMatrixMenuItemSufffixHtml = ";\"><img unselectable=\"on\" width=10 height=10 src=\"" + RTE_GetServerRelativeUnlocalizedImageUrl("blank.gif") + "\" alt=\"%TOOLTIP%\"></div>";
function RTE_DD_OpenFontNameOrSizeSelector(strBaseElementID, strWebLanguage, fGeneratingFontNameSelector)
{
	var rngSelection = RTE_GetSelection(strBaseElementID);
	var strSelectionFontName = rngSelection.queryCommandValue(g_strRTEFontNameMnemonic);
	var strSelectionFontSize = rngSelection.queryCommandValue(g_strRTEFontSizeMnemonic);
	var fSelectionBold = rngSelection.queryCommandValue(g_strRTEBoldMnemonic);
	var fSelectionItalic = rngSelection.queryCommandValue(g_strRTEItalicMnemonic);
	var strMenuHtml = "";
	var cMenuItems = -1;
	var strButtonMnemonic = "";
	var rgoMenuInfo = RTE_DD_GetFontNameOrSizeSelectorUnformattedHtml(fGeneratingFontNameSelector, strWebLanguage);
	strMenuHtml = rgoMenuInfo[0];
	cMenuItems = rgoMenuInfo[1];
	if (fGeneratingFontNameSelector)
	{
		strMenuHtml = strMenuHtml.replace(new RegExp(g_strRTEFontSizeToken, "g"), Math.min(Math.max(strSelectionFontSize, 2), 5));
		strButtonMnemonic = g_strRTEFontNameMnemonic;
	}
	else
	{
		strMenuHtml = strMenuHtml.replace(new RegExp(g_strRTEFontNameToken, "g"), strSelectionFontName);
		strButtonMnemonic = g_strRTEFontSizeMnemonic;
	}
	var strBegBoldItalicInsert = "";
	var strEndBoldItalicInsert = "";
	if (fSelectionBold)
	{
		strBegBoldItalicInsert = "<b>";
		strEndBoldItalicInsert = "</b>";
	}
	if (fSelectionItalic)
	{
		strBegBoldItalicInsert += "<i>";
		strEndBoldItalicInsert += "</i>";
	}
	strMenuHtml = strMenuHtml.replace(new RegExp(g_strRTEBegBoldItalicToken, "g"), strBegBoldItalicInsert);
	strMenuHtml = strMenuHtml.replace(new RegExp(g_strRTEEndBoldItalicToken, "g"), strEndBoldItalicInsert);
	RTE_DD_OpenMenu(strBaseElementID, strButtonMnemonic, strMenuHtml, cMenuItems);
}
function RTE_DD_GetFontNameOrSizeSelectorUnformattedHtml(fGeneratingFontNameSelector, strWebLanguage)
{
	var strCommandToPerform;
	if (fGeneratingFontNameSelector)
	{
		strCommandToPerform = g_strRTEFontNameMnemonic;
	}
	else
	{
		strCommandToPerform = g_strRTEFontSizeMnemonic;
	}
	var strMenuHtml = g_rgstrRTEMenuHtml[strCommandToPerform];
	if (null != strMenuHtml)
	{
		return strMenuHtml;
	}
	strMenuHtml = RTE_DD_GenerateMenuOpenHtml(strWebLanguage);
	var cMenuItems = -1;
	if (fGeneratingFontNameSelector)
	{
		var rgstrClientFonts = RTE_GetSortedFontNames();
		cMenuItems = rgstrClientFonts.length;
		var iFont;
		for (iFont = 0; iFont < cMenuItems; iFont++)
		{
			strMenuHtml += RTE_DD_GenerateMenuItemHtml(1, iFont, strCommandToPerform, rgstrClientFonts[iFont],
					g_strRTEBegBoldItalicToken + "<font size=\"" + g_strRTEFontSizeToken + "\" face=\"" + rgstrClientFonts[iFont] + "\">" +
					rgstrClientFonts[iFont] + "</font>" + g_strRTEEndBoldItalicToken, "");
		}
	}
	else
	{
		cMenuItems = 7;
		var nFontSize;
		for (nFontSize = 1; nFontSize <= cMenuItems; nFontSize++)
		{
			strMenuHtml += RTE_DD_GenerateMenuItemHtml(1, nFontSize - 1, strCommandToPerform, nFontSize,
					g_strRTEBegBoldItalicToken + "<font size=\"" + nFontSize + "\" face=\"" + g_strRTEFontNameToken + "\">" +
					nFontSize + " - " + L_ExampleText_TEXT + "</font>" + g_strRTEEndBoldItalicToken, "");
		}
	}
	strMenuHtml += RTE_DD_GenerateMenuCloseHtml();
	g_rgstrRTEMenuHtml[strCommandToPerform] = new Array(strMenuHtml, cMenuItems);
	return g_rgstrRTEMenuHtml[strCommandToPerform];
}
function RTE_DD_OpenForeColorSelector(strBaseElementID, strWebLanguage)
{
	RTE_DD_OpenMenu(strBaseElementID, g_strRTEForeColorMnemonic, RTE_DD_GetColorSelectorHtml(g_strRTEForeColorMnemonic, strWebLanguage), g_rgrgstrRTEColorMatrix.length);
}
function RTE_DD_OpenBackColorSelector(strBaseElementID, strWebLanguage)
{
	RTE_DD_OpenMenu(strBaseElementID, g_strRTEBackColorMnemonic, RTE_DD_GetColorSelectorHtml(g_strRTEBackColorMnemonic, strWebLanguage), g_rgrgstrRTEColorMatrix.length);
}
function RTE_DD_GetColorSelectorHtml(strCommandToPerform, strWebLanguage)
{
	var strMenuHtml = g_rgstrRTEMenuHtml[strCommandToPerform];
	if (null == strMenuHtml)
	{
		strMenuHtml = RTE_DD_GenerateMenuOpenHtml(strWebLanguage);
		var iColor;
		for (iColor = 0; iColor < g_rgrgstrRTEColorMatrix.length; iColor++)
		{
			strMenuHtml += RTE_DD_GenerateMenuItemHtml(g_cRTEColorMatrixColumns, iColor, strCommandToPerform,
					g_rgrgstrRTEColorMatrix[iColor][1], g_strRTEColorMatrixMenuItemPrefixHtml + g_rgrgstrRTEColorMatrix[iColor][1] +
					g_strRTEColorMatrixMenuItemSufffixHtml.replace("%TOOLTIP%", g_rgrgstrRTEColorMatrix[iColor][0]), "");
		}
		strMenuHtml += RTE_DD_GenerateMenuCloseHtml();
		g_rgstrRTEMenuHtml[strCommandToPerform] = strMenuHtml;
	}
	return strMenuHtml;
}
var g_cRTEColorMatrixColumns = 8;
var g_rgrgstrRTEColorMatrix = new Array(
	new Array(L_Black_TEXT, "#000000"), new Array(L_Brown_TEXT, "#993300"), new Array(L_OliveGreen_TEXT, "#333300"), new Array(L_DarkGreen_TEXT, "#003300"),
	new Array(L_DarkTeal_TEXT, "#003366"), new Array(L_DarkBlue_TEXT, "#000080"), new Array(L_Indigo_TEXT, "#333399"), new Array(L_Gray80_TEXT, "#333333"),
	new Array(L_DarkRed_TEXT, "#800000"), new Array(L_Orange_TEXT, "#ff6600"), new Array(L_DarkYellow_TEXT, "#808000"), new Array(L_Green_TEXT, "#008000"),
	new Array(L_Teal_TEXT, "#008080"), new Array(L_Blue_TEXT, "#0000FF"), new Array(L_BlueGray_TEXT, "#666699"), new Array(L_Gray50_TEXT, "#808080"),
	new Array(L_Red_TEXT, "#FF0000"), new Array(L_LightOrange_TEXT, "#ff9900"), new Array(L_Lime_TEXT, "#99cc00"), new Array(L_SeaGreen_TEXT, "#339966"),
	new Array(L_Aqua_TEXT, "#33cccc"), new Array(L_LightBlue_TEXT, "#3366ff"), new Array(L_Violet_TEXT, "#800080"), new Array(L_Gray40_TEXT, "#969696"),
	new Array(L_Pink_TEXT, "#FF00FF"), new Array(L_Gold_TEXT, "#ffcc00"), new Array(L_Yellow_TEXT, "#FFFF00"), new Array(L_BrightGreen_TEXT, "#00FF00"),
	new Array(L_Turquoise_TEXT, "#00FFFF"), new Array(L_SkyBlue_TEXT, "#00ccff"), new Array(L_Plum_TEXT, "#993366"), new Array(L_Gray25_TEXT, "#C0C0C0"),
	new Array(L_Rose_TEXT, "#ff99cc"), new Array(L_Tan_TEXT, "#ffcc99"), new Array(L_LightYellow_TEXT, "#ffff99"), new Array(L_LightGreen_TEXT, "#ccffcc"),
	new Array(L_LightTurquoise_TEXT, "#ccffff"), new Array(L_PaleBlue_TEXT, "#99ccff"), new Array(L_Lavender_TEXT, "#cc99ff"), new Array(L_White_TEXT, "#FFFFFF") );
function RTE_GetDialogHelper()
{
	return document.all(g_strRTEDialogHelperID);
}
function RTE_GetSortedFontNames()
{
	var rgstrFontNamesRet = new Array();
	var dh = RTE_GetDialogHelper();
	if ((null != dh) && (null != dh.fonts) && (0 < dh.fonts.count))
	{
		var iFont;
		for (iFont = 1; iFont < dh.fonts.count; iFont++)
		{
			RTE_InsertIntoSortedArrayIfValid(dh.fonts(iFont), rgstrFontNamesRet);
		}
	}
	else
	{
		RTE_InsertIntoSortedArrayIfValid(L_Font1_TEXT, rgstrFontNamesRet);
		RTE_InsertIntoSortedArrayIfValid(L_Font2_TEXT, rgstrFontNamesRet);
		RTE_InsertIntoSortedArrayIfValid(L_Font3_TEXT, rgstrFontNamesRet);
		RTE_InsertIntoSortedArrayIfValid(L_Font4_TEXT, rgstrFontNamesRet);
		RTE_InsertIntoSortedArrayIfValid(L_Font5_TEXT, rgstrFontNamesRet);
		RTE_InsertIntoSortedArrayIfValid(L_Font6_TEXT, rgstrFontNamesRet);
		RTE_InsertIntoSortedArrayIfValid(L_Font7_TEXT, rgstrFontNamesRet);
		RTE_InsertIntoSortedArrayIfValid(L_Font8_TEXT, rgstrFontNamesRet);
	}
	return rgstrFontNamesRet;
}
function RTE_IsChildOfElement(elemSearchingFor, elemToSearch)
{
	var rgelemChildren = elemToSearch.children;
	if ((null == rgelemChildren) || (0 >= rgelemChildren.length))
	{
		return false;
	}
	var iChild = 0;
	for (iChild = 0; iChild < rgelemChildren.length; iChild++)
	{
		var elemChild = rgelemChildren[iChild];
		if (elemChild == elemSearchingFor)
		{
			return true;
		}
		if (RTE_IsChildOfElement(elemSearchingFor, elemChild))
		{
			return true;
		}
	}
	return false;
}
function RTE_FindParentElementWithTag(elem, strTagName)
{
	if (null == elem.parentElement)
	{
		return null;
	}
	return RTE_FindParentElementOrSelfWithTag(elem.parentElement, strTagName);
}
function RTE_FindParentElementOrSelfWithTag(elem, strTagName)
{
	if (elem.tagName == strTagName)
	{
		return elem;
	}
	else
	{
		if (null == elem.parentElement)
		{
			return null;
		}
		return RTE_FindParentElementOrSelfWithTag(elem.parentElement, strTagName);
	}
}
var g_iRTELeft = 0;
var g_iRTETop = 1;
var g_iRTEWidth = 2;
var g_iRTEHeight = 3;
var g_iRTERight = 4;
var g_iRTEBottom = 5;
function RTE_GetElementWindowCoordinates(elem)
{
	var xLeft = 0;
	var yTop = 0;
	var cxWidth = elem.offsetWidth;
	var cyHeight = elem.offsetHeight;
	do
	{
		xLeft += elem.offsetLeft;
		yTop += elem.offsetTop;
		if (null == elem.offsetParent)
		{
			xLeft += parseInt(elem.currentStyle.marginLeft);
			yTop += parseInt(elem.currentStyle.marginTop);
		}
		elem = elem.offsetParent;
	}
	while (elem != null);
	var rgnRet = new Array();
	rgnRet[g_iRTELeft] = xLeft;
	rgnRet[g_iRTETop] = yTop;
	rgnRet[g_iRTEWidth] = cxWidth;
	rgnRet[g_iRTEHeight] = cyHeight;
	rgnRet[g_iRTERight] = xLeft + cxWidth - 1;
	rgnRet[g_iRTEBottom] = yTop + cyHeight - 1;
	return rgnRet;
}
function RTE_GetServerRelativeUnlocalizedImageUrl(strImageFileName)
{
   return "/_layouts/images/" + strImageFileName;
}
function RTE_GetServerRelativeImageUrl(strImageFileName)
{
	return "/_layouts/" + L_Language_Text + "/images/" + strImageFileName;
}
function RTE_GetServerRelativeStylesheetUrl(strStylesheetFileName, strWebLocale)
{
   return "/_layouts/" + strWebLocale+ "/styles/" + strStylesheetFileName;
}
function RTE_GetServerRelativeScriptUrl(strScriptFileName, strWebLocale)
{
   return "/_layouts/" + strWebLocale+ "/" + strScriptFileName;
}
function RTE_StripDoubleSpaces(str)
{
	while (str.indexOf("  ") != -1)
	{
		str = str.replace(/  /g, " ");
	}
	return str;
}
function RTE_AddClassToClassList(strClassList, strNewClass)
{
	if (0 <= strClassList.indexOf(strNewClass))
	{
		return strClassList;
	}
	return RTE_StripDoubleSpaces(strClassList + " " + strNewClass);
}
function RTE_ReplaceClassInClassList(strClassList, strOldClass, strNewClass)
{
	var iSel = strClassList.indexOf(strOldClass);
	var strAheadOfOldClass = "";
	if (0 < iSel)
	{
		return RTE_StripDoubleSpaces(strClassList.substr(0, iSel) + " " + strNewClass + " " + strClassList.substr(iSel + strOldClass.length));
	}
	return RTE_AddClassToClassList(strClassList, strNewClass);
}
function RTE_RemoveClassFromClassList(strClassList, strClass)
{
	return RTE_ReplaceClassInClassList(strClassList, strClass, "");
}
function RTE_AddOrRemoveClassFromClassList(fAdd, strClassList, strClass)
{
	if (fAdd)
	{
		return RTE_AddClassToClassList(strClassList, strClass);
	}
	return RTE_RemoveClassFromClassList(strClassList, strClass);
}
function RTE_InsertIntoSortedArrayIfValid(strInsert, rgstrDest)
{
	if ((null == strInsert) || (0 == strInsert.length))
	{
		return;
	}
	var i = 0;
	for (i = rgstrDest.length; i >= 0; i--)
	{
		if ((0 == i) || (rgstrDest[i - 1] < strInsert))
		{
			rgstrDest[i] = strInsert;
			return;
		}
		else
		{
			rgstrDest[i] = rgstrDest[i - 1];
		}
	}
}
function FormTabIndex()
{
    if (window.formTabIndex) {
        if (formTabIndex == -1)
            return "";
        return "tabindex=" + formTabIndex;
    }
    return "tabindex=1";
}
function IntlDate(yr, mon, day, hr, min, sec,  caltype)
{
	this.yr = yr;
	this.mon = mon;
	this.day = day;
	this.hr = hr;
	this.min = min;
	this.sec = sec;
	this.caltype = caltype;
}
IntlDate.prototype.valueOf = toIntlValue;
function toIntlValue()
{
	var status = 0;
	var maxMonth = 11;
	if ((this.caltype == 6 || this.caltype == 8) && (this.day < 1 || this.day > 30))
		status = Number.NaN;
	if (this.caltype == 8) 
		if ((((this.yr * 7) + 1) % 19) < 7) 
			maxMonth = 12;
	if (this.mon < 0 || this.mon > maxMonth)
		status = Number.NaN;
	if(this.caltype == 7)
	{
		var date = new Date(Date.UTC(this.yr-543, this.mon, this.day));
		if ((this.yr-543) != date.getUTCFullYear() || this.mon != date.getUTCMonth() || this.day != date.getUTCDate())
			status =  Number.NaN;
	}
	return status;
}
IntlDate.prototype.setUTCHours = setIntlHours;
function setIntlHours(hr, min, sec, msec)
{
	if (!min) min = 0;
	if (!sec) sec = 0;
	this.hr = hr;
	this.min = min;
	this.sec = sec;
}
IntlDate.prototype.setSeconds = setIntlSeconds;
function setIntlSeconds(sec)
{
	this.sec = sec;
}
IntlDate.prototype.setTime = setIntlTime;
function setIntlTime(msec)
{
	var date = new Date(msec);
	this.yr = date.getFullYear();
	this.mon = date.getMonth();
	this.day = date.getDate();
	this.hr = date.getHours();
	this.min = date.getMinutes();
	this.sec = date.getSeconds();
}
IntlDate.prototype.getUTCFullYear = getIntlFullYear;
function getIntlFullYear()
{
	return this.yr;
}
IntlDate.prototype.getUTCMonth = getIntlMonth;
function getIntlMonth()
{
	return this.mon;
}
IntlDate.prototype.getUTCDate = getIntlDate;
function getIntlDate()
{
	return this.day;
}
IntlDate.prototype.getUTCHours = getIntlHours;
function getIntlHours()
{
	return this.hr;
}
IntlDate.prototype.getUTCMinutes = getIntlMinutes;
function getIntlMinutes()
{
	return this.min;
}
IntlDate.prototype.getUTCSeconds = getIntlSeconds;
function getIntlSeconds()
{
	return this.sec;
}
IntlDate.prototype.getTime = getIntlTime;
function getIntlTime()
{
	var date = new Date(this.yr, this.mon, this.day, this.hr, this.min, this.sec);
	return date.getTime();
}
function DateOptions()
{
	var L_strAllDay_Text="\u5168\u5929";
	var L_strMore_Text="\u5176\u4ed6...";
	var strMore=L_strMore_Text;
	var strAllDay=L_strAllDay_Text;
	var L_AllDayWidth_Text = 54;	
	var L_StrAM_Text="\u4e0a\u5348";
	var L_StrPM_Text="\u4e0b\u5348";
	this.stDateOrder = "MDY";
	this.f12Hour = true;
	this.stAM = L_StrAM_Text;
	this.stPM = L_StrPM_Text;
	this.TimeMarkPosn = 0;
	this.dminControl = 5;
	this.chDateSep = "/";
	this.chTimeSep = ":";
	this.dyrWindow = 30;
	this.dow = 0;
	this.webTZOffsetMin = 0;
	this.WorkDayStartHour = 8;
	this.WorkDayEndHour = 17;
	this.DailyStartHourDelta = 1;	
	this.DailyEndHourDelta = 4;
	this.CalendarPeriod = "month"
	this.L_AllDay_Text = strAllDay;
	this.AllDayWidth = L_AllDayWidth_Text;
	this.L_More_Text = strMore;
}
DateOptions.prototype.SetTimeFormat = DOSetTimeFormat;
function DOSetTimeFormat(w)
{
	this.f12Hour = (w == 0);
}
DateOptions.prototype.SetDateOrder = DOSetDateOrder;
function DOSetDateOrder(w)
{
	switch (w)
		{
	case 0:
		this.stDateOrder = "MDY";
		break;
	case 1:
		this.stDateOrder = "DMY";
		break;
	case 2:
		this.stDateOrder = "YMD";
		break;
		}
}
DateOptions.prototype.SetDOW = DOSetDOW;
function DOSetDOW(dow)
{
	this.dow = (dow+1)%7;
}
DateOptions.prototype.ParseLocaleDate = DOParseLocaleDate;
function DOParseLocaleDate(stDate, caltype)
{
	var chSep = this.chDateSep;
	var ord = this.stDateOrder;
	var ichSlash1 = stDate.indexOf(chSep);
	var num1;
	var num2;
	var num3;
	var mon;
	var day;
	var yr;
	if (ichSlash1 < 0)
		{
		chSep = "/";
		ichSlash1 = stDate.indexOf(chSep);
		if (ichSlash1 < 0)
			{
			chSep = "-";
			ichSlash1 = stDate.indexOf(chSep);
			}
		}
	if (ichSlash1 < 0)
		return Number.NaN;
	var ichSlash2 = stDate.indexOf(chSep, ichSlash1+1);
	num1 = stDate.substr(0, ichSlash1) - 0;
	if (ichSlash2 < 0)
		{
		if (caltype != 1)
			return Number.NaN;
		ichSlash2 = stDate.length;
		var date = this.Today();
		num3 = date.getUTCFullYear();
		if (ord == "YMD")
			ord = "MDY";
		}
	else
		{
		num3 = stDate.substr(ichSlash2+1) - 0;
		}
	num2 = stDate.substr(ichSlash1 + 1, ichSlash2 - ichSlash1 - 1) - 0;
	if (isNaN(num1) || isNaN(num3) || isNaN(num3))
		return Number.NaN;
	var yrLen;
	switch (ord)
		{
	case "DMY":
		day = num1;
		mon = num2;
		yr = num3;
		yrLen = stDate.length - ichSlash2 - 1;
		break;
	case "YMD":
		yr = num1;
		yrLen = ichSlash1;
		mon = num2;
		day = num3;
		break;
	case "MDY":
		mon = num1;
		day = num2;
		yr = num3;
		yrLen = stDate.length - ichSlash2 - 1;
		break;
		}
	if (yr < 0)
		return Number.NaN;
	if (yrLen < 3)
		yr = this.YrWindow(yr, caltype);
	mon = mon-1;
       var yrMin = 1900;	
       var yrMax = 8900;   
       switch (caltype)
       {
       case 6:  
        	yrMin = 1319;
        	yrMax = 3481;
        	break;
       case 7:  
        	yrMin = 2444;
        	yrMax = 5043;
        	break;
       case 8:  
        	yrMin = 5662;
        	yrMax = 5998;
        	break;
       case 16:  
        	yrMin = 1823;
        	yrMax = 3920;
        	break;
       }
	var minCalGregorian = caltype == 1 && yr == 1899 && mon == 11 && day == 31;
	if ((yr < yrMin || yr > yrMax) && !minCalGregorian)
	{
		return Number.NaN;
	}
	switch(caltype)
		{
		case 6: 
		case 7: 
		case 8: 
			var date = this.DateIntlYMD(yr, mon, day, caltype);
			break;
		default:
			var date = this.DateYMD(yr, mon, day);
			break;
		}
	return date;
}
DateOptions.prototype.DateYMD = DODateYMD;
function DODateYMD(yr, mon, day)
{
	if (isNaN(yr) || isNaN(mon) || isNaN(day))
		return Number.NaN;
	var date = new Date(Date.UTC(yr, mon, day));
	if (yr != date.getUTCFullYear() || mon != date.getUTCMonth() ||
		day != date.getUTCDate())
		return Number.NaN;
	return date;
}
DateOptions.prototype.DateIntlYMD = DODateIntlYMD;
function DODateIntlYMD(yr, mon, day, caltype)
{
	if (isNaN(yr) || isNaN(mon) || isNaN(day))
		return Number.NaN;
	var date = new IntlDate(yr, mon, day, 0, 0, 0, caltype);
	return date;
}
DateOptions.prototype.YrWindow = DOYrWindow;
function DOYrWindow(st, caltype)
{
	var yr = st - 0;
	if (isNaN(yr))
		return st;
	if (st < 100)
	{
		switch(caltype)
		{
		case 1:  
		    var date = this.Today();
		    var yrCur = date.getUTCFullYear();
		    yr += WMultiple(yrCur, 100);
		    if (yr > yrCur + this.dyrWindow)
			    yr -= 100;
		    else if (yr < yrCur + this.dyrWindow - 100)
			    yr += 100;
		    break;
		case 6:  
		    if(yr < 52)
		    	yr +=1400;
		    else
		    	yr +=1300;
		    break;			
		case 7:  
		    if(yr < 73)
		    	yr +=2500;
		    else
		    	yr +=2400;
		    break;			
		case 8:  
		    if(yr < 91)
		    	yr +=5700;
		    else
		    	yr +=5600;
		    break;			
		case 16:  
		    if(yr < 52)
		    	yr +=1900;
		    else
		    	yr +=1800;
		    break;			
		}
		return yr;		
	}
	return st;
}
DateOptions.prototype.StDate = DOStDate;
function DOStDate(date)
{
	return this.StDateString(date.getUTCFullYear(), date.getUTCMonth() + 1, date.getUTCDate());
}
DateOptions.prototype.StDateString = DOStDateString;
function DOStDateString(yr, mon, day)
{
	var st;
	switch (this.stDateOrder)
		{
	case "MDY":
		st = mon + this.chDateSep + day + this.chDateSep + yr;
		break;
	case "DMY":
		st = day + this.chDateSep + mon + this.chDateSep + yr;
		break;
	case "YMD":
		st = yr + this.chDateSep + mon + this.chDateSep + day;
		break;
		}
	return st;
}
DateOptions.prototype.StTime = DOStTime;
function DOStTime(date)
{
	var stSuff = "";
	var hr = date.getUTCHours();
	var min = date.getUTCMinutes();
	if (this.f12Hour)
		{
		if (hr >= 12)
			{
			stSuff = this.stPM;
			if (hr > 12)
				hr -= 12;
			}
		else
			{
			if (hr == 0)
				hr = 12;
			stSuff = this.stAM;
			}
		}
	if(this.TimeMarkPosn == 0)
		return hr + this.chTimeSep + St2Digits(min) + " " + stSuff;
	else
		return stSuff + " " + hr + this.chTimeSep + St2Digits(min);
}
DateOptions.prototype.StBareTime = DOStBareTime;
function DOStBareTime(date)
{
	var stSuff = "";
	var hr = date.getUTCHours();
	var min = date.getUTCMinutes();
	if (this.f12Hour)
		{
		if (hr >= 12)
			{
			if (hr > 12)
				hr -= 12;
			}
		else
			{
			if (hr == 0)
				hr = 12;
			}
		}
	return hr + this.chTimeSep + St2Digits(min);
}
DateOptions.FHasTime = DOFHasTime;
function DOFHasTime(date)
{
	var hr = date.getUTCHours();
	var min = date.getUTCMinutes();
	return (hr != 0 || min != 0);
}
DateOptions.prototype.StTimeControls = DOStTimeControls;
function DOStTimeControls(fld, date)
{
	var st;
	var hr = date.getUTCHours();
	var min = date.getUTCMinutes();
	var hrT;
	var hrTT;
	var stSuff = "";
	var hrMax;
	var fPM;
	var L_Hours_Text="\u5c0f\u65f6";
	var L_Minutes_Text="\u5206\u949f";
	var L_Time_Text = ":"; 
	var L_MinutesTime_Text = ""; 
	var L_SmallHour_Text = "0"; 
	st = "<span dir=ltr><SELECT TITLE='" + L_Hours_Text + "' " + FormTabIndex() + " class='ms-input' NAME=" + StAttrQuote(fld.frm.StFieldName(fld, "Hours")) + ">\r";
	for (hrT = 0; hrT < 24; hrT++)
		{
		if (hrT == hr)
			stSelected = " SELECTED";
		else
			stSelected = "";
		st += "<OPTION VALUE=" + hrT + stSelected + ">";
		hrTT = hrT;
		if (this.f12Hour)
			{
			if (hrT < 12)
				{
				stSuff = this.stAM;
				}
			else
				{
				stSuff = this.stPM;
				hrTT -= 12;
				}
			if (hrTT == 0)
				hrTT = 12;
			if (this.TimeMarkPosn == 0)
				st += hrTT + " " + stSuff + "\r";
			else
				st += stSuff + " " + hrTT + "\r";
			}
		else
			{
			if (hrT < 10)
				st += L_SmallHour_Text;
			st += hrTT + L_Time_Text + "\r";
			}
		}
	st += "</SELECT>\r";
	st += "&nbsp;<SELECT TITLE='" + L_Minutes_Text+ "' " + FormTabIndex() + " NAME=" + StAttrQuote(fld.frm.StFieldName(fld, "Minutes")) + ">\r";
	min = WMultiple(min, this.dminControl);
	for (minT = 0; minT < 60; minT += this.dminControl)
		{
		if (minT == min)
			stSelected = " Selected=True";
		else
			stSelected = "";
		st += "<OPTION VALUE=" + minT + stSelected + ">";
		st += St2Digits(minT) + L_MinutesTime_Text + "\r";
		}
	st += "</SELECT></span>\r";
	return st;
}
DateOptions.prototype.SetTimeControls = DOSetTimeControls;
function DOSetTimeControls(fld, date)
{
	var fieldHours = fld.frm.FieldSubPart(fld, "Hours");
	var fieldMinutes = fld.frm.FieldSubPart(fld, "Minutes");
	var hr = date.getUTCHours();
	var min = date.getUTCMinutes();
	var fPM;
	min = WMultiple(min, this.dminControl);
	fieldHours.selectedIndex = hr;
	fieldMinutes.selectedIndex = min/this.dminControl;
}
DateOptions.prototype.Today = DOToday;
function DOToday()
{
	var date = this.Now();
	date.setUTCHours(0,0,0,0);
	return date;
}
DateOptions.prototype.Now = DONow;
function DONow()
{
	var date = new Date();
	date.setTime(date.getTime() - this.webTZOffsetMin * DateOptions.msMinute);
	return date;
}
DateOptions.ClientToday = DOClientToday;
function DOClientToday()
{
	var date = DateOptions.ClientNow();
	date.setUTCHours(0,0,0,0);
	return date;
}
DateOptions.ClientNow = DOClientNow;
function DOClientNow()
{
	var date = new Date();
	date.setTime(date.getTime() - date.getTimezoneOffset() * DateOptions.msMinute);
	return date;
}
DateOptions.ParseISODate = DOParseISODate;
function DOParseISODate(stISO, caltype)
{
	var date = "#INVALID";
	if (stISO.length < 19)
	    return date;
	var yr = stISO.substr(0, 4) - 0;
	var mon = stISO.substr(5, 2) - 0;
	var day = stISO.substr(8, 2) - 0;
	var hr = stISO.substr(11, 2) - 0;
	var min = stISO.substr(14, 2) - 0;
	var sec = stISO.substr(17, 2) - 0;
    if (isNaN(yr) || isNaN(mon) || isNaN(day) || isNaN(hr) || isNaN(min) || isNaN(sec))
		return date;
	if (caltype == "undefined")
		caltype = 0;
	switch (caltype)
	{
	case 6: 
	case 7: 
	case 8: 
	    date = new IntlDate(yr, mon-1, day, hr, min, sec, caltype);
	    break;
	default:
	    date = new Date(Date.UTC(yr, mon-1, day, hr, min, sec));
	    break;
	}
	return date;
}
DateOptions.prototype.RoundDate = DateRoundDate;
function DateRoundDate(date)
{
	date.setSeconds(0);
	return date;
}
DateOptions.StISODate = DOStISODate;
function DOStISODate(date)
{
	var yr = date.getUTCFullYear();
	var mon = date.getUTCMonth() + 1;
	var day = date.getUTCDate();
	var hr = date.getUTCHours();
	var min = date.getUTCMinutes();
	var sec = date.getUTCSeconds();
	return yr + "-" + St2Digits(mon) + "-" + St2Digits(day) + "T" + St2Digits(hr) + ":" +
		St2Digits(min) + ":" + St2Digits(sec) + "Z";
}
DateOptions.msSecond = 1000;
DateOptions.msMinute = DateOptions.msSecond*60;
DateOptions.msHour = DateOptions.msMinute * 60;
DateOptions.msDay = DateOptions.msHour * 24;
DateOptions.msWeek = DateOptions.msDay * 7;
DateOptions.cdyYr = 365;
DateOptions.cdyQYr = 4*DateOptions.cdyYr + 1;
DateOptions.cdyC = 25*DateOptions.cdyQYr - 1;
DateOptions.cdyQC = 4*DateOptions.cdyC + 1;
DateOptions.mpMonIdy = new Array(31, 61, 92, 122, 153, 184, 214, 245, 275, 306, 337);
DateOptions.idyJan1 = 306;
DateOptions.ddayOrigin = 135080;
function DateDecode(date)
{
	this.ms = date.getTime();
	this.msDay = this.ms % DateOptions.msDay;
	if (this.sec < 0)
		this.sec += DateOptions.msDay;
	this.idy = Math.floor(this.ms / DateOptions.msDay) + DateOptions.ddayOrigin;	
	var idyQC = this.idy % DateOptions.cdyQC;			
	var iQC = Math.floor(this.idy / DateOptions.cdyQC);
	var idyC = idyQC % DateOptions.cdyC;			
	var iC = Math.floor(idyQC / DateOptions.cdyC);
	if (iC == 4)
		{
		iC = 3;
		idyC = DateOptions.cdyC;
		}
	var idyQYr = idyC % DateOptions.cdyQYr;			
	var iQYr = Math.floor(idyC / DateOptions.cdyQYr);
	var idyYr = idyQYr % DateOptions.cdyYr;			
	var iYr = Math.floor(idyQYr / DateOptions.cdyYr);
	if (iYr == 4)
		{
		iYr = 3;
		idyYr = DateOptions.cdyYr;
		}
	this.yr = 1600 + iQC * 400 + iC * 100 + iQYr * 4 + iYr;
	if (idyYr >= DateOptions.idyJan1)
		this.yr++;
	var imon;
	for (imon = 0; imon < 11; imon++)
		{
		if (idyYr < DateOptions.mpMonIdy[imon])
			break;
		}
	this.mon = (imon + 2) % 12;
	this.day = idyYr - ((imon > 0) ? DateOptions.mpMonIdy[imon-1] : 0) + 1;
	this.hr = Math.floor(this.msDay/DateOptions.msHour);
	this.min = Math.floor((this.msDay%DateOptions.msHour)/DateOptions.msMinute);
	this.sec = Math.floor((this.msDay%DateOptions.msMinute)/DateOptions.msSecond);
	this.dow = (this.idy+3) % 7;
}
DateDecode.prototype.MsEncode = DDMsEncode;
function DDMsEncode()
{
	this.ms = Date.UTC(this.yr, this.mon, this.day, this.hr, this.min, this.sec);
	return this.ms;
}
DateOptions.fOldDate = typeof(Date.prototype.getUTCHours) == "undefined";
if (DateOptions.fOldDate)
	{
	Date.prototype.getUTCDay = DateGetUTCDay;
	Date.prototype.getUTCDate = DateGetUTCDate;
	Date.prototype.getUTCFullYear = DateGetUTCFullYear;
	Date.prototype.getUTCMonth = DateGetUTCMonth;
	Date.prototype.getUTCHours = DateGetUTCHours;
	Date.prototype.getUTCMinutes = DateGetUTCMinutes;
	Date.prototype.getUTCSeconds = DateGetUTCSeconds;
	Date.prototype.setUTCDate = DateSetUTCDate;
	Date.prototype.setUTCHours = DateSetUTCHours;
	Date.prototype.EnsureDecode = DateEnsureDecode;
	Date.prototype.ResetMs = DateResetMs;
	}
function DateEnsureDecode()
{
	if (this.dd == "undefined" || this.dd.ms != this.getTime())
		this.dd = new DateDecode(this);
}
function DateResetMs()
{
	this.setTime(this.dd.MsEncode());
}
function DateGetUTCDate()
{
	this.EnsureDecode();
	return this.dd.day;
}
function DateGetUTCDay()
{
	this.EnsureDecode();
	return this.dd.dow;
}
function DateGetUTCFullYear()
{
	this.EnsureDecode();
	return this.dd.yr;
}
function DateGetUTCMonth()
{
	this.EnsureDecode();
	return this.dd.mon;
}
function DateGetUTCHours()
{
	this.EnsureDecode();
	return this.dd.hr;
}
function DateGetUTCMinutes()
{
	this.EnsureDecode();
	return this.dd.min;
}
function DateGetUTCSeconds()
{
	this.EnsureDecode();
	return this.dd.sec;
}
function DateSetUTCDate(day)
{
	this.EnsureDecode();
	this.dd.day = day;
	this.ResetMs();
}
function DateSetUTCHours(hr, min, sec)
{
	this.EnsureDecode();
	if (!min) min = 0;
	if (!sec) sec = 0;
	this.dd.hr = hr;
	this.dd.min = min;
	this.dd.sec = sec;
	this.ResetMs();
}
DateDecode.prototype.toString = StDateDecode;
function StDateDecode()
{
	return "Date Object\rYear: " + this.yr +
		"\rMon: " + (this.mon+1) +
		"\rDay: " + this.day +
		"\rhr: " + this.hr +
		"\rmin: " + this.min +
		"\rsec: " + this.sec;
}
function DatePicker(frm)
{
	this.frm = frm;
	if (frm.fUseDHTML)
		{
		document.write('<IFRAME FRAMEBORDER=0 SRC="' + frm.stPagePath + 'iframe.htm" SCROLLING=no style="position:absolute;display:none;background:white;" ID=DatePickerWind></IFRAME>');
		this.wnd = DatePickerWind;
		document.body.onclick=DPCancelHandler;
		this.ifrm = document.getElementById("DatePickerWind");
		}
}
function DPCancelHandler()
{
	frmCurrent.dp.Cancel();
}
var L_DatePickerAlt_Text = "\u8bf7\u4ece\u65e5\u5386\u4e2d\u9009\u62e9\u65e5\u671f";
DatePicker.prototype.StButton = DPStButton;
function DPStButton(fld, stPopUpOnClick2)
{
	var st = "";
	if (this.frm.fUseDHTML)
		{
		st += "<IMG ALT=\"" + L_DatePickerAlt_Text + "\" CLASS=ms-button " +
			"ONCLICK='{var elt = event.srcElement; "+stPopUpOnClick2+"; if (!elt.disabled) frm.FindField(" + STSScriptEncodeWithQuote(fld.stName) + ").PopDatePicker(elt);}'" +
			"SRC=" + StAttrQuote(this.frm.stImagesPath + "calendar.gif") + ">";
		}
	return st;
}
DatePicker.prototype.Popup = DPPopup;
function DPPopup(date, field, elt)
{
	if (this.elt != null && this.elt == elt)
		{
		this.Cancel();
		return;
		}
	this.Cancel();
	this.bRTLAlign = false;
	this.date = new Date(date.getTime());
	this.date.setUTCHours(0,0,0,0);
	this.field = field;
	this.elt = elt;
	var pos = WindowPosition(elt);
	this.ifrm.style.pixelLeft = pos.x + 1;
	this.ifrm.style.pixelTop = pos.y + elt.offsetHeight;
	this.SetHTML(this.StBuild());
}
DatePicker.prototype.AdjustFrameSize = DPAdjustFrameSize;
function DPAdjustFrameSize()
{
	this.ifrm.style.display = "block";
	var divDP = this.wnd.document.getElementById("DatePickerDiv");
	if (!this.bDidAlign)
	{
		this.bDidAlign = true;
		this.ifrm.style.pixelWidth = divDP.offsetWidth - 100;
	}
	this.ifrm.style.pixelWidth = divDP.offsetWidth;
	this.ifrm.style.pixelHeight = divDP.offsetHeight;
	if (this.ifrm.currentStyle.direction == "rtl" && !this.bRTLAlign)
	{
		this.bRTLAlign = true;
		this.ifrm.style.pixelLeft -= this.ifrm.style.pixelWidth - event.srcElement.offsetWidth + 1;
	}
}
DatePicker.prototype.StBuild = DPStBuild;
function DPStBuild()
{
	var st = "";
	this.cal = new Calendar(this.date.getUTCFullYear(), this.date.getUTCMonth(), this.frm.dopt, "parent.frm.dp");
	this.cal.fDatePicker = true;
	this.cal.dateDP = this.date;
	st += this.cal.StBuild();
	return st;
}
DatePicker.prototype.SetHTML = DPSetHTML;
function DPSetHTML(stHTML)
{
	var cssLink = this.wnd.document.getElementById("onetidThemeCSS");
	if (cssLink && this.frm.themeCSSurl)
		cssLink.href = this.frm.themeCSSurl;
	this.wnd.document.body.innerHTML = "<DIV ID=DatePickerDiv>" + stHTML + "</DIV>";
	this.wnd.document.selection.empty();
	this.AdjustFrameSize();
}
DatePicker.prototype.ClickDay = DPClickDay;
function DPClickDay(yr, mon, day)
{
	var date = new Date(Date.UTC(yr, mon, day));
	this.field.value = this.frm.dopt.StDate(date);
	this.Cancel();
}
DatePicker.prototype.MoveMonth = DPMoveMonth;
function DPMoveMonth(dmon)
{
	this.cal.SetDate(this.cal.yr, this.cal.mon + dmon, 1);
	this.SetHTML(this.cal.StBuild());
}
DatePicker.prototype.Cancel = DPCancel;
function DPCancel()
{
	if (this.elt != null)
		{
		this.ifrm.style.display = "none";
		this.elt = null;
		}
}
DatePicker.prototype.SetDate = DPSetDate;
function DPSetDate(yr, mon, day)
{
	this.cal.SetDate(yr, mon, day);
	this.SetHTML(this.cal.StBuild());
}
function FrmOnSubmitRetFalse()
{
   return false;
}
var frmCurrent;
function OWSForm(stName, fUseDHTMLOverride, stPagePath)
{
	this.stName = stName;
	this.stFieldPrefix = "urn:schemas-microsoft-com:office:office#";
	this.dopt = new DateOptions;
	this.nopt = new NumberOptions;
	this.fUseDHTML = browseris.ie4up && browseris.win32;
	if (!fUseDHTMLOverride)
			this.fUseDHTML = false;
	this.ifldMax = 0;
	this.rgfld = new Array;
	this.stError = "";
	this.stImagesPath = "";
	this.stPagePath = stPagePath + L_Language_Text+"/";
	this.dp = new DatePicker(this);
	this.stInputStyle = ((browseris.ie4up && browseris.win32) || browseris.nav6up) ? "CLASS=ms-input" : "";
	this.stLongStyle = ((browseris.ie4up && browseris.win32) || browseris.nav6up) ? "CLASS=ms-long" : "";
	this.fPreviewMode = false;
	if (document[this.stName])
		document[this.stName].onsubmit = FrmOnSubmitRetFalse; 
	this.form = null;
	this.themeCSSurl = retrieveCurrentThemeLink();
	frmCurrent = this;
}
OWSForm.prototype.AddField = FrmAddField;
function FrmAddField(fld, stName, stDisplay, stValue)
{
	this.rgfld[this.ifldMax++] = fld;
	fld.frm = this;
	fld.stName = stName;
	fld.stDisplay = stDisplay;
	fld.stValue = stValue;
	fld.fRequired = false;
	fld.stError = "";
	fld.stAttributes = "";
	fld.fCalcCheck = false;
}
OWSForm.prototype.DataBind = FrmDataBind;
function FrmDataBind()
{
	var ifld;
	var fld;
    if (this.form == null)
	    this.form = document[this.stName]
	for (ifld = 0; ifld < this.ifldMax; ifld++)
		{
		fld = this.rgfld[ifld];
		fld.DataBind();
		}
}
OWSForm.prototype.FindField = FrmFindField;
function FrmFindField(stField)
{
	var fld;
	for (ifld = 0; ifld < this.ifldMax; ifld++)
		{
		fld = this.rgfld[ifld];
		if (fld.stName == stField)
			return fld;
		}
	return null;
}
OWSForm.prototype.ValidateAndSubmit = FrmValidateAndSubmit;
function FrmValidateAndSubmit(fUI)
{
	if (this.fPreviewMode)
	{
		var L_cantSave_Text = "\u5728\u9884\u89c8\u6b64\u7f51\u9875\u65f6\u65e0\u6cd5\u4fdd\u5b58\u6b64\u8868\u5355\u3002";
		window.alert(L_cantSave_Text);
		return;
	}
	if (this.FValidate(fUI)){
		this.FPostProcess();
		this.form.submit();
	}
}
OWSForm.prototype.FValidate = FValidateForm;
function FValidateForm(fUI)
{
	var ifld;
	var fld;
	var bFormValid = true;
    if (this.form == null)
	    this.form = document[this.stName]
	for (ifld = 0; ifld < this.ifldMax; ifld++)
		{
		fld = this.rgfld[ifld];
		if (!fld.fSkipValidation && !fld.FValidate())
			{
			if (fld.errFld)
				fld = fld.errFld;
			if (bFormValid)
				{
				this.stError = fld.stError;
				bFormValid = false;
				}
			if (fUI)
				{
				fld.FieldFocus();
				alert(this.stError);
				return false;
				}
			}
		}
	return bFormValid;
}
OWSForm.prototype.FPostProcess = FPostProcessForm;
function FPostProcessForm()
{
	var ifld;
	var fld;
	this.form = document[this.stName]
	for (ifld = 0; ifld < this.ifldMax; ifld++)
		{
		fld = this.rgfld[ifld];
		if (fld.PostProcess)
			fld.PostProcess();
		}
	return true;
}
OWSForm.prototype.SetFirstFocus = FrmSetFirstFocus;
function FrmSetFirstFocus(bAlreadyInitialized)
{
	var i;
	if (bAlreadyInitialized != true)
		this.InitFormFields();
	for (i in this.rgfld)
		if (this.rgfld[i].FieldFocus && this.rgfld[i].FieldFocus())
			break;
}
OWSForm.prototype.InitFormFields = FrmInitFields;
function FrmInitFields()
{
	var i;
	window.focus();
	this.form = document[this.stName];
	for (i in this.rgfld)
	{
		if (this.rgfld[i].Init)
			this.rgfld[i].Init();
	}
}
OWSForm.prototype.BuildFieldUI = FrmBuildFieldUI;
function FrmBuildFieldUI(fld, st)
{
	document.write(st);
}
OWSForm.prototype.StFieldPost = FrmStFieldPost;
function FrmStFieldPost(fld)
{
	if (!fld.posted)
	{
		fld.posted=true;
		return "<INPUT TYPE=HIDDEN NAME=" + StAttrQuote(this.stFieldPrefix + fld.stName) + ">\r";
	}
	else
		return "";
}
OWSForm.prototype.FieldPost = FrmFieldPost;
function FrmFieldPost(fld)
{
    if (this.form == null)
		this.form = document[this.stName];
	return this.form[this.stFieldPrefix + fld.stName];
}
OWSForm.prototype.FilenameFieldPost = FilenameFrmFieldPost;
function FilenameFrmFieldPost(fld)
{
    if (this.form == null)
		this.form = document[this.stName];
	return this.form[fld.stName];
}
OWSForm.prototype.StFieldSubPart = FrmStFieldSubPart;
function FrmStFieldSubPart(fld, stPart, stValue)
{
	var maxLen = "MaxLength=255 ";
	var stDir;
	switch(fld.direction)
	{
	case 1:
		stDir = " dir=ltr";
		break;
	case 2:
		stDir = " dir=rtl";
		break;
	default:
		stDir = "";
		break;		
	}	
	var strIMEMode = fld.IMEMode ? " style=\"ime-mode:" + fld.IMEMode + "\" " : "";
	return "<INPUT " + FormTabIndex() + " " + maxLen + fld.stAttributes + 
        " TITLE=" + StAttrQuote(fld.stDisplay) +
	    " NAME=" + StAttrQuote(this.StFieldName(fld, stPart)) +
	    " id='" + "id" + fld.stName + "'" +
	    strIMEMode + 	    
		" VALUE=" + StAttrQuote(stValue) + stDir + ">";
}
OWSForm.prototype.FieldSubPart = FrmFieldSubPart;
function FrmFieldSubPart(fld, stPart)
{
    if (this.form == null)
		this.form = document[this.stName];
	return this.form[this.StFieldName(fld, stPart)];
}
OWSForm.prototype.StFieldName = FrmStFieldName;
function FrmStFieldName(fld, stPart)
{
	return this.StFieldNameFactory(fld.stName, stPart);
}
OWSForm.prototype.StFieldNameFactory = FrmStFieldNameFactory;
function FrmStFieldNameFactory(name, stPart)
{
	return "OWS:" + name + ":" + stPart;
}
OWSForm.prototype.GetSelValue = FrmGetSelValue;
function FrmGetSelValue(st)
{
    if (this.form == null)
		this.form = document[this.stName];
	var sel = this.form[st];
	return sel[sel.selectedIndex].value;
}
OWSForm.prototype.TestURL = FormTestURL;
function FormTestURL(stName)
{
	var fld = this.FindField(stName);
	var stURL = StURLNormalize(TrimWhiteSpaces(this.FieldSubPart(fld, "URL").value));
	if (stURL.substr(0, 7) == "mailto:")
		open(stURL, "_self");
	else
		open(stURL, "_blank");
}
OWSForm.prototype.SetRadioValue = FormSetRadioValue;
function FormSetRadioValue(stName, stValue)
{
	var fld = this.FindField(stName);
	if (fld.stAlias)
		fld = this.FindField(fld.stAlias);
	fld.SetValue(stValue);
	return true;
}
OWSForm.prototype.RevertSelect = FormRevertSelect;
function FormRevertSelect(stName, stValue)
{
	var fld = this.FindField(stName);
	fld.RevertSelect(stValue);
}
OWSForm.prototype.SetFillInButton = FormSetFillInButton;
function FormSetFillInButton(stName)
{
    if (event != null)
    {
        var charCode;
        if (browseris.ie)
            charCode = event.keyCode;
        else
            charCode = event.which;
        if (charCode == 9 || charCode == 16)
            return;
    }
	var fld = this.FindField(stName);
    fld.SetFillInButton();
}
OWSForm.prototype.UnsetFillInButton = FormUnsetFillInButton;
function FormUnsetFillInButton(stName)
{
	var fld = this.FindField(stName);
	fld.UnsetFillInButton();
}
function NumberOptions()
{
	this.chDigSep = ",";
	this.chDecimal = ".";
	this.chMinus = "-";
	this.iNegNumber = 1; 
	this.rgcchSep = new Array(3, 0);
}
NumberOptions.prototype.SetGrouping = NoptSetGrouping;
function NoptSetGrouping(stGrouping)
{
	this.rgcchSep = stGrouping.split(";");
}
NumberOptions.prototype.NumParse = NoptNumParse;
function NoptNumParse(st)
{
	var fNeg = false;
	st = st.toUpperCase();
	var re = new RegExp("\\" + this.chDigSep, "g");
	st = st.replace(re, "");
	re = new RegExp("\\" + this.chDecimal, "g");
	st = st.replace(re, ".");
    if ((st.search(/\(/) != -1 && st.search(/\)/) != -1))
    {
        fNeg = true;
        st = st.replace(/\(/, "").replace(/\)/, "");
    }
    var ix = 0;
    var sawE = false;
    var stClean = "";
    for (ix = 0; ix < st.length; ix++)
    {
        var oneChar = st.charAt(ix);
        if (oneChar == "E")
        {
            sawE = true;
        }
        if (!sawE && oneChar == this.chMinus)
        {
            fNeg = true;
        }
        else
        {
            stClean += oneChar;
        }
    }
	var num = stClean - 0;
    if (num > 1.79E+308)
		return Number.NaN;
    if (num != 0 && num < 2.23E-308)
        num = 0;
	if (fNeg)
		num = -num;
	return num;
}
NumberOptions.prototype.StNumber = NoptStNumber;
function NoptStNumber(numOrig)
{
	var fNeg;
	var ichDigit;
	if (numOrig == "")
		return "";
	var num = numOrig - 0;
	fNeg = num < 0;
	if (fNeg)
		num = -num;
	var stNum = num.toString();
    stNum = stNum.toUpperCase();
	if (isNaN(num))
		{
		return numOrig;
		}
	stNum = stNum.replace(/\./, this.chDecimal);
	var ichDecimal = stNum.indexOf(this.chDecimal);
	if (this.rgcchSep[0] != 0 && (stNum.indexOf("E") == -1))
		{
		if (ichDecimal != -1)
			ichDigit = ichDecimal - 1;
		else
			ichDigit = stNum.length - 1;
		var icch = 0;
		while (icch < this.rgcchSep.length && ichDigit >= this.rgcchSep[icch])
			{
			stNum = StInsertAt(stNum, ichDigit-this.rgcchSep[icch]+1, this.chDigSep);
			ichDigit -= this.rgcchSep[icch];
			icch++;
			if (icch < this.rgcchSep.length && this.rgcchSep[icch] == 0)
				icch--;
			}
		}
	if (fNeg)
		{
		switch (this.iNegNumber)
			{
		case 0:
			stNum = "(" + stNum + ")";
			break;
		case 1:
			stNum = this.chMinus + stNum;
			break;
		case 2:
			stNum = this.chMinus + " " + stNum;
			break;
		case 3:
			stNum = stNum + this.chMinus;
			break;
		case 4:
			stNum = stNum + " " + this.chMinus;
			break;
			}
		}
	return stNum;
}
function DateField(frm, stName, stDisplay, stValue)
{
	frm.AddField(this, stName, stDisplay, stValue);
	this.fDateOnly = false;
	this.stAttributes = frm.stInputStyle + " SIZE=12";
	this.caltype = 1;
	this.direction = 0;
	this.stPopUpOnClick2 = "";
	this.origDate = null;
}
var L_DateOrderYear_Text = "\u5e74";
var L_DateOrderMonth_Text = "\u6708";
var L_DateOrderDay_Text = "\u65e5";
var L_DateOrderDesc_Text = "\u8bf7\u6309 ^2 \u683c\u5f0f\u8f93\u5165\u65e5\u671f ^1\u3002";
var L_CalendarHijri_Text = " \u4f7f\u7528\u56de\u5386";
var L_CalendarHebrew_Text = " \u4f7f\u7528\u5e0c\u4f2f\u6765\u519c\u5386";
var L_CalendarThai_Text = " \u4f7f\u7528\u6cf0\u56fd\u4f5b\u5386";
var L_CalendarSaka_Text = " \u4f7f\u7528\u8428\u5361\u65f6\u4ee3\u65e5\u5386";
DateField.prototype.BuildUI = DateBuildUI;
function DateBuildUI()
{
	var st = this.stBuildUI();
	this.frm.BuildFieldUI(this, st + "\r");
}
DateField.prototype.stBuildUI = stDateBuildUI;
function stDateBuildUI()
{
	var st = "";
	var date;
	st += this.frm.StFieldPost(this);
	if (!this.fHideDateSpan)
		st += "<span ID="+StAttrQuote(this.frm.StFieldName(fld, "DateSpan"))+">";
	if (FBlankString(this.stValue))
		{
		st += this.frm.StFieldSubPart(this, "Date", "");
		date = this.frm.dopt.Today();
		}
	else
		{
		date = DateOptions.ParseISODate(this.stValue, this.caltype);
		if (date == "#INVALID")
			{
			date = this.frm.dopt.Today();
			st += this.frm.StFieldSubPart(this, "Date", date);
			}
		else
		    {
		        date = this.frm.dopt.RoundDate(date);
        		st += this.frm.StFieldSubPart(this, "Date", this.frm.dopt.StDate(date));
		    }
		}
	this.origDate = date;
	st += "&nbsp;";
	if(this.caltype == 1)
		st += this.frm.dp.StButton(this, this.stPopUpOnClick2);
	st += "&nbsp;&nbsp;"
	if (!this.fHideDateSpan)
		st += "</span>";
	if (!this.fDateOnly)
		{
		st += this.frm.dopt.StTimeControls(this, date);
		}
	st += "<IMG alt='' style='vertical-align: bottom' width=1pt height=26pt SRC="
		+ StAttrQuote(this.frm.stImagesPath + "blank.gif") + ">";
	var stCalenarString="";
	var stDateString="";	
	switch (this.caltype)
	{
	case 6:  
		stCalenarString = L_CalendarHijri_Text;
		break;
	case 7:  
		stCalenarString = L_CalendarThai_Text;
		break;
	case 8:  
		stCalenarString = L_CalendarHebrew_Text;
		break;
	case 16:  
		stCalenarString = L_CalendarSaka_Text;
		break;
	default:
		stCalenarString="";
	}
	stDateString = this.frm.dopt.StDateString(L_DateOrderYear_Text,
		L_DateOrderMonth_Text, L_DateOrderDay_Text);	
	if (!this.fHideDescription)
		{
		st += "&nbsp;<br><SPAN class=ms-formdescription ID="
		   + StAttrQuote(this.frm.StFieldName(fld, "DateSpan"))+ ">"
		   + StBuildParam(L_DateOrderDesc_Text, stCalenarString, stDateString)
		   + "</SPAN>";
		}
	return st;
}
DateField.prototype.PopDatePicker = DatePopDatePicker;
function DatePopDatePicker(elt)
{
	this.frm.form = document[this.frm.stName]
	var date;
	var field = this.frm.FieldPost(this);
	var fieldDate = this.frm.FieldSubPart(this, "Date");
	event.cancelBubble = true;
	date = this.frm.dopt.Today();
	if (this.FValidate() && this.date != null)
		date = this.date;
	this.frm.dp.Popup(date, fieldDate, elt);
	return true;	
}
DateField.prototype.DataBind = DateDataBind;
function DateDataBind()
{
	var date;
	var fieldData = this.frm.FieldPost(this);
	var fieldDate = this.frm.FieldSubPart(this, "Date");
	if (FBlankString(fieldData.value))
		{
		fieldDate.value = "";
		date = this.frm.dopt.Today();
		}
	else
		{
		date = DateOptions.ParseISODate(fieldData.value);
		date = this.frm.dopt.RoundDate(date);
		fieldDate.value = this.frm.dopt.StDate(date);
		}
	if (!this.fDateOnly)
		{
		this.frm.dopt.SetTimeControls(this, date);
		}
}
DateField.prototype.FieldFocus = DateFieldFocus;
function DateFieldFocus()
{
	var field = this.frm.FieldSubPart(this, "Date");
	if (!field.disabled)
	{
		field.focus();
		field.select();
		return true;
	}
	return false;
}
var L_DateRequired_Text = "\u5fc5\u987b\u4e3a ^1 \u6307\u5b9a\u65e5\u671f\u3002";
var L_InvalidDate_Text = "^1 \u4e0d\u662f\u6709\u6548\u65e5\u671f\u3002";
DateField.prototype.FValidate = DateFValidate;
function DateFValidate()
{
	var field = this.frm.FieldPost(this);
	var formfld = this.frm.FieldSubPart(this, "Date");
	if (!formfld.disabled)
		{
		var stDate = TrimWhiteSpaces(formfld.value);
		if (stDate == "")
			{
			if (this.fRequired)
				{
				this.stError = StBuildParam(L_DateRequired_Text, this.stDisplay);
				return false;
				}
			else
				{
				field.value = "";
				this.date = null;
				return true;
				}
			}
		var date = this.frm.dopt.ParseLocaleDate(stDate, this.caltype);
		if (isNaN(date))
			{
			this.stError = StBuildParam(L_InvalidDate_Text, this.stDisplay);
			return false;
			}
		var yrMin = 1900;	
		var yrMax = 8900;   
		switch (this.caltype)
		{
		case 6:  
			yrMin = 1319;
			yrMax = 3481;
			break;
		case 7:  
			yrMin = 2444;
			yrMax = 5043;
			break;
		case 8:  
			yrMin = 5662;
			yrMax = 5998;
			break;
		case 16:  
			yrMin = 1823;
			yrMax = 3920;
			break;
		}
		if (!this.fDateOnly)
			{
			var hr = this.frm.GetSelValue(this.frm.StFieldName(this, "Hours")) - 0;
			var min = this.frm.GetSelValue(this.frm.StFieldName(this, "Minutes"));
			date.setUTCHours(hr, min);
			}
		var yr = date.getUTCFullYear();
		var mon = date.getUTCMonth();
		var day = date.getUTCDate();
		var minCalGregorian = (this.origDate == null
							  || date.getTime() >= this.origDate.getTime())
							  && this.caltype == 1 && yr == 1899 && mon == 11 && day == 31;
		if ((yr < yrMin || yr > yrMax) && !minCalGregorian)
			{
			this.stError = StBuildParam(L_InvalidDate_Text, this.stDisplay);
			return false;
			}
		field.value = DateOptions.StISODate(date);
		this.date = date;
		}
	return true;
}
function URLField(frm, stName, stDisplay, stURL, stDesc)
{
	if (FBlankString(stURL))
	{
		stURL = "http://";
	}
	frm.AddField(this, stName, stDisplay, stURL);
	this.stDesc = stDesc;
	this.stAttributes = frm.stLongStyle;
}
var L_URLHeading_Text = "\u8bf7\u952e\u5165\u7f51\u7ad9\u5730\u5740:";
var L_URLTest_Text = "\u5355\u51fb\u6b64\u5904\u8fdb\u884c\u6d4b\u8bd5";
var L_URLHeadingDesc_Text = "\u8bf7\u952e\u5165\u8bf4\u660e:";
var L_URLDescriptionTooltip_Text = "\u8bf4\u660e";
URLField.prototype.BuildUI = URLBuildUI;
function URLBuildUI()
{
	var st = "";
	st += this.frm.StFieldPost(this);
	st += "<SPAN CLASS=ms-formdescription>" + L_URLHeading_Text + " (";
    st += "<A " + FormTabIndex() + " HREF='javascript:frm.TestURL(" + STSScriptEncodeWithQuote(this.stName) + ")' target=_self>" + L_URLTest_Text + "</A>)&nbsp;<br></span>\r";
    st += "<SPAN dir=ltr>"; 
	st += this.frm.StFieldSubPart(this, "URL", this.stValue);
	st += "</SPAN>";
	st += "&nbsp;<br>\r<SPAN CLASS=ms-formdescription>" + L_URLHeadingDesc_Text + "<br></SPAN>\r";
	var stOldDisplay = this.stDisplay;
	this.stDisplay = L_URLDescriptionTooltip_Text;
	st += this.frm.StFieldSubPart(this, "Desc", this.stDesc);
	this.stDisplay = stOldDisplay;
	this.frm.BuildFieldUI(this, st);
}
URLField.prototype.DataBind = URLDataBind;
function URLDataBind()
{
	var fieldData = this.frm.FieldPost(this);
	var fieldURL = this.frm.FieldSubPart(this, "URL");
	var fieldDesc = this.frm.FieldSubPart(this, "Desc");
	var st = fieldData.value;
	var stURL, stDesc;
	var ich = st.indexOf(", ");
	if (ich == -1)
	{
		ich = st.lastIndexOf(",");
		if (ich == st.length - 1)
		{
			st += " ";
		}
	}
	if (ich == -1)
	{
		stURL = st;
		stDesc = st;
	}
	else
	{
		stURL = st.substr(0, ich);
		stDesc = st.substr(ich+2);
	}
	stURL = stURL.replace(/\,\,/, ",");
	if (FBlankString(stDesc))
	{
		stDesc = stURL;
	}
	if (FBlankString(stURL))
	{
		stURL = "http://";
	}
	fieldURL.value = stURL;
	fieldDesc.value = stDesc;
}
URLField.prototype.FieldFocus = URLFieldFocus;
function URLFieldFocus()
{
	var field = this.frm.FieldSubPart(this, "URL");
	if (!field.disabled)
	{
		field.focus();
		field.select();
		return true;
	}
	return false;
}
URLField.prototype.FValidate = URLValidate;
function URLValidate()
{
	var stPost;
	var fieldPost = this.frm.FieldPost(this);
	var stURL = TrimWhiteSpaces(this.frm.FieldSubPart(this, "URL").value);
	var stDesc = TrimWhiteSpaces(this.frm.FieldSubPart(this, "Desc").value);
	if (stURL == "http://")
	{
		stURL = "";
	}
	if (this.fRequired && FBlankString(stURL))
	{
		this.stError = StBuildParam(L_FieldRequired_Text, this.stDisplay);
		return false;
	}
	stURL = StURLNormalize(stURL);
	var L_InvalidUrlValue_Text = "\u5728\u8d85\u94fe\u63a5\u7684 Web \u5730\u5740\u4e2d\uff0c\u4e0d\u80fd\u5728\u5206\u53f7(;)\u540e\u7d27\u8ddf\u7740\u952e\u5165\u6570\u5b57\u8bb0\u53f7(#)\u3002";
	if (-1 != stURL.indexOf(";#") || -1 != stDesc.indexOf(";#"))
	{
		this.stError = L_InvalidUrlValue_Text;
		return false;
	}
	stPost = stURL.replace(/,/g, ",,") + ", " + stDesc;
	fieldPost.value = stPost;
	return true;
}
function StURLNormalize(stURL)
{
	if (stURL.substr(0,2) == "\\\\" || stURL.substr(0,2) == "\/\/" )
		stURL = "file:" + stURL;
	if (stURL.substr(0,5) == "file:")
		stURL = stURL.replace(/\\/g, "\/");
	return stURL;
}
function NumberField(frm, stName, stDisplay, stValue)
{
	frm.AddField(this, stName, stDisplay, stValue);
	this.fPercent = false;
	this.cchDisplaySize = "";
}
NumberField.prototype.BuildUI = NumberBuildUI;
function NumberBuildUI()
{
	var st = this.stBuildUI();
	this.frm.BuildFieldUI(this, st);
}
function StDivideByOneHundred(stNum)
{
    if (stNum == "")
        return stNum;
    var ix;
    ix = stNum.indexOf("E");
    if (ix == -1)
        ix = stNum.indexOf("e");
    var stExponentPart;
    if (ix == -1)
        stExponentPart = "";
    else
    {
        stExponentPart = stNum.slice(ix);
        stNum = stNum.substr(0, ix);
    }
    var stSignPart;
    if (stNum.charAt(0) == "-")
    {
        stSignPart = "-";
        stNum = stNum.slice(1);
    }
    else
        stSignPart = "";
    ix = stNum.indexOf(".");
    if (ix == -1)
    {
        ix = stNum.length;
        stNum += ".";
    }
    stNum = stNum.substr(0, ix) + stNum.slice(ix + 1);
    ix -= 2;
    if (ix == -1)
    {
        stNum = ("0" + stNum);
        ix = 0;
    }
    stNum = StInsertAt(stNum, ix, ".");
    stNum = stSignPart + stNum + stExponentPart;
    return stNum;    
}
function StMultiplyByOneHundred(stNum)
{
    if (stNum == "")
        return stNum;
    var ix;
    ix = stNum.indexOf("E");
    if (ix == -1)
        ix = stNum.indexOf("e");
    var stExponentPart;
    if (ix == -1)
        stExponentPart = "";
    else
    {
        stExponentPart = stNum.slice(ix);
        stNum = stNum.substr(0, ix);
    }
    ix = stNum.indexOf(".");
    if (ix == -1)
    {
        stNum += "00";
    }
    else
    {
        stNum = stNum.substr(0, ix) + stNum.slice(ix + 1);
        ix += 2;
        while (ix >= stNum.length + 1)
            stNum += "0";
        stNum = StInsertAt(stNum, ix, ".");
    }
    stNum = stNum + stExponentPart;
    return stNum;
}
NumberField.prototype.stBuildUI = stNumberBuildUI;
function stNumberBuildUI()
{
    var nmb=this.stValue - 0;
	if (this.fPercent && !isNaN(nmb))
	{
		if (this.stValue != 0)
        {
			this.stValue = StMultiplyByOneHundred(this.stValue);
        }
		if (this.wMin != 0)
			this.wMin = StMultiplyByOneHundred(this.wMin.toString());
		if (this.wMax != 0)
			this.wMax = StMultiplyByOneHundred(this.wMax.toString());
	}
	var cchSize;
	if (this.cchDisplaySize != "")
		cchSize = this.cchDisplaySize - 0;
	else
		cchSize = 11;   
	this.stAttributes = this.frm.stInputStyle + " SIZE=" + cchSize ;
	var st = "";
	st += this.frm.StFieldPost(this);
	st += this.frm.StFieldSubPart(this, "Local", this.frm.nopt.StNumber(this.stValue));
	if (this.fPercent && !this.fCalcCheck)
	    st += "&nbsp;%";
	return st;
}
NumberField.prototype.DataBind = NumberDataBind;
function NumberDataBind()
{
	var fieldData = this.frm.FieldPost(this);
	var fieldControl = this.frm.FieldSubPart(this, "Local");
	if (this.fPercent)
	    fieldData.value = StMultiplyByOneHundred(fieldData.value.toString());
	fieldControl.value = this.frm.nopt.StNumber(fieldData.value);
}
NumberField.prototype.FieldFocus = NumberFieldFocus;
function NumberFieldFocus()
{
	var field = this.frm.FieldSubPart(this, "Local");
	if (!field.disabled)
	{
		field.focus();
		field.select();
		return true;
	}
	return false;
}
var L_ValueRequired_Text = "\u5fc5\u987b\u4e3a ^1 \u6307\u5b9a\u503c\u3002";
var L_InvalidNumber_Text = "^1 \u4e0d\u662f\u6709\u6548\u6570\u5b57\u3002";
var L_InvalidRange_Text = "^1 \u5fc5\u987b\u4ecb\u4e8e ^2 \u548c ^3 \u4e4b\u95f4\u3002";
var L_InvalidMin_Text = "^1 \u5fc5\u987b\u5927\u4e8e\u6216\u7b49\u4e8e ^2\u3002";
var L_InvalidMax_Text = "^1 \u5fc5\u987b\u5c0f\u4e8e\u6216\u7b49\u4e8e ^2\u3002";
var L_InvalidInteger_Text = "^1 \u5fc5\u987b\u662f\u6574\u6570\u3002";
NumberField.prototype.FValidate = NumberFValidate;
function NumberFValidate()
{
	var field = this.frm.FieldPost(this);
	var stNum = this.frm.FieldSubPart(this, "Local").value;
	if (FBlankString(stNum))
		{
		if (this.fRequired)
			{
			this.stError = StBuildParam(L_ValueRequired_Text, this.stDisplay);
			return false;
			}
		field.value = "";
		return true;
		}
	 if (this.fCalcCheck)
		 {
		field.value = stNum;
		return true;
		}
	wValue = this.frm.nopt.NumParse(stNum);
	if (isNaN(wValue))
		{
		this.stError = StBuildParam(L_InvalidNumber_Text, this.stDisplay);
		return false;
		}
	if (FNumber(this.wMin) && FNumber(this.wMax) &&
		(wValue < this.wMin || wValue > this.wMax))
		{
		this.stError = StBuildParam(L_InvalidRange_Text, this.stDisplay, this.frm.nopt.StNumber(this.wMin), this.frm.nopt.StNumber(this.wMax));
		return false;
		}
	if (FNumber(this.wMin) && wValue < this.wMin)
		{
		this.stError = StBuildParam(L_InvalidMin_Text, this.stDisplay, this.frm.nopt.StNumber(this.wMin));
		return false;
		}
	if (FNumber(this.wMax) && wValue > this.wMax)
		{
		this.stError = StBuildParam(L_InvalidMax_Text, this.stDisplay, this.frm.nopt.StNumber(this.wMax));
		return false;
		}
	if (this.fInteger && wValue && (Math.floor(wValue) != wValue))
		{
		this.stError = StBuildParam(L_InvalidInteger_Text, this.stDisplay);
		return false;
		}
	if (this.fPercent)
		field.value = StDivideByOneHundred(wValue.toString());
	else
		field.value = wValue;
	return true;
}
function FNumber(w)
{
	return (w != "" && w != null && !isNaN(w));
}
function BooleanField(frm, stName, stDisplay, stValue)
{
	frm.AddField(this, stName, stDisplay, stValue);
}
BooleanField.prototype.BuildUI = BooleanBuildUI;
function BooleanBuildUI()
{
	var st = "";
	st += this.frm.StFieldPost(this);
	st += "<INPUT " + FormTabIndex() + " TYPE=CHECKBOX " + this.stAttributes + 
	    " TITLE=" + StAttrQuote(this.stDisplay) +
	    " NAME=" + StAttrQuote(this.frm.StFieldName(fld, "Checkbox"));
	if (this.stValue != 0)
		st += " CHECKED";
	st += ">\r";
	this.frm.BuildFieldUI(this, st);
}
BooleanField.prototype.DataBind = BooleanDataBind;
function BooleanDataBind()
{
	var fieldData = this.frm.FieldPost(this);
	var fieldControl = this.frm.FieldSubPart(this, "Checkbox");
	fieldControl.checked = (fieldData.value != 0);
}
BooleanField.prototype.FieldFocus = BooleanFieldFocus;
function BooleanFieldFocus()
{
	var field = this.frm.FieldSubPart(this, "Checkbox");
	if (!field.disabled)
	{
		field.focus();
		return true;
	}
	return false;
}
BooleanField.prototype.FValidate = BooleanFValidate;
function BooleanFValidate()
{
	var field = this.frm.FieldPost(this);
	var fieldCheckbox = this.frm.FieldSubPart(this, "Checkbox");
	if (fieldCheckbox.checked)
		field.value = 1;
	else
		field.value = 0;
	return true;
}
function Field(frm, stName, stDisplay)
{
	frm.AddField(this, stName, stDisplay, "");
}
Field.prototype.FieldFocus = FieldFieldFocus;
function FieldFieldFocus()
{
	var field = this.frm.FieldPost(this);
	if (!field.disabled)
	{
		field.focus();
		return true;
	}
	return false;
}
Field.prototype.DataBind = FieldDataBind;
function FieldDataBind()
{
}
var L_FieldRequired_Text = "^1 \u4e0d\u80fd\u4e3a\u7a7a\u3002";
Field.prototype.FValidate = FieldFValidate;
function FieldFValidate()
{
	var field = this.frm.FieldPost(this);
	if (this.fRequired && FBlankString(field.value))
		{
		this.stError = StBuildParam(L_FieldRequired_Text, this.stDisplay);
		return false;
		}
	if (this.frm.wBaseType == 1 && field.value && field.value.length > 255)
			{
			this.stError = StBuildParam(L_TextFieldMax_Text, this.stDisplay, 255);
			return false;
			}
	return true;
}
Field.prototype.BuildUI = FieldBuildUI;
function FieldBuildUI()
{
}
function NoteField(frm, stName, stDisplay, stValue)
{
	frm.AddField(this, stName, stDisplay, stValue);
	this.stDirection = "";
    this.stNumLines = "";
}
NoteField.prototype.FieldFocus = NoteFieldFieldFocus;
function NoteFieldFieldFocus()
{
   return NoteFieldFieldFocusCore(this);
}
function NoteFieldFieldFocusCore(fld)
{
	var field = fld.frm.FieldPost(fld);
	if (!field.disabled)
	{
		field.focus();
		return true;
	}
	return false;
}
NoteField.prototype.BuildUI = NoteFieldBuildUI;
function NoteFieldBuildUI()
{
   NoteFieldBuildUICore(this);
}
function NoteFieldBuildUICore(fld)
{
	var st = "";
    st += "<TEXTAREA " + FormTabIndex() + " COLS=\"30\""
        + " ROWS="+StAttrQuote(fld.stNumLines)
        + " TITLE="+StAttrQuote(fld.stDisplay)
        + " Name="+StAttrQuote(fld.frm.stFieldPrefix+fld.stName)
        + " "+fld.frm.stLongStyle;
    st += fld.IMEMode ? " style=\"ime-mode:" + fld.IMEMode + "\" " : ""
    st += ">";
    st += STSHtmlEncode(fld.stValue);
    st += "</TEXTAREA>";
	fld.frm.BuildFieldUI(fld, st);
}
NoteField.prototype.DataBind = FieldDataBind;
NoteField.prototype.FValidate = NoteFieldFValidate;
function NoteFieldFValidate()
{
   return NoteFieldFValidateCore(this)
}
function NoteFieldFValidateCore(fld)
{
	var field = fld.frm.FieldPost(fld);
	if (fld.fRequired && FBlankString(field.value))
		{
		fld.stError = StBuildParam(L_FieldRequired_Text, fld.stDisplay);
		return false;
		}
	if (fld.frm.wBaseType == 1 && field.value && field.value.length > 255)
			{
			fld.stError = StBuildParam(L_TextFieldMax_Text, fld.stDisplay, 255);
			return false;
			}
	return true;
}
function RichTextField(frm, stName, stDisplay, stValue)
{
	frm.AddField(this, stName, stDisplay, stValue);
	this.stDirection = "";
	this.stNumLines = "";
	this.fAllowHyperlink = false;
}
RichTextField.prototype.FieldFocus = RichTextFieldFieldFocus;
function RichTextFieldFieldFocus()
{
   if (browseris.ie5up)
   {
      RTE_GiveEditorFirstFocus(this.frm.stFieldPrefix + this.stName);
      return true;
   }
   else
   {
      return NoteFieldFieldFocusCore(this);
   }
}
RichTextField.prototype.BuildUI = RichTextFieldBuildUI;
function RichTextFieldBuildUI()
{
   var st = "";
   var L_strRichTextSupport_Text = "\u60a8\u53ef\u4ee5\u6dfb\u52a0 HTML \u683c\u5f0f\u3002\u66f4\u591a\u4fe1\u606f\uff0c\u8bf7\u5355\u51fb<a href= 'javascript:HelpWindowKey(\"nsrichtext\")'>\u6b64\u5904</a>\u3002";
   NoteFieldBuildUICore(this);
   if (browseris.ie5up && browseris.win32)
   {
   	RTE_ConvertTextAreaToRichEdit(
   	      this.frm.stFieldPrefix + this.stName,
   	      true,
   	      fld.fAllowHyperlink,
   	      this.stDirection,
   	      L_Language_Text);
   }
   else 
   { 
      st += "&nbsp;<br><SPAN class=ms-formdescription>" + L_strRichTextSupport_Text + "</SPAN>&nbsp;<br>";
      document.write(st);
   }
}
RichTextField.prototype.DataBind = FieldDataBind;
RichTextField.prototype.FValidate = RichTextFieldFValidate;
function RichTextFieldFValidate()
{
   var fRet = NoteFieldFValidateCore(this);
   if (fRet && !browseris.ie5up)
   {
      var field = this.frm.FieldPost(this);
      var stVal = field.value;
      var len = stVal.length;
      if (stVal != "")
      {
         var finalVal = stVal;
         var stBegin5 = stVal.substr(0,5);
         var stEnd6 = stVal.substr(len-6,6);
         stBegin5.toLowerCase();
         stEnd6.toLowerCase();
         if (stBegin5 != "<div>" || stEnd6 != "</div>")
         {
            var stBegin4 = stVal.substr(0,4);
            var stEnd5 = stVal.substr(len-5, 5);
            stBegin4.toLowerCase();
            stEnd5.toLowerCase();
            if (stBegin4 != "<ol>" && stBegin4 != "<ul>"
                && stEnd5 != "</ol>" && stEnd5 != "</ul>")
            {
               var stBegin12 = stVal.substr(0,12);
               var stEnd13   = stVal.substr(len-13,13);
               stBegin12.toLowerCase();
               stEnd13.toLowerCase();
               if (stBegin12 != "<blockquote>" && stEnd13 != "</blockquote>")
               {
                  var stBegin3 = stVal.substr(0,3);
                  var stEnd4 = stVal.substr(len-4,4);
                  stBegin3.toLowerCase();
                  stEnd4.toLowerCase();
                  if (stBegin3 != "<p>" || stEnd4 != "</p>")
                  {
                     finalVal = "<div>" + stVal + "</div>";
                  }
               }
            }
         }
         var CRLF = /\n([^<])/g;
         finalVal = finalVal.replace(CRLF, "\n<br>$1");
         field.value = finalVal;
      }
   }
   return fRet;
}
function TextField(frm, stName, stDisplay, stValue)
{
	frm.AddField(this, stName, stDisplay, stValue);
	this.cchMaxLength = "";
	this.cchDisplaySize = "";
}
TextField.prototype.BuildUI = TextFieldBuildUI;
function TextFieldBuildUI()
{
	var st = this.stBuildUI();
	this.frm.BuildFieldUI(this, st);
}
TextField.prototype.stBuildUI = stTextFieldBuildUI;
function stTextFieldBuildUI()
{
	var st = "";
	var cchSize;
	if (this.cchMaxLength == "")
		this.cchMaxLength = 255;
	else
		this.cchMaxLength = this.cchMaxLength - 0;
	if (this.cchDisplaySize != "")
		cchSize = this.cchDisplaySize - 0;
	else if (this.cchMaxLength < 32)
		cchSize = this.cchMaxLength - 0;
	st += "<INPUT " + FormTabIndex() + " ";
	if (cchSize)
		st += this.frm.stInputStyle + " SIZE=" + cchSize;
	else
		st += this.frm.stLongStyle;
    var strIMEMode = this.IMEMode ? " style=\"ime-mode:" + this.IMEMode + "\" " : "";
	st += " MAXLENGTH=" + this.cchMaxLength + " " + this.stAttributes + 
	    " TITLE=" + StAttrQuote(this.stDisplay) +
	    " NAME=" + StAttrQuote(this.frm.stFieldPrefix + this.stName) +
	    strIMEMode +
		" VALUE=" + StAttrQuote(this.stValue) + ">\r";
	return st;
}
TextField.prototype.FieldFocus = TextFieldFieldFocus;
function TextFieldFieldFocus()
{
	var field = this.frm.FieldPost(this);
	if (!field.disabled)
	{
		field.focus();
		field.select();
		return true;
	}
	return false;
}
TextField.prototype.DataBind = FieldDataBind;
var L_TextFieldMax_Text = "^1 \u4e0d\u80fd\u8d85\u8fc7 ^2 \u4e2a\u5b57\u7b26\u3002";
TextField.prototype.FValidate = TextFieldFValidate;
function TextFieldFValidate()
{
	var field = this.frm.FieldPost(this);
	field.value = TrimWhiteSpaces(field.value);
	if (field.value.length > this.cchMaxLength)
		{
		this.stError = StBuildParam(L_TextFieldMax_Text, this.stDisplay, this.cchMaxLength);
		return false;
		}
	if (this.fRequired && field.value == "")
		{
		this.stError = StBuildParam(L_FieldRequired_Text, this.stDisplay);
		return false;
		}
	return true;
}
function FilenameField(frm, stName, stDisplay, stValue)
{
	frm.AddField(this, stName, stDisplay, stValue);
	this.cchMaxLength = "";
	this.cchDisplaySize = "";
}
FilenameField.prototype.BuildUI = FilenameFieldBuildUI;
function FilenameFieldBuildUI()
{
	var st = "";
	var cchSize;
	if (this.cchMaxLength == "")
		this.cchMaxLength = 255;
	else
		this.cchMaxLength = this.cchMaxLength - 0;
	if (this.cchDisplaySize != "")
		cchSize = this.cchDisplaySize - 0;
	else if (this.cchMaxLength < 32)
		cchSize = this.cchMaxLength - 0;
	st += "<INPUT " + FormTabIndex() + " ";
	if (cchSize)
		st += this.frm.stInputStyle + " SIZE=" + cchSize;
	else
		st += this.frm.stLongStyle;
	if (this.stValue.length > this.cchMaxLength)
	{
 		this.stValue = this.stValue.substr(0, this.cchMaxLength);
	}
    var strIMEMode = this.IMEMode ? " style=\"ime-mode:" + this.IMEMode + "\" " : "";
	st += " MAXLENGTH=" + this.cchMaxLength + " " + this.stAttributes + " NAME=" + StAttrQuote(this.stName) +
	      " TITLE=" + StAttrQuote(this.stDisplay) + " " + 
              strIMEMode +
	      " VALUE=" + StAttrQuote(this.stValue) + ">\r";
	this.frm.BuildFieldUI(this, st);
}
FilenameField.prototype.FieldFocus = FilenameFieldFieldFocus;
function FilenameFieldFieldFocus()
{
	var field = this.frm.FilenameFieldPost(this);
	if (!field.disabled)
	{
		field.focus();
		field.select();
		return true;
	}
	return false;
}
FilenameField.prototype.DataBind = FieldDataBind;
var L_FilenameFieldMax_Text = "^1 \u4e0d\u80fd\u8d85\u8fc7 ^2 \u4e2a\u5b57\u7b26\u3002";
FilenameField.prototype.FValidate = FilenameFieldFValidate;
function FilenameFieldFValidate()
{
		var field = this.frm.FilenameFieldPost(this);
	field.value = TrimWhiteSpaces(field.value);
	if (field.value.length > this.cchMaxLength)
		{
		this.stError = StBuildParam(L_FilenameFieldMax_Text, this.stDisplay, this.cchMaxLength);
		return false;
		}
	if (this.fRequired && field.value == "")
		{
		this.stError = StBuildParam(L_FieldRequired_Text, this.stDisplay);
		return false;
		}
	return true;
}
GridChoiceField.prototype.FieldFocus = GridChoiceFieldFocus;
function GridChoiceFieldFocus()
{
	return true;
}
function GridChoiceField(frm, stName, stDisplay, stValue)
{
	frm.AddField(this, stName, stDisplay, stValue);
	this.rgGridChoices = new Array;
}
GridChoiceField.prototype.BuildUI = GridChoiceBuildUI;
function GridChoiceBuildUI()
{
	var str = "";
	var i, j;
	var strDisplay = this.frm.rgfld[this.frm.ifldMax-1].stDisplay;
	var strName = this.frm.rgfld[this.frm.ifldMax-1].stName;
	var strValue = this.frm.rgfld[this.frm.ifldMax-1].stValue;
	var iGridHeight = this.rgGridChoices.length ;
	this.iGridHeight = iGridHeight;
	this.IsNew = (strValue == "");
	var cnt= 99; 
	var lastTxtRngCell = (STSHtmlEncode(this.GridNATxt) == "") ? "" : "<td align=right class=ms-gridT1>&nbsp;</TD>";
	str += this.frm.StFieldPost(this);
	str += "<TABLE CELLPADDING=0 CELLSPACING=1 BORDER=0 HEIGHT=95%>\r"; 
	str += "<tr><TD>&nbsp;</TD><td class=ms-verticaldots>&nbsp;</td>\r";
	str += "<td  class=ms-gridT1>" + STSHtmlEncode(this.GridTxtRng1) + "&nbsp;</TD><td align=center class=ms-gridT1 colspan = "; 
	str += this.GridEndNum - 2 + ">" + STSHtmlEncode(this.GridTxtRng2) + "</TD><td align=right class=ms-gridT1>&nbsp;" + STSHtmlEncode(this.GridTxtRng3) + "</TD>\r";
	str += lastTxtRngCell + "</tr>\r";
	str += "<tr><TD>&nbsp;</TD><td class=ms-verticaldots>&nbsp;</td>\r";
	for (i=this.GridStartNum; (i <= this.GridEndNum && cnt > 0); i++)
	{
		str += "<td align=center class=ms-gridT1>";
		str += i;
		str += "</TD>\r";
		cnt--;
	}
	if (STSHtmlEncode(this.GridNATxt) != "")
	{
		str += "<td align=center class=ms-gridT1>";
		str += STSHtmlEncode(this.GridNATxt);
		str += "</TD>\r";
		str += "</tr>";
	}
	str += "<TR><td class=ms-sectionline colspan=100% height=1><img alt='' src=";
        str += StAttrQuote(this.frm.stImagesPath + "blank.gif");
        str +="</td></TR>";
	for (i in this.rgGridChoices)
	{
		var choice = this.rgGridChoices[i];
		var num=-999; 
		if (!this.IsNew) 
		{
			var len = choice.stDisplay.length;
			var p = strValue.indexOf(choice.stDisplay+";#", 0);
            if (p != -1)
            {
                var q = strValue.indexOf("#", p + len + 2);
                if (q > p + len + 2)
				    num = strValue.substr(p + len + 2, q - (p + len + 2));
            }
		}
        str += "<TR><TD align=center class=ms-gridText>";
        str += STSHtmlEncode(choice.stDisplay);
        str += "</TD><td class=ms-verticaldots>&nbsp;</td>";
	    cnt= 99; 
	    endNum = (STSHtmlEncode(this.GridNATxt) == "") ? this.GridEndNum -1 : this.GridEndNum;
        for (j = this.GridStartNum; ((j <= endNum) && (cnt > 0)); j++)
        {
            str += "<td align=center><INPUT " + FormTabIndex() + " ";
            if (this.nochange == "yes") 
                str += "onclick=\"window.location.reload();\"";
            str += " TYPE=RADIO NAME=";
            str += StAttrQuote(this.frm.StFieldName(fld, "RadioButtons:") + i);
            if ((j - 0) == (num - 0))
                str += " checked ";
            str += "></TD>\r";
            cnt--;
        }
        str += "<td align=center><INPUT " + FormTabIndex() + " ";
        if (this.nochange == "yes") 
            str += "onclick=\"window.location.reload();\"";
        str += " TYPE=RADIO NAME=";
        str += StAttrQuote(this.frm.StFieldName(fld, "RadioButtons:") + i);
        if ((j - 0) == (num - 0))
            str += " checked ";
        str += "></TD>\r";
    	str += "</tr>\r";
 	}
    str += "</table>";
    this.frm.BuildFieldUI(this, str);
}
GridChoiceField.prototype.FValidate = GridChoiceFValidate;
function GridChoiceFValidate()
{
	var field = this.frm.FieldPost(this);
	field.value = "";
	var str="";
	var i;
	for (i in this.rgGridChoices)
	{
		var fieldControl = this.frm.FieldSubPart(this, "RadioButtons:" + i);
        endNum = (this.GridNATxt =="")? this.GridEndNum : this.GridEndNum - 0 + 1; 
		for (j = this.GridStartNum; j <= endNum; j++)
		{
			if (fieldControl[j - this.GridStartNum].checked)
			{
				str += this.rgGridChoices[i].stValue + ";#";
				str += (j >= 0) ? "+" + j : j;
				str += "#";
				break;
			}
		}
	}
	if (this.fRequired && str == "")
	{
		this.stError = StBuildParam(L_FieldRequired_Text, this.stDisplay);
		return false;
	}
	field.value = str;
	return true;
}
GridChoiceField.prototype.AddChoice = GridChoiceAddChoice;
function GridChoiceAddChoice(stDisplay, stValue)
{
	if (stValue == null || stValue == "")
		stValue = stDisplay;
	var choice = new Object;
	choice.stDisplay = stDisplay;
	choice.stValue = stValue;
	this.rgGridChoices[this.rgGridChoices.length] = choice;
}
function ChoiceField(frm, stName, stDisplay, stValue)
{
	frm.AddField(this, stName, stDisplay, stValue);
	this.rgChoices = new Array;
	this.format = "Dropdown";
	this.fFillInChoice = false;
	this.radioClass = "class=ms-RadioText ";
	this.tableClass = "";
}
ChoiceField.prototype.BuildUI = ChoiceBuildUI;
function ChoiceBuildUI()
{
    if (this.rgChoices.length == 0)
        return;
    if (this.format != "Dropdown" && 
        this.format != "RadioButtons" &&
        this.format != "Checkboxes")
	        this.format = "Dropdown";
	var st = this.stBuildUI();
	this.frm.BuildFieldUI(this, st);
}
var L_SpecifyYourOwn_Text = "\u6307\u5b9a\u81ea\u5b9a\u4e49\u503c:";
var L_Choose_Text = "\u9009\u62e9\u9009\u9879";
var L_FillInValue_Text = "\u586b\u5145\u503c";  
ChoiceField.prototype.stBuildUI = stChoiceBuildUI;
function stChoiceBuildUI()
{
    if (this.rgChoices.length == 0)
        return;
	var st = "";
	var i;
	var stControlName = "NAME=" + StAttrQuote(this.frm.StFieldName(this, this.format));
	if (this.fFillInChoice)
	{
		var fillin_value = "";
		var stFillInButtonName = this.frm.StFieldName(this, "FillInButton");
		if ((this.format == "RadioButtons" || this.format == "Checkboxes"))
			this.AddChoice(L_SpecifyYourOwn_Text);
	}
	st += this.frm.StFieldPost(this);
	if (this.format == "RadioButtons")
	{
		if (this.radioClass.indexOf("valign") == -1
			&& this.radioClass.indexOf("VALIGN") == -1)
		{
			this.radioClass += " VALIGN=MIDDLE";
		}
		st += "<TABLE CELLPADDING=0 CELLSPACING=1 " + this.tableClass + " >\r";
		var fValueMatched = false;
		for (i in this.rgChoices)
		{
			var choice = this.rgChoices[i];
			var stRawClickAttr = "frm.SetRadioValue(" + STSScriptEncodeWithQuote(this.stName) + ", " + STSScriptEncodeWithQuote(choice.stValue) + ");";
			var stTitle = "";
			if (this.stDisplay.length || choice.stDisplay.length)
				stTitle = this.stDisplay + ": " + choice.stDisplay;			
			stClickAttr = "onclick=" + StAttrQuote(stRawClickAttr);
			if (this.fIncludeMouseDown)
			{
				stClickAttr += " onmousedown=" + StAttrQuote(stRawClickAttr);
				stClickAttr += " onkeypress=" + StAttrQuote(stRawClickAttr);
				stClickAttr += " onmousewheel=" + StAttrQuote(stRawClickAttr);
			}				
			st += "<TR " + stClickAttr + ">\r<TD VALIGN=TOP>" +
			    "<INPUT " + FormTabIndex() + " TYPE=RADIO " + this.stAttributes + " " +	stControlName + 
   			    " TITLE=" + StAttrQuote(stTitle) + 		    
				" VALUE=" + StAttrQuote(choice.stValue);
			if (this.fFillInChoice && ! fValueMatched && i == (this.rgChoices.length-1) && this.stValue != "")
			{
				st += " CHECKED";
				fillin_value = this.stValue;
			} else if (choice.stValue == this.stValue)
			{
				st += " CHECKED";
				fValueMatched = true;
			}
			st += "></TD>\r<TD "+this.radioClass+">";
			if (this.nobr)
				st += "<nobr>";
			st += STSHtmlEncode(choice.stDisplay);
			if (choice.hasLayoutProc)
				st += eval(choice.stLayoutProc+"(this, stRawClickAttr)");
			if (this.nobr)
				st += "</nobr>";
			st += "</TD>\r</TR>\r";
		}
		if (this.fFillInChoice)
		{
			fillin_value = RemoveReplaceDelimiter(fillin_value);
			var stClickAttr = "frm.SetFillInButton(" + STSScriptEncodeWithQuote(this.stName) + ");";
			var stKeyDownAttr = "frm.SetFillInButton(" + STSScriptEncodeWithQuote(this.stName) + ");";
			stClickAttr = "onclick=" + StAttrQuote(stClickAttr);
			stKeyDownAttr = "onkeydown=" + StAttrQuote(stKeyDownAttr);
			stControlName = "NAME=" + StAttrQuote(this.frm.StFieldName(fld, "FillIn"));
			if (fillin_value.length > 255)
			{
 				fillin_value = fillin_value.substr(0, 255);
			}
			st += "<TR>\r<TD VALIGN=TOP></TD>\r<TD class=ms-RadioText VALIGN=TOP>"+
			      "<INPUT " + FormTabIndex() + " MAXLENGTH=255 " + 
			      stClickAttr + " " + stKeyDownAttr  + " " + this.frm.stLongStyle + " " + this.stAttributes + " " + stControlName + 
   			      " TITLE="+ StAttrQuote(this.stDisplay + ": " + L_FillInValue_Text);
   			st += this.IMEMode ? " style=\"ime-mode:" + this.IMEMode + "\" " : "";
   			st += " VALUE=" + STSHtmlEncode(fillin_value) + "></TD>\r</TR>\r";
		}
		st += "</TABLE>\r";
	}
	else if (this.format == "Checkboxes")
	{
		if (this.radioClass.indexOf("valign") == -1
			&& this.radioClass.indexOf("VALIGN") == -1)
		{
			this.radioClass += " VALIGN=MIDDLE ";
		}
		st += "<TABLE CELLPADDING=0 CELLSPACING=1 " + this.tableClass + " >\r";
		stValue = this.stValue;
		fMultiValue = false;
		if (stValue.charAt(0) == ';' && stValue.charAt(1) == '#')
		{
			fMultiValue = true;
		}
		var count=0;
		if (this.horizontal)
			st += "<TR>\r";
		for (i in this.rgChoices)
		{
			var choice = this.rgChoices[i];
			var stClickAttr = "frm.RevertSelect(" + STSScriptEncodeWithQuote(this.stName) + ", " + STSScriptEncodeWithQuote(choice.stValue) + ");";
			var stTitle = this.stDisplay + ": " + STSHtmlEncode(choice.stDisplay);
			stClickAttr = "onclick=" + StAttrQuote(stClickAttr);
			if (!this.horizontal)
				st += "<TR>\r";
			st += "<TD VALIGN=TOP>";
			st += "<INPUT " + FormTabIndex() + " TYPE=CHECKBOX " + this.stAttributes + " " + stControlName + 
   			    " TITLE=" + StAttrQuote(stTitle) +	    
			    " VALUE=" + StAttrQuote(choice.stValue);
			if (fMultiValue)
			{
				var searchPattern = ";#" + choice.stValue + ";#";
				var start = stValue.indexOf(searchPattern);
				if (start != -1)
				{
					st += " CHECKED";
					end = start + searchPattern.length;
					stValue = stValue.substr(0, start+2) + stValue.substr(end);
					if (stValue == ";#;#")
						stValue = "";
				}
			}
			else
			{
				if (stValue == choice.stValue)
				{
					st += " CHECKED";
					stValue = "";
				}
			}
			st += "></TD>\r<TD " + this.radioClass;
			st += stClickAttr + ">" + STSHtmlEncode(choice.stDisplay);
			st += "</TD>\r";
			if (!this.horizontal)
				st += "</TR>\r";
			else
			{
				if (this.horizontalBreakEvery
					&& 0 == (++count)%this.horizontalBreakEvery)
				{
					st += "</TR>\r<TR>\r";
				}
			}
		}
		if (this.horizontal)
			st += "</TR>\r";
		fillin_value = RemoveReplaceDelimiter(stValue);
		if (this.fFillInChoice)
		{
			var stClickAttr = "frm.SetFillInButton(" + STSScriptEncodeWithQuote(this.stName) + ");";
			var stKeyDownAttr = "frm.SetFillInButton(" + STSScriptEncodeWithQuote(this.stName) + ");";
			stClickAttr = "onclick=" + StAttrQuote(stClickAttr);
			stKeyDownAttr = "onkeydown=" + StAttrQuote(stKeyDownAttr);
			stControlName = "NAME=" + StAttrQuote(this.frm.StFieldName(this, "FillIn"));
	                if (fillin_value > 255)
			{
 				fillin_value = fillin_value.substr(0, 255);
			}
			st += "<TR>\r<TD VALIGN=TOP></TD>\r<TD class=ms-RadioText VALIGN=TOP><INPUT " + FormTabIndex() + " MAXLENGTH=255 " +
				  stClickAttr + " " + stKeyDownAttr  + " " + this.frm.stLongStyle + " " + this.stAttributes + " " + stControlName +
				  " TITLE="+ StAttrQuote(this.stDisplay + ": " + L_FillInValue_Text) +
				  " VALUE=" + STSHtmlEncode(fillin_value) + "></TD>\r</TR>\r";
		}
		st += "</TABLE>\r";
	}
	else  
	{
		if (!this.horizontal)
			st += "<TABLE CELLPADDING=0 CELLSPACING=1 " + this.tableClass + " >\r";
		var fDropdownSelected = false;
		var L_FillChoice_TXT = "\u4e0b\u62c9\u9009\u9879";
		var stClickAttr = "";
		if (this.fFillInChoice)
		{
			stClickAttr = "frm.UnsetFillInButton(" + STSScriptEncodeWithQuote(this.stName) + ");";
			stClickAttr = "onclick=" + StAttrQuote(stClickAttr);
		}
		var stControls = "";
		if (!this.horizontal)
			stControls += "<TD";
		else
			stControls += "<SPAN";
		stControls += " class=ms-RadioText VALIGN=TOP><SELECT TITLE=";
		if(this.fFillInChoice)
			stControls += StAttrQuote(this.stDisplay + ": " + L_FillChoice_TXT);
		else
			stControls += StAttrQuote(this.stDisplay);
		stControls += this.IMEMode ? " style=\"ime-mode:" + this.IMEMode + "\" " : "";
		stControls +=" " + FormTabIndex() + " " + this.stAttributes + stClickAttr + stControlName + ">\r";
		for (i in this.rgChoices)
		{
			var choice = this.rgChoices[i];
			stControls += "<OPTION " +
			" VALUE=" + StAttrQuote(choice.stValue);
			if (choice.stValue == this.stValue)
			{
				stControls += " SELECTED";
				fDropdownSelected = true;
			}
			stControls += ">" + STSHtmlEncode(choice.stDisplay) + "</OPTION>\r";
		}
		stControls += "</SELECT>";
		if (!this.horizontal)
			stControls += "</TD>\r";
		else
			stControls += "</SPAN>\r";
		if (this.fFillInChoice)
		{
			var stDropdownButton = "<TR>\r<TD VALIGN=TOP>" +
			"<INPUT " + FormTabIndex() + " TITLE=" + StAttrQuote(this.stDisplay + ": " + L_Choose_Text) +
			" TYPE=RADIO NAME=" + StAttrQuote(stFillInButtonName);
			if (fDropdownSelected ||  this.stValue == "")
			{
				stDropdownButton += " CHECKED";
			}
			stDropdownButton += "></TD>\r" + stControls + "</TR>\r";
			stControls = stDropdownButton;
			var stClickAttr = "frm.SetFillInButton(" + STSScriptEncodeWithQuote(this.stName) + ");";
			stClickAttr = "onclick=" + StAttrQuote(stClickAttr);
			stControls += "<TR " + stClickAttr + ">\r<TD VALIGN=TOP><INPUT TITLE=";
			stControls += StAttrQuote(this.stDisplay + ": " + L_SpecifyYourOwn_Text);
			stControls += this.IMEMode ? " style=\"ime-mode:" + this.IMEMode + "\" " : "";
			stControls += " " + FormTabIndex() + " TYPE=RADIO NAME=" + StAttrQuote(stFillInButtonName);
			if (!fDropdownSelected &&  this.stValue != "")
			{
				stControls += " CHECKED";
				fillin_value = this.stValue;
			}
			stControls += "></TD>\r<TD class=ms-descriptiontext VALIGN=MIDDLE>" + L_SpecifyYourOwn_Text + "</TD>\r</TR>\r";
			fillin_value = RemoveReplaceDelimiter(fillin_value);
		    stControlName = "NAME=" + StAttrQuote(this.frm.StFieldName(fld, "FillIn"));
			stControls += "<TR>\r<TD VALIGN=TOP></TD>\r<TD class=ms-RadioText VALIGN=TOP><INPUT ";
			stControls += this.IMEMode ? " style=\"ime-mode:" + this.IMEMode + "\" " : "";
			stControls +=" TITLE=";
			stControls += StAttrQuote(this.stDisplay + ": " + L_FillInValue_Text);
		    if (fillin_value > 255)
			{
 				fillin_value = fillin_value.substr(0, 255);
			}
			stControls += " " + FormTabIndex() + " MAXLENGTH=255 " + 
			      stClickAttr + " " + this.frm.stLongStyle + " " + this.stAttributes + " " + stControlName + 
			      " VALUE=" + STSHtmlEncode(fillin_value) + "></TD>\r</TR>\r";
			st += stControls;
		}
		else
		{
			if (!this.horizontal)
				st += "<TR>" + stControls + "</TR>\r";
			else
				st += stControls + "\r";
		}
		if (!this.horizontal)
			st += "</TABLE>\r";
	}
	return st;
}
ChoiceField.prototype.Init = ChoiceInit;
function ChoiceInit()
{
    if (this.rgChoices.length == 0)
        return;
	this.SetValue(this.stValue);
}
ChoiceField.prototype.AddChoice = ChoiceAddChoice;
function ChoiceAddChoice(stDisplay, stValue)
{
	if (stValue == null || stValue == "")
		stValue = stDisplay;
	var choice = new Object;
	choice.stDisplay = stDisplay;
	choice.stValue = stValue;
	choice.hasLayoutProc = false;
	this.rgChoices[this.rgChoices.length] = choice;
	return choice;
}
ChoiceField.prototype.AddChoiceWithLayoutProc = ChoiceAddChoiceWithLayoutProc;
function ChoiceAddChoiceWithLayoutProc(stDisplay, stValue, stProc)
{
	choice = this.AddChoice(stDisplay, stValue);
	choice.stLayoutProc = stProc;
	choice.hasLayoutProc = true;
}
ChoiceField.prototype.DataBind = ChoiceDataBind;
function ChoiceDataBind()
{
    if (this.rgChoices.length == 0)
        return;
	var field = this.frm.FieldPost(this);
	var fieldControl = this.GetControl();
	this.SetValue(field.value, true );
}
ChoiceField.prototype.SetValue = ChoiceSetValue;
function ChoiceSetValue(stValue, bInitializing)
{
    if (this.rgChoices.length == 0)
        return;
	var i;
	var fieldControl = this.frm.FieldSubPart(this, this.format);
	if (FBlankString(stValue) || this.format == "Checkboxes")
	{
		if (this.format == "Dropdown")
			fieldControl.selectedIndex = -1;
		else 
		{
			if (this.rgChoices.length != 1)
			{
				for (i in this.rgChoices)
					fieldControl[i].checked = false;
			}
			else
				fieldControl.checked = false;
		}
		if (this.fFillInChoice)
		{
			this.SetFillInValue("");  
			this.UnsetFillInButton();
		}
        if (FBlankString(stValue))
  		    return;
	}
	if (this.format == "Checkboxes" &&
		stValue.charAt(0) == ';' && stValue.charAt(1) == '#')
	{ 
		for (i in this.rgChoices)
		{
			var choice = this.rgChoices[i];
			var searchPattern = ";#" + choice.stValue + ";#";
			var start = stValue.indexOf(searchPattern);
			if (start != -1)
			{
				var fieldControl = this.GetControl(i);
				fieldControl.checked = true;
				end = start + searchPattern.length;
				stValue = stValue.substr(0, start+2) + stValue.substr(end);
				if (stValue == ";#;#")
					break;
			}
		}
		if (this.fFillInChoice)
		{
			stValue = RemoveReplaceDelimiter(stValue);
			if (stValue != "")
				this.SetFillInValue(stValue);
			else
			{
				this.UnsetFillInButton();
				if (bInitializing)
					this.GetFillInControl().value =	"";
			}
		}
		return;
	}
	var fFillInValue = true;
	for (i in this.rgChoices)
	{
		var choice = this.rgChoices[i];
		if (choice.stValue == stValue)
		{
			if (this.format == "Dropdown")
				fieldControl.selectedIndex = i;
			else
			{ 
				var fieldControl = this.GetControl(i);
				fieldControl.checked = true;
			}
			fFillInValue = false;
			break;
		}
	}
	if (this.fFillInChoice)
	{
		if (fFillInValue || stValue == L_SpecifyYourOwn_Text)
		{
			if (stValue != L_SpecifyYourOwn_Text)
				this.SetFillInValue(stValue);
		}
		else
		{
			this.UnsetFillInButton();
			if (bInitializing)
				this.GetFillInControl().value =	"";
		}
	}
	return;
}
ChoiceField.prototype.GetControl = ChoiceGetControl;
function ChoiceGetControl(i)
{
	var fieldControl = this.frm.FieldSubPart(this, this.format);
	if ((this.format == "RadioButtons" || this.format == "Checkboxes")
		&& this.rgChoices.length != 1)
	{
		if (i != null)
			return fieldControl[i];
		for (i in this.rgChoices)
		{
			if (fieldControl[i].checked)
				return fieldControl[i];
		}
		return fieldControl[0];
	}
	else
		return fieldControl;
}
ChoiceField.prototype.GetFillInButtonControl = ChoiceGetFillInButtonControl;
function ChoiceGetFillInButtonControl()
{
	if (this.format == "Dropdown")
	{
		var fillInButtonControl = this.frm.FieldSubPart(this, "FillInButton");
		return (fillInButtonControl[1]);
	}
	else
	{
		var fieldControl = this.frm.FieldSubPart(this, this.format);
		return (fieldControl[this.rgChoices.length-1]);
	}
}
ChoiceField.prototype.GetFillInControl = ChoiceGetFillInControl;
function ChoiceGetFillInControl()
{
	return this.frm.FieldSubPart(this, "FillIn");
}
ChoiceField.prototype.FieldFocus = ChoiceFieldFocus;
function ChoiceFieldFocus()
{
    if (this.rgChoices.length == 0)
        return false;
	var bSelectedFillInChoice = false;
	if (this.fFillInChoice)
	{
		if (this.format == "RadioButtons" || this.format == "Checkboxes")
		{
			var fieldControl = this.frm.FieldSubPart(this, this.format);
			for (i in this.rgChoices)
			{
				if (fieldControl[i].checked)
					break;
			}
			if (i == (this.rgChoices.length-1))
				bSelectedFillInChoice = true;
		}
		else
		{
			var fillInButton = this.GetFillInButtonControl();
			if (fillInButton.checked)
				bSelectedFillInChoice = true;
		}
	}
	if (bSelectedFillInChoice)
		var field = this.GetFillInControl();
	else
		var field = this.GetControl();
	if (!field.disabled)
	{
		field.focus();
		return true;
	}
	return false;	
}
ChoiceField.prototype.FValidate = ChoiceFValidate;
function ChoiceFValidate()
{
    if (this.rgChoices.length == 0)
        return;
	var field = this.frm.FieldPost(this);
	field.value = "";
	if (this.fFillInChoice)
	{
		var fillInButtonControl = this.GetFillInButtonControl();
		var fillInControl = this.GetFillInControl();
	}
	if (this.format == "Checkboxes" && this.rgChoices.length != 1)
		var fieldControl = this.frm.FieldSubPart(this, this.format);
	else
		var fieldControl = this.GetControl();
	if (this.format == "Dropdown")
	{
		if (this.fFillInChoice && fillInButtonControl.checked)
		{
			if (-1 != fillInControl.value.indexOf(";#"))
			{
				var L_InvalidFillIn_Text = "\u586b\u5145\u503c\u4e0d\u80fd\u5305\u542b\u5b57\u7b26\u4e32 ;#\u3002";
				this.stError = StBuildParam(L_InvalidFillIn_Text, this.stDisplay);
				return false;
			}
			field.value = TrimWhiteSpaces(fillInControl.value);
		}
		else
		{
			if (fieldControl.selectedIndex != -1)
				field.value = fieldControl[fieldControl.selectedIndex].value;
		}
	}
	else if (this.format == "Checkboxes" && this.rgChoices.length != 1)
	{ 
		var stValue = "";
		var stSingleValue = "";
		var numOfValues = 0;
		for (var i in this.rgChoices)
		{
			if (fieldControl[i].checked == true)
			{
				if (this.fFillInChoice && i == this.rgChoices.length-1)
				{
					var stFillInValue = TrimWhiteSpaces(fillInControl.value);
					if (stFillInValue == "")
						break;
					if (-1 != stFillInValue.indexOf(";#"))
					{
						var L_InvalidFillIn_Text = "\u586b\u5145\u503c\u4e0d\u80fd\u5305\u542b\u5b57\u7b26\u4e32 ;#\u3002";
						this.stError = StBuildParam(L_InvalidFillIn_Text, this.stDisplay);
						return false;
					}
					stSingleValue = stFillInValue;
				}
				else
					stSingleValue = this.rgChoices[i].stValue;
				numOfValues ++;
				if (numOfValues == 1)
					stValue = stSingleValue;
				else if (numOfValues == 2)
					stValue = ";#" + stValue + ";#" + stSingleValue + ";#";
				else
					stValue += stSingleValue + ";#";
			}
		}
		field.value = stValue;
	}
	else
	{   
		if (this.fFillInChoice && fillInButtonControl.checked)
		{
			if (-1 != fillInControl.value.indexOf(";#"))
			{
				var L_InvalidFillIn_Text = "\u586b\u5145\u503c\u4e0d\u80fd\u5305\u542b\u5b57\u7b26\u4e32 ;#\u3002";
				this.stError = StBuildParam(L_InvalidFillIn_Text, this.stDisplay);
				return false;
			}
			field.value = TrimWhiteSpaces(fillInControl.value);
		}
		else if (fieldControl.checked)
			field.value = fieldControl.value;
	}
	if (this.fRequired && field.value == "")
	{
		this.stError = StBuildParam(L_FieldRequired_Text, this.stDisplay);
		return false;
	}
	if (this.frm.wBaseType == 1 && field.value && field.value.length > 255)
	{
		this.stError = StBuildParam(L_TextFieldMax_Text, this.stDisplay, 255);
		return false;
	}
	return true;
}
ChoiceField.prototype.RevertSelect = ChoiceRevertSelect;
function ChoiceRevertSelect(stValue)
{
	if (stValue == "")
		return;
	for (i in this.rgChoices)
	{
		var choice = this.rgChoices[i];
		if (choice.stValue == stValue)
		{
			var fieldControl = this.GetControl(i);
			if (fieldControl.checked)
				fieldControl.checked = false;
			else
			{
				fieldControl.checked = true;
				if (this.fFillInChoice &&
					i == (this.rgChoices.length - 1))
				{
					var field = this.GetFillInControl();
			   		if (!field.disabled)
						field.focus();
				}
			}
			break;
		}
	}
}
ChoiceField.prototype.SetFillInButton = ChoiceFieldSetFillInButton;
function ChoiceFieldSetFillInButton()
{
	var fillInButton = this.GetFillInButtonControl();
	fillInButton.checked = true;
	var fillInControl = this.GetFillInControl();
	fillInControl.focus();
}
ChoiceField.prototype.UnsetFillInButton = ChoiceFieldUnsetFillInButton;
function ChoiceFieldUnsetFillInButton()
{
	if (this.format == "Dropdown")
	{
		var fillInButtonControl = this.frm.FieldSubPart(this, "FillInButton");
		fillInButtonControl[0].checked = true;
	} else
	{
		var fillInButton = this.GetFillInButtonControl();
		fillInButton.checked = false;
	}
}
ChoiceField.prototype.SetFillInValue = ChoiceSetFillInValue;
function ChoiceSetFillInValue(stValue)
{
	var fillInButton = this.GetFillInButtonControl();
	fillInButton.checked = true;
	var fillInControl = this.GetFillInControl();
	fillInControl.value = stValue;
}
function RemoveReplaceDelimiter(stValue)
{
	stValue = stValue.replace(/^;#/g, "");
	stValue = stValue.replace(/;#$/g, "");
	stValue = stValue.replace(/;#/g, "; ");
	return stValue;
}
var _RecurDateRangeDiv = "recurDateRangeDiv";
var _RecurPatternTextDiv = "recurPatternTextDiv";
var _RecurDailyDiv     = "recurDailyDiv";
var _RecurWeeklyDiv    = "recurWeeklyDiv";
var _RecurMonthlyDiv   = "recurMonthlyDiv";
var _recurFld;	
function RecurrencePattern(frm, stName, stDisplayName)
{
	var L_RecurPatternNone_Text = "\u65e0";
	var L_RecurPatternCustom_Text = "\u81ea\u5b9a\u4e49";
	var L_RecurPatternDaily_Text = "\u6bcf\u65e5";
	var L_RecurPatternWeekly_Text = "\u6bcf\u5468";
	var L_RecurPatternMonthly_Text = "\u6bcf\u6708";
	var L_RecurPatternYearly_Text = "\u6bcf\u5e74";
	var L_RangeTypeNone_Text = "\u65e0\u7ed3\u675f\u65e5\u671f";
	var L_RangeTypeCount_Text = "\u91cd\u590d: ";
	var L_RangeTypeEndDate_Text = "\u7ed3\u675f\u65e5\u671f: ";
	frm.AddField(this, stName, stDisplayName, "");
	this.fSkipValidation = true;
	this.isModifyException = false;
	this.isNewModifyException = false;
	this.stStartDate = "";
	this.stEndDate = "";
	this.caltype = 1;
	this.todayiso = "";
	this.stPrefix = "RecurrencePattern#";
	this.iCustom = "1"; 
	this.fDoCustom = false;
	this.rgStRecurType = new Array(
							L_RecurPatternNone_Text,
							L_RecurPatternCustom_Text,
							L_RecurPatternDaily_Text,
							L_RecurPatternWeekly_Text,
							L_RecurPatternMonthly_Text,
							L_RecurPatternYearly_Text);
	var ccRecurType = 0;
	for (i in this.rgStRecurType)
		ccRecurType = Math.max(ccRecurType, this.rgStRecurType[i].length);
	this.ccRecurType = ccRecurType + 14;
	this.rgStRangeType = new Array(
						L_RangeTypeNone_Text,
						L_RangeTypeCount_Text,
						L_RangeTypeEndDate_Text);
	var L_DayFrequency_Text = "1";
	var L_WeekFrequency_Text = "1";
	var L_Monthly1DayValue_Text = "1";
	var L_MonthFrequency_Text = "1";
	var L_DateRangeEndOccurrencesValue_Text = "10";
	this.recurrencePatternChoice = "0";
	this.monthlyChoiceValue = "0";
	this.dateRangeEndChoice = "0";
	this.dayFrequency = L_DayFrequency_Text;
	this.weekFrequency = L_WeekFrequency_Text;
	this.monthFrequency1 = L_MonthFrequency_Text;
	this.monthFrequency2 = L_MonthFrequency_Text;
	this.weeklyDayMultiValue = ";#" + frm.dopt.Today().getUTCDay() + ";#";
	this.monthly1DayValue = L_Monthly1DayValue_Text;
	this.monthly2DayValue = "0";
	this.monthly2WeekValue = "0";
	this.dateRangeStart = DateOptions.StISODate(this.frm.dopt.Today());
	this.dateRangeEnd = DateOptions.StISODate(this.frm.dopt.Today());
	this.dateRangeEndOccurrences = L_DateRangeEndOccurrencesValue_Text;
}
RecurrencePattern.prototype.BuildUI = RecurrencePatternBuildUI;
function RecurrencePatternBuildUI()
{
	var L_DateRange_Text = "\u65e5\u671f\u8303\u56f4";
	var L_Pattern_Text = "\u6a21\u5f0f";
	var L_StartDateRange_Text = "\u5f00\u59cb\u65e5\u671f";
	if (this.recurrencePatternChoice < 0
		|| this.recurrencePatternChoice > this.rgStRecurType.length)
		this.recurrencePatternChoice = "0";
	if (this.dateRangeEndChoice < 0
		|| this.dateRangeEndChoice > this.rgStRangeType.length)
		this.dateRangeEndChoice = "0";
	if (this.monthlyChoiceValue < 0
		|| this.monthlyChoiceValue > 2)
		this.monthlyChoiceValue = 0;
	var st = "";
	if (this.isModifyException || this.isNewModifyException)
	{
		if (this.isModifyException)
			{
				st += "<INPUT TYPE=HIDDEN NAME=" + StAttrQuote(this.frm.stFieldPrefix + this.stPrefix + "Modify:" + this.stName)
						+ "VALUE='TRUE'>\r";
			}
		else if (this.isNewModifyException)
			{
				st += "<INPUT TYPE=HIDDEN NAME=" + StAttrQuote(this.frm.stFieldPrefix + this.stPrefix + "NewModify:" + this.stName)
						+ "VALUE='TRUE'>\r";
				st += "<INPUT TYPE=HIDDEN NAME=" + StAttrQuote(this.frm.stFieldPrefix + fld.stRecurrenceIDName)
						+ "VALUE=" + StAttrQuote(this.stRecurrenceID) + ">\r";
				st += "<INPUT TYPE=HIDDEN NAME=" + StAttrQuote(this.frm.stFieldPrefix + fld.stUIDName)
						+ "VALUE=" + StAttrQuote(this.stUID) + ">\r";
			}
		if (this.stRecurrenceDescription)		
			st += STSHtmlEncode(this.stRecurrenceDescription);
		document.write(st);
		this.eventHook = new RecurrencePatternEventHooks(this, this.frm, null, this.stStartDate, this.stEndDate);
		this.eventHook.value = 0;
		this.eventHook.Init(); 
		return;
	}
	var dateFld = this.frm.FindField(this.stStartDate);
	if (dateFld)
	{
		st += "<INPUT TYPE=HIDDEN NAME=" + StAttrQuote(this.frm.stFieldPrefix + this.stPrefix + "oldStartDate:" + this.stName)
				+ "VALUE='";
		st += dateFld.stValue;
		st += "'>\r";
	}
	_recurFld = this;
	st += "<table border='0' cellpadding='0' cellspacing='0' class='ms-formrecurrence'>\r";
	st += "<tr><td rowspan='5' nowrap>\r";
	st += RecurrencePatternTypes(this);
	st += "</td>";
	st += "<td rowspan='5' nowrap><IMG width=40pt height=1pt SRC="
		+ StAttrQuote(this.frm.stImagesPath + "blank.gif") + ">"	
	    + "</td></tr>\r";
	st += "<tr><td nowrap valign='top'><div ID='"+_RecurPatternTextDiv+"' ";
	if (this.recurrencePatternChoice > "1")
		st += "style='display:none'";	
	st += ">\r";
	st += "<nobr><span class='ms-formdescription'>"
		+ L_Pattern_Text
		+ "</span></nobr>";
	st += "</div></td></tr>\r";
	st += "<tr><td nowrap valign='top' rowspan='4' height=68pt><table border='0' cellpadding='0' cellspacing='0' class='ms-formrecurrence'>";
	st += "<tr><td nowrap><IMG width=12pt height=1pt SRC="
		+ StAttrQuote(this.frm.stImagesPath + "blank.gif") + "></td></tr>";	
	st += "<tr><td nowrap valign='top'><div ID='"+_RecurDailyDiv+"' ";
	if (this.recurrencePatternChoice != "2")
		st += "style='display:none'";
	st += ">\r";
	st += RecurrencePatternDaily(this);
	st += "</div></td></tr>\r";
	st += "<tr><td nowrap valign='top'><div ID='"+_RecurWeeklyDiv+"' ";
	if (this.recurrencePatternChoice != "3")
		st += "style='display:none'";
	st += ">\r";
	st += RecurrencePatternWeekly(this);
	st += "</div></td></tr>\r";
	st += "<tr><td nowrap valign='top'><div ID='"+_RecurMonthlyDiv+"' ";
	if (this.recurrencePatternChoice != "4")
		st += "style='display:none'";
	st += ">\r";
	st += RecurrencePatternMonthly(this);
	st += "</div></td></tr></table></td></tr></table>\r";
	document.write(st);
	st = "<div ID='"+_RecurDateRangeDiv+"' ";
	if (this.recurrencePatternChoice > "1")
		st += "style='display:none'";	
	st += ">\r";
	st += "<table border='0' cellpadding='0' cellspacing='0' class='ms-formrecurrence'><tr>\r";
	st += "<td nowrap><IMG width=116pt height=1pt SRC="
		+ StAttrQuote(this.frm.stImagesPath + "blank.gif") + ">"	
		+ "</td>";
	st += "<td valign=top nowrap><nobr><span class='ms-formdescription'>"
		+ L_DateRange_Text
		+ "</span><br><br>"
		+ L_StartDateRange_Text
		+ "</nobr><br>";
	st += RecurrenceDateRangeStart(this);
	st += "</td>";
	st += "<td nowrap><IMG width=10pt height=1pt SRC="
		+ StAttrQuote(this.frm.stImagesPath + "blank.gif") + ">"	
		+ "</td><td nowrap><br><br>";
	st += RecurrenceDateRangeEnd(this);
	st += "</td></tr></table></div>\r";
	document.write(st);
	_recurFld = null;
}
RecurrencePattern.prototype.Init = RecurrencePatternInit;
function RecurrencePatternInit()
{	
	if (this.isModifyException || this.isNewModifyException)
	{
		var dateFld = this.frm.FindField(this.stEndDate);
		if (dateFld)
			dateFld.fRequired = true;
	}
}
function RecurrencePatternTypes(recurFld)
{
	var st="";
	var L_RecurrenceType_Text = "\u91cd\u590d\u7c7b\u578b";
	fld = new ChoiceField(recurFld.frm,
								recurFld.stPrefix+"Type:"+recurFld.stName,
								L_RecurrenceType_Text,
								recurFld.recurrencePatternChoice);
	fld.format = "RadioButtons";
	fld.radioClass = "class=ms-radiotext ";
	for (i in recurFld.rgStRecurType)
	{
		var stI = "";
		if (i != recurFld.iCustom || recurFld.fDoCustom )
		{
			stI = i;
			fld.AddChoice(recurFld.rgStRecurType[i], stI);
		}
	}
	st += fld.stBuildUI();
	recurFld.eventHook = new RecurrencePatternEventHooks(recurFld, recurFld.frm, fld, recurFld.stStartDate, recurFld.stEndDate);
	recurFld.eventHook.Init(); 
	return st;
}
function RecurrencePatternDaily(recurFld)
{
	var st="";
	var L_Daily_Text = "\u6bcf ^1 \u5929\u91cd\u590d\u53d1\u751f";
	var L_DailyDisplay_Text = "\u6b64\u4e8b\u4ef6\u91cd\u590d\u53d1\u751f\u95f4\u9694\u7684\u5929\u6570";
	var fld = new NumberField(recurFld.frm,
						recurFld.stPrefix+"daily_dayFrequency:"+recurFld.stName,
						L_DailyDisplay_Text,
						recurFld.dayFrequency);
	fld.cchDisplaySize = 3;
	fld.wMin = 1;
	fld.wMax = 255;
	fld.fInteger = true;
	fld.fSkipValidation = true;
	_recurFld.dayFrequencyFld = fld;
	var cntrl1 = fld.stBuildUI();
	st = StBuildParam(L_Daily_Text, cntrl1);
	st += "<p><p>";
	return st;
}
var L_Monday_Text    = "\u661f\u671f\u4e00";
var L_Tuesday_Text   = "\u661f\u671f\u4e8c";
var L_Wednesday_Text = "\u661f\u671f\u4e09";
var L_Thursday_Text  = "\u661f\u671f\u56db";
var L_Friday_Text    = "\u661f\u671f\u4e94";
var L_Saturday_Text  = "\u661f\u671f\u516d";
var L_Sunday_Text    = "\u661f\u671f\u65e5";
function RecurrencePatternWeekly(recurFld)
{
	var L_Weekly_Text = "\u6bcf ^1 \u5468\u91cd\u590d\u53d1\u751f\u65f6\u95f4:^2";
	var L_WeeklyRecurDisplay_Text = "\u6b64\u4e8b\u4ef6\u91cd\u590d\u53d1\u751f\u95f4\u9694\u7684\u5468\u6570";
	var L_WeeklyDayChoiceDisplay_Text = "\u6b64\u4e8b\u4ef6\u53d1\u751f\u5728\u4e00\u5468\u4e2d\u7684\u54ea\u5929";
	var fld = new NumberField(recurFld.frm,
						recurFld.stPrefix+"weekly_weekFrequency:"+recurFld.stName,
						L_WeeklyRecurDisplay_Text,
						recurFld.weekFrequency);
	fld.cchDisplaySize = 3;
	fld.wMin = 1;
	fld.wMax = 52;
	fld.fInteger = true;
	fld.fSkipValidation = true;
	recurFld.weeklyFrequencyFld = fld;
	var cntrl1 = fld.stBuildUI();
	var dayChoice = new Array(L_Sunday_Text, L_Monday_Text, L_Tuesday_Text,
							  L_Wednesday_Text, L_Thursday_Text, L_Friday_Text,
							  L_Saturday_Text);
	var stSourceURL = StURLGetVar("Source");
	if (stSourceURL.length)
	{
		stSourceURL = unescape(stSourceURL);
		var stCalDate = StSearchVar(stSourceURL, "CalendarDate");
		var stCalPeriod = StSearchVar(stSourceURL, "CalendarPeriod");
		if (stCalPeriod == "day" && stCalDate.length)
		{
			var isoDate = DateOptions.ParseISODate(stCalDate); 
			if (!isNaN(isoDate))
				recurFld.weeklyDayMultiValue = ";#" + isoDate.getUTCDay() + ";#";
		}
	}
	fld = new ChoiceField(recurFld.frm,
						recurFld.stPrefix+"weekly_multiDays:"+recurFld.stName,
						L_WeeklyDayChoiceDisplay_Text,
						recurFld.weeklyDayMultiValue);
	fld.format = "Checkboxes";
	fld.radioClass = " class=ms-input valign=baseline ";
	fld.tableClass = " class=ms-formrecurrence ";
	fld.horizontal = true;
	fld.horizontalBreakEvery = 4;
	recurFld.weeklyMultiDayFld = fld;
	var stI = "";
	for (i in dayChoice)
	{
		stI = i;
		fld.AddChoice(dayChoice[i], stI);
	}
	var cntrl2 = "<DIV>"+fld.stBuildUI()+"</DIV>";
	return StBuildParam(L_Weekly_Text, cntrl1, cntrl2);
}
function RecurrencePatternMonthly(recurFld)
{
	fld = new ChoiceField(recurFld.frm,
						recurFld.stPrefix+"MonthlyRecurType:"+recurFld.stName,
						"",
						recurFld.monthlyChoiceValue);
	fld.format = "RadioButtons";
	fld.radioClass = "class=ms-input valign=baseline";
	fld.tableClass = " class=ms-formrecurrence ";
	fld.fIncludeMouseDown = true;
	fld.nobr = true;
	recurFld.monthlyChoiceFld = fld;
	fld.AddChoiceWithLayoutProc("", "0", "RecurrencePatternMonthly1");
	fld.AddChoiceWithLayoutProc("", "1", "RecurrencePatternMonthly2");
	var st = fld.stBuildUI();
	return st;
}
function RecurrencePatternMonthly1(choiceFld)
{
	var L_Monthly1_Text = "\u6bcf ^2 \u4e2a\u6708\u7684\u7b2c ^1 \u65e5";
	var L_Monthly1DayDisplay_Text = "\u6b64\u4e8b\u4ef6\u6bcf\u6708\u53d1\u751f\u7684\u65e5\u671f";
	var L_Monthly1MonthDisplay_Text = "\u91cd\u590d\u53d1\u751f\u95f4\u9694\u7684\u6708\u6570";
	var fld = new NumberField(_recurFld.frm,
						_recurFld.stPrefix+"monthly_day:"+_recurFld.stName,
						L_Monthly1DayDisplay_Text,
						_recurFld.monthly1DayValue);
	fld.cchDisplaySize = 2;
	fld.wMin = 1;
	fld.wMax = 31;
	fld.fInteger = true;
	fld.fSkipValidation = true;
	_recurFld.monthlyChoice1DayFld = fld;
	var cntrl1 = fld.stBuildUI();
	var fld = new NumberField(_recurFld.frm,
						_recurFld.stPrefix+"monthly_monthFrequency:"+_recurFld.stName,
						L_Monthly1MonthDisplay_Text,
						_recurFld.monthFrequency1);
	fld.cchDisplaySize = 2;
	fld.wMin = 1;
	fld.wMax = 12;
	fld.fInteger = true;
	fld.fSkipValidation = true;
	_recurFld.monthlyChoice1MonthFreqFld = fld;
	var cntrl2 = fld.stBuildUI();
	return StBuildParam(L_Monthly1_Text, cntrl1, cntrl2);
}
function RecurrencePatternMonthly2(choiceFld)
{
	var L_Monthly2_Text = "\u6bcf ^3 \u4e2a\u6708\u7684 ^1^2";
	var L_Monthly2WhichWeekDisplay_Text = "\u6b64\u4e8b\u4ef6\u53d1\u751f\u5728\u6bcf\u6708\u7684\u7b2c\u51e0\u5468";
	var L_Monthly2DayDisplay_Text = "\u6b64\u4e8b\u4ef6\u53d1\u751f\u5728\u4e00\u5468\u4e2d\u7684\u54ea\u5929";
	var L_Monthly2MonthDisplay_Text
						= "\u91cd\u590d\u53d1\u751f\u95f4\u9694\u7684\u6708\u6570";
	var L_FirstWeek_Text  = "\u7b2c\u4e00\u4e2a";
	var L_SecondWeek_Text = "\u7b2c\u4e8c\u4e2a";
	var L_ThirdWeek_Text  = "\u7b2c\u4e09\u4e2a";
	var L_FourthWeek_Text = "\u7b2c\u56db\u4e2a";
	var L_LastWeek_Text   = "\u6700\u540e\u4e00\u4e2a";
	var weekChoice = new Array(L_FirstWeek_Text, L_SecondWeek_Text, L_ThirdWeek_Text,
							   L_FourthWeek_Text, L_LastWeek_Text);
	var dayChoice = new Array(L_Sunday_Text, L_Monday_Text, L_Tuesday_Text, L_Wednesday_Text,
							  L_Thursday_Text, L_Friday_Text, L_Saturday_Text);
	fld = new ChoiceField(_recurFld.frm,
								_recurFld.stPrefix+"monthlyByDay_weekOfMonth:"+_recurFld.stName,
								L_Monthly2WhichWeekDisplay_Text,
								_recurFld.monthly2WeekValue);
	fld.horizontal = true;
	for (i in weekChoice)
	{
		var stI = "";
		stI = i;
		fld.AddChoice(weekChoice[i], stI);
	}
	var cntrl1 = fld.stBuildUI();
	fld = new ChoiceField(_recurFld.frm,
								_recurFld.stPrefix+"monthlyByDay_day:"+_recurFld.stName,
								L_Monthly2DayDisplay_Text,
								_recurFld.monthly2DayValue);
	fld.horizontal = true;
	for (i in dayChoice)
	{
		var stI = "";
		stI = i;
		fld.AddChoice(dayChoice[i], stI);
	}
	var cntrl2 = fld.stBuildUI();
	var fld = new NumberField(_recurFld.frm,
						_recurFld.stPrefix+"monthlyByDay_monthFrequency:"+_recurFld.stName,
						L_Monthly2MonthDisplay_Text,
						_recurFld.monthFrequency2);
	fld.cchDisplaySize = 2;
	fld.wMin = 1;
	fld.wMax = 12;
	fld.fInteger = true;
	fld.fSkipValidation = true;
	_recurFld.monthlyChoice2MonthFreqFld = fld;
	var cntrl3 = fld.stBuildUI();
	return StBuildParam(L_Monthly2_Text, cntrl1, cntrl2, cntrl3);
}
function RecurrenceDateRangeStart(recurFld)
{
	var st = "<nobr>\r";
	var L_DateRangeStartDisplay_Text = "\u6b64\u4e8b\u4ef6\u5f00\u59cb\u7684\u65f6\u95f4";
	fld = new DateField(recurFld.frm,
					recurFld.stPrefix+"windowStart:"+recurFld.stName,
					L_DateRangeStartDisplay_Text,
					recurFld.todayiso);
	fld.fRequired = true;
	fld.fSkipValidation = true; 
	fld.caltype = recurFld.caltype;
	recurFld.dateRangeFldStart = fld;
	fld.fDateOnly = true;
	fld.fHideDateSpan = true;
	st += fld.stBuildUI();
	st += "</nobr>\r";
	return st;
}
function RecurrenceDateRangeEnd(recurFld)
{
	var L_DateRangeTypeDisplay_Text = "\u6b64\u4e8b\u4ef6\u7ed3\u675f\u7684\u65e5\u671f";
	fld = new ChoiceField(recurFld.frm,
					recurFld.stPrefix+"EndDateRangeType:"+recurFld.stName,
					L_DateRangeTypeDisplay_Text,
					recurFld.dateRangeEndChoice);
	recurFld.endRangeOptionFld = fld;
	fld.format = "RadioButtons";
	fld.tableClass = "class='ms-formrecurrence'";
	fld.radioClass = "class=ms-input valign=baseline";
	fld.fIncludeMouseDown = true;
	fld.nobr = true;
	fld.AddChoice(recurFld.rgStRangeType[0], "0");  
	fld.AddChoiceWithLayoutProc(recurFld.rgStRangeType[1],
								"1",
								"RecurrenceEndDateRange1");
	fld.AddChoiceWithLayoutProc(recurFld.rgStRangeType[2],
								"2",
								"RecurrenceEndDateRange2");
	return fld.stBuildUI();
}
function RecurrenceEndDateRange1(choiceFld)
{
	var L_EndDateRange_Text = "^1 \u6b21\u540e\u7ed3\u675f";
	var L_DateRangeOccurrencesDisplay_Text = "\u6b64\u4e8b\u4ef6\u91cd\u590d\u53d1\u751f\u7684\u6b21\u6570";
	var fld = new NumberField(_recurFld.frm,
						_recurFld.stPrefix+"repeatInstances:"+_recurFld.stName,
						L_DateRangeOccurrencesDisplay_Text,
						_recurFld.dateRangeEndOccurrences);
	fld.cchDisplaySize = 4;
	fld.wMin = 1;
	fld.wMax = 999;
	fld.fInteger = true;
	fld.fSkipValidation = true;
	_recurFld.dateRangeFldEndOccurrances = fld
	var cntrl1 = fld.stBuildUI();
	return StBuildParam(L_EndDateRange_Text, cntrl1);
}
function RecurrenceEndDateRange2(choiceFld, stPopUpOnClick2)
{
	var L_DateRangeEndDisplay_Text = "\u6b64\u4e8b\u4ef6\u7ed3\u675f\u7684\u65f6\u95f4";
	var fld = new DateField(_recurFld.frm,
						_recurFld.stPrefix+"windowEnd:"+_recurFld.stName,
						L_DateRangeEndDisplay_Text,
						"");
	fld.fRequired = true;
	fld.fSkipValidation = true;	
	fld.caltype = _recurFld.caltype;
	_recurFld.dateRangeFldEnd = fld;
	fld.fDateOnly = true;
	fld.fHideDateSpan = true;
	fld.stPopUpOnClick2 = stPopUpOnClick2;
	return fld.stBuildUI();
}
function RecurrencePatternEventHooks(recurFld, frm, typeFld, stStartDate, stEndDate)
{
	this.recurFld = recurFld;
	this.frm = frm;
	this.typeFld = typeFld;
	this.stStartDate = stStartDate;
	this.stEndDate = stEndDate;
	frm.AddField(this, "RecurrencePatternType", "Date range, end pattern", 0);
	if (typeFld)
		typeFld.stAlias = "RecurrencePatternType";
	this.rgStPatternTypes = new Array(
						"", 
						"", 
						_RecurDailyDiv,
						_RecurWeeklyDiv,
						_RecurMonthlyDiv,
						"" );
	this.value = -1;
}
RecurrencePatternEventHooks.prototype.Init = RecurrencePatternEventHooksInit;
function RecurrencePatternEventHooksInit()
{
	this.dateFldStart = this.frm.FindField(this.recurFld.stStartDate);
	this.dateFldEnd = this.frm.FindField(this.recurFld.stEndDate);
	this.dateRangeFldStart = this.recurFld.dateRangeFldStart;
	this.dateRangeFldEnd = this.recurFld.dateRangeFldEnd;
	var stID = "";
	stID = StURLGetVar("ID");
	if (0 == stID.length)
	{
		if (this.dateFldStart)
		{
			var stSourceURL = StURLGetVar("Source");
			if (stSourceURL.length)
			{
				stSourceURL = unescape(stSourceURL);
				var stCalDate = StSearchVar(stSourceURL, "CalendarDate");
				var stCalPeriod = StSearchVar(stSourceURL, "CalendarPeriod");
				if (stCalPeriod == "day" && stCalDate.length)
				{
					var isoDate = DateOptions.ParseISODate(stCalDate); 
					if (!isNaN(isoDate))
					{
						stCalDate = this.frm.dopt.StDate(isoDate);
						var dateFld = this.frm.FieldSubPart(this.dateFldStart, "Date");
						dateFld.value = stCalDate;
					}
				}
			}
			var disableSave = this.dateFldStart.disabled;
			this.dateFldStart.disabled = false;
			if (this.dateFldStart.FValidate() && this.dateFldStart.date)
			{
				this.dateFldStart.date.setUTCHours(0,0,0,0);		
				this.frm.dopt.SetTimeControls(this.dateFldStart, this.dateFldStart.date);
			}
			this.dateFldStart.disabled = disableSave;
		}
	}	
	this.DateToDateRange();
	this.InitHooks();
}
RecurrencePatternEventHooks.prototype.InitHooks = DoInitRecurrencePatternEventHooks;
function DoInitRecurrencePatternEventHooks()
{   
    this.divtags = document.getElementsByTagName("div"); 
    this.stRecurDateRangeDiv = this.divtags[_RecurDateRangeDiv];
    this.stRecurPatternTextDiv = this.divtags[_RecurPatternTextDiv];
    var spantags = document.getElementsByTagName("span");
    this.stStartDateSpan = spantags[this.frm.StFieldNameFactory(this.stStartDate,"DateSpan")];
    this.stEndDateSpan = spantags[this.frm.StFieldNameFactory(this.stEndDate,"DateSpan")];
	if (this.typeFld)
		this.ToggleDisplay(this.typeFld.stValue, true);
}
RecurrencePatternEventHooks.prototype.FValidate = RecurrencePatternValidate;
function RecurrencePatternValidate()
{
	var L_DateRangeOrdering_Text = "\u5f00\u59cb\u65e5\u671f\u548c\u65f6\u95f4\u5728\u7ed3\u675f\u65e5\u671f\u548c\u65f6\u95f4\u4e4b\u540e\u3002";
	this.errFld = 0;
	if (this.value == 0)
	{
		if (!this.dateFldEnd.FValidate()
			|| !this.dateFldEnd.date)
		{
			var hr = this.frm.GetSelValue(this.frm.StFieldName(this.dateFldEnd, "Hours")) - 0;
			var min = this.frm.GetSelValue(this.frm.StFieldName(this.dateFldEnd, "Minutes"));
			if (hr != 0 || min != 0)
				this.CopyDateFld(this.dateFldStart, this.dateFldEnd);
		}
		if (this.dateFldStart.FValidate()
			&& this.dateFldEnd.FValidate()
			&& this.dateFldStart.date
			&& this.dateFldEnd.date
			&& this.dateFldEnd.date.getTime() < this.dateFldStart.date.getTime())
		{
			this.errFld = this.dateFldStart;
			this.errFld.stError = L_DateRangeOrdering_Text;
			return false;
		}
	}
	else if (this.value >= 2)
	{
		if (!this.dateRangeFldStart.FValidate())
		{
			this.errFld = this.dateRangeFldStart;
			return false;
		}
		if (this.recurFld.endRangeOptionFld
			&& this.recurFld.endRangeOptionFld.FValidate())
		{
			var endRangeOptionFldPost = this.frm.FieldPost(this.recurFld.endRangeOptionFld);
			var fValidEndDate = this.dateRangeFldEnd.FValidate();
			if ( !endRangeOptionFldPost
				|| endRangeOptionFldPost.value == "2")
			{
				if (!fValidEndDate)
				{
					this.errFld = this.dateRangeFldEnd;
					return false;
				}
				if (this.dateRangeFldEnd.date.getTime() <
					this.dateRangeFldStart.date.getTime())
				{
					this.errFld = this.dateRangeFldStart;
					this.errFld.stError = L_DateRangeOrdering_Text;
					return false;
				}
			}
			else if (endRangeOptionFldPost.value == "1")
			{
				if (this.recurFld.dateRangeFldEndOccurrances)
				{
					this.recurFld.dateRangeFldEndOccurrances.fRequired = true;
					var fValid = this.recurFld.dateRangeFldEndOccurrances.FValidate();
					this.recurFld.dateRangeFldEndOccurrances.fRequired = false;
					if (!fValid)
					{
						this.errFld = this.recurFld.dateRangeFldEndOccurrances;
						return false;
					}
				}
				if (!fValidEndDate)
				{
					this.CopyDateFld(this.dateRangeFldStart, this.dateRangeFldEnd);
				}
			}
			else if (!fValidEndDate)
			{
				this.CopyDateFld(this.dateRangeFldStart, this.dateRangeFldEnd);
			}
		}
		if (this.value == 2)
		{
			if (this.recurFld.dayFrequencyFld)
			{
				this.recurFld.dayFrequencyFld.fRequired = true;
				var fValid = this.recurFld.dayFrequencyFld.FValidate();
				this.recurFld.dayFrequencyFld.fRequired = false;
				if (!fValid)
				{
					this.errFld = this.recurFld.dayFrequencyFld;
					return false;
				}
			}
		}
		else if (this.value == 3)
		{
			if (this.recurFld.weeklyFrequencyFld)
			{
				this.recurFld.weeklyFrequencyFld.fRequired = true;
				var fValid = this.recurFld.weeklyFrequencyFld.FValidate();
				this.recurFld.weeklyFrequencyFld.fRequired = false;
				if (!fValid)
				{
					this.errFld = this.recurFld.weeklyFrequencyFld;
					return false;
				}
			}
			if (this.recurFld.weeklyMultiDayFld)
			{
				this.recurFld.weeklyMultiDayFld.fRequired = true;
				var fValid = this.recurFld.weeklyMultiDayFld.FValidate();
				this.recurFld.weeklyMultiDayFld.fRequired = false;
				if (!fValid)
				{
					this.errFld = this.recurFld.weeklyMultiDayFld;
					return false;
				}
			}
		}
		else if (this.value == 4)
		{
			if (this.recurFld.monthlyChoiceFld
				&& this.recurFld.monthlyChoiceFld.FValidate())
			{
				var monthlyChoiceFldPost = this.frm.FieldPost(this.recurFld.monthlyChoiceFld);
				if (monthlyChoiceFldPost)
				{
					if (monthlyChoiceFldPost.value == "0")
					{
						this.recurFld.monthlyChoice1DayFld.fRequired = true;
						var fValid = this.recurFld.monthlyChoice1DayFld.FValidate();
						this.recurFld.monthlyChoice1DayFld.fRequired = false;
						if (!fValid)
						{
							this.errFld = this.recurFld.monthlyChoice1DayFld;
							return false;
						}
						this.recurFld.monthlyChoice1MonthFreqFld.fRequired = true;
						fValid = this.recurFld.monthlyChoice1MonthFreqFld.FValidate();
						this.recurFld.monthlyChoice1MonthFreqFld.fRequired = false;
						if (!fValid)
						{
							this.errFld = this.recurFld.monthlyChoice1MonthFreqFld;
							return false;
						}
					}
					else if (monthlyChoiceFldPost.value == "1")
					{
						this.recurFld.monthlyChoice2MonthFreqFld.fRequired = true;
						var fValid = this.recurFld.monthlyChoice2MonthFreqFld.FValidate();
						this.recurFld.monthlyChoice2MonthFreqFld.fRequired = false;
						if (!fValid)
						{
							this.errFld = this.recurFld.monthlyChoice2MonthFreqFld;
							return false;
						}
					}
				}
			}
		}
	}
	return true;
}
RecurrencePatternEventHooks.prototype.SetValue = RecurrencePatternEventHooksSetValue;
function RecurrencePatternEventHooksSetValue(value)
{
	this.typeFld.SetValue(value);
	this.ToggleDisplay(value, false);
}
function DisplayOff(fld)
{
	if (fld)
	{
		if (!fld.length)
		{
			DoDisplayOff(fld);
			if (fld.children)
				DoDisplayOff(fld.children);
		}
		else
		{
			var i;
			for (i=0; i<fld.length; i++)
			{
				DoDisplayOff(fld[i]);
				if (fld[i].children)
					DoDisplayOff(fld[i].children);
			}
		}
	}
}
function DoDisplayOff(fld)
{
	if (fld)
	{
		if (!fld.length)
		{
			fld.disabled = true;
			if (fld.style)
				fld.style.display = "none";
		}
		else
		{
			var i;
			for (i=0; i<fld.length; i++)
			{
				fld[i].disabled = true;
				if (fld[i].style)
					fld[i].style.display = "none";
			}
		}
	}
}
function DisplayOn(fld)
{
	if (fld)
	{
		if (!fld.length)
		{
			DoDisplayOn(fld);
			if (fld.children)
				DoDisplayOn(fld.children);
		}
		else
		{
			var i;
			for (i=0; i<fld.length; i++)
			{
				DoDisplayOn(fld[i]);
				if (fld[i].children)
					DoDisplayOn(fld[i].children);
			}
		}
	}
}
function DoDisplayOn(fld)
{
	if (fld)
	{
		if (!fld.length)
		{
			fld.disabled = false;
			if (fld.style)
				fld.style.display = "";
		}
		else
		{
			var i;
			for (i=0; i<fld.length; i++)
			{
				fld[i].disabled = false;
				if (fld[i].style)
					fld[i].style.display = "";
			}
		}
	}
}
function FieldsDisabled(fld)
{
	if (fld)
	{
		if (!fld.length)
		{
			fld.disabled = true;
			if (fld.style)
				fld.style.visibility = "hidden";
		}
		else
		{
			var i;
			for (i=0; i<fld.length; i++)
			{
				fld[i].disabled = true;
				if (fld[i].style)
					fld[i].style.visibility = "hidden";
			}
		}
	}
}
function FieldsEnabled(fld)
{
	if (fld)
	{
		if (!fld.length)
		{
			fld.disabled = false;
			if (fld.style)
				fld.style.visibility = "visible";
		}
		else
		{
			var i;
			for (i=0; i<fld.length; i++)
			{
				fld[i].disabled = false;
				if (fld[i].style)
					fld[i].style.visibility = "visible";
			}
		}
	}
}
RecurrencePatternEventHooks.prototype.DateRangeToDate = FnDateRangeToDate
function FnDateRangeToDate()
{
	this.CopyDateFld(this.dateRangeFldStart, this.dateFldStart);	
	this.CopyDateFld(this.dateRangeFldEnd, this.dateFldEnd);	
}
RecurrencePatternEventHooks.prototype.DateToDateRange = FnDateToDateRange
function FnDateToDateRange()
{
	this.CopyDateFld(this.dateFldStart, this.dateRangeFldStart);	
	this.CopyDateFld(this.dateFldEnd, this.dateRangeFldEnd);	
}
RecurrencePatternEventHooks.prototype.ToggleDisplay = RecurrencePatternEventHooksToggleDisplay;
function RecurrencePatternEventHooksToggleDisplay(value, fForce)
{
	if (!fForce && this.value == value)
		return;
	if (this.value >= 0 && this.rgStPatternTypes[this.value] != "")
		DisplayOff(this.divtags[this.rgStPatternTypes[this.value]]);
	var oldValue = this.value;
	this.value = value;
	if (this.value >= 0 && this.rgStPatternTypes[this.value] != "")
		DisplayOn(this.divtags[this.rgStPatternTypes[this.value]]);
	if (this.value == 0) 
	{
		this.DateRangeToDate();
		DisplayOn(this.stStartDateSpan);
		DisplayOn(this.stEndDateSpan);
		DisplayOff(this.stRecurDateRangeDiv);
		DisplayOff(this.stRecurPatternTextDiv);
	}
	else
	{
		if (fForce || oldValue == 0)
		{
			this.DateToDateRange();
			if (this.recurFld.endRangeOptionFld
				&& this.recurFld.endRangeOptionFld.FValidate())
			{
				var endRangeOptionFldPost = this.frm.FieldPost(this.recurFld.endRangeOptionFld);
				if (!endRangeOptionFldPost
					|| endRangeOptionFldPost.value != "2")
				{
					var destDateFld = this.frm.FieldSubPart(this.dateRangeFldEnd, "Date");
					destDateFld.value = "";
					var disableSave = destDateFld.disabled;
					destDateFld.disabled = false;
					this.dateRangeFldEnd.FValidate();
					destDateFld.disabled = disableSave;
				}
			}
		}
		DisplayOff(this.stStartDateSpan);
		DisplayOff(this.stEndDateSpan);
		DisplayOn(this.stRecurDateRangeDiv);
		DisplayOn(this.stRecurPatternTextDiv);
	}
}
RecurrencePatternEventHooks.prototype.PostProcess = DateFieldPostProcess;
function DateFieldPostProcess()
{
	if (this.value >= 2)
		this.DateRangeToDate();
}
RecurrencePatternEventHooks.prototype.CopyDateFld= FnCopyDateFld
function FnCopyDateFld(srcFld, destFld)
{
	if (srcFld && destFld)
	{
		var srcFldPost = srcFld.frm.FieldPost(srcFld);
		var destFldPost = destFld.frm.FieldPost(destFld);
		if (srcFldPost && destFldPost)
		{
			var srcDateFld = this.frm.FieldSubPart(srcFld, "Date");
			var date = this.frm.dopt.ParseLocaleDate(srcDateFld.value, this.recurFld.caltype);
			if (!isNaN(date))
			{
				var destDateFld = this.frm.FieldSubPart(destFld, "Date");
				destDateFld.value = srcDateFld.value;
				var disableSave = destDateFld.disabled;
				destDateFld.disabled = false;
				destFld.FValidate();
				destDateFld.disabled = disableSave;
			}
		}
	}
}
function TelephonePattern(frm, stName, stDisplayName, stValue)
{
	this.frm = frm;
	this.stName = stName;
	if (!stValue)
		stValue = "";
	this.stValue = TrimWhiteSpaces(stValue);
	this.fIncludeExtension = false;
	this.fIncludePIN       = false;
	var L_CountryCodeValue_Text     = "";
	var L_NationalCodeValue_Text    = "";
	var L_NumberValue_Text          = "";
	var L_NumberExtensionValue_Text = "";
	var L_PINValue_Text             = "";
	if (this.stValue.length)
		this.ParseFieldValues();	
	else
	{								
		this.countryCode     = L_CountryCodeValue_Text;
		this.nationalCode    = L_NationalCodeValue_Text;
		this.number          = L_NumberValue_Text;
		this.numberExtension = L_NumberExtensionValue_Text;
		this.pin             = L_PINValue_Text;
	}
	this.countryCodeLen     = 4;
	this.nationalCodeLen    = 4;
	this.numberLen          = 9;
	this.numberExtensionLen = 9;
	this.PINLen             = 6;
	this.stPrefix = "TelephonePattern#";
}
TelephonePattern.prototype.ParseFieldValues = FnParseFieldValues
function FnParseFieldValues()
{
	var fldNames = new Array("countryCode",
							"nationalCode",
							"number",
							"numberExtension",
							"pin");		
	var i = 0;
	var escape = ";#";
	var iDelim1;
	var iDelim2;
	iDelim1 = this.stValue.indexOf(escape, 0);
	if (iDelim1 != -1)
	{
		for (i=0; i < 5; i++)
		{
			iDelim1 += 2;
			iDelim2 = this.stValue.indexOf(escape, iDelim1);
			if (iDelim2 != -1)
			{
				var stValue = this.stValue.substr(iDelim1, iDelim2-iDelim1);
				stValue = TrimWhiteSpaces(stValue);
				eval("this."+fldNames[i]+"=stValue");
			}
			else
				break;
			iDelim1 = iDelim2;
		}
	}
	if (i != 5)
	{
		this.countryCode = "";
		this.nationalCode = "";
		this.number = stValue;
		this.numberExtension = "";
		this.pin = "";
	}		
}
TelephonePattern.prototype.BuildUI = TelephonePatternBuildUI;
function TelephonePatternBuildUI()
{
	var st = "<nobr>";
	var L_Telephone_Text = "^1 ( ^2) ^3";
	var L_ExtFormat_Text = ", ext( ^4)";
	var L_PINFormat_Text = ", PIN( ^5)";
	var L_TelephoneCountryCode_Text = "";
	var L_TelephoneNationalCode_Text = "\u533a\u53f7";
	var L_TelephoneNumber_Text = "\u7535\u8bdd\u53f7\u7801";
	var L_TelephoneNumberExtension_Text = "";
	var L_TelephonePIN_Text = "";
	var fld = new TextField(this.frm,
						this.stPrefix+"countryCode:"+this.stName,
						L_TelephoneCountryCode_Text,
						this.countryCode);
	fld.cchMaxLength = this.countryCodeLen;
	if (this.countryCode.length > fld.cchMaxLength)
		fld.cchMaxLength = this.countryCode.length;
	var cntrl1 = fld.stBuildUI();
	fld = new TextField(this.frm,
						this.stPrefix+"nationalCode:"+this.stName,
						L_TelephoneNationalCode_Text,
						this.nationalCode);
	fld.fRequired = this.fRequired;
	fld.cchMaxLength = this.nationalCodeLen;
	if (this.nationalCode.length > fld.cchMaxLength)
		fld.cchMaxLength = this.nationalCode.length;
	var cntrl2 = fld.stBuildUI();
	fld = new TextField(this.frm,
						this.stPrefix+"number:"+this.stName,
						L_TelephoneNumber_Text,
						this.number);
	fld.fRequired = this.fRequired;
	fld.cchMaxLength = this.numberLen;
	if (this.number.length > fld.cchMaxLength)
		fld.cchMaxLength = this.number.length;
	var cntrl3 = fld.stBuildUI();
	var cntrl4;
	if (this.fIncludeExtension || this.numberExtension.length > 0)
	{
		L_Telephone_Text += L_ExtFormat_Text;
		fld = new TextField(this.frm,
							this.stPrefix+"numberExtension:"+this.stName,
							L_TelephoneNumberExtension_Text,
							this.numberExtension);
		fld.cchMaxLength = this.numberExtensionLen;
		if (this.numberExtension.length > fld.cchMaxLength)
			fld.cchMaxLength = this.numberExtension.length;
		cntrl4 = fld.stBuildUI();
	}
	else
		cntrl4 = 0;
	var cntrl5;
	if (this.fIncludePIN || this.pin.length > 0)
	{
		L_Telephone_Text += L_PINFormat_Text;
		fld = new TextField(this.frm,
							this.stPrefix+"pin:"+this.stName,
							L_TelephonePIN_Text,
							this.pin);
		fld.cchMaxLength = this.PINLen;
		if (this.PIN.length > fld.cchMaxLength)
			fld.cchMaxLength = this.PIN.length;
		cntrl5 = fld.stBuildUI();
	}
	else
		cntrl5 = 0;
	st += StBuildParam(L_Telephone_Text, cntrl1, cntrl2, cntrl3, cntrl4, cntrl5);
	st += "</nobr>";
	document.write(st);
}
function StBuildParam(stPattern)
{
	var re;
	var i;
	for (i = 1; i < StBuildParam.arguments.length; i++)
		{
		re = new RegExp("\\^" + i);
		stPattern = stPattern.replace(re, StBuildParam.arguments[i]);
		}
	return stPattern;
}
function WindowPosition(elt)
{
	var pos = new Object;
	pos.x = 0;
	pos.y = 0;
	while (elt.offsetParent != null && elt.id.search('WebPart') != 0)
		{
		pos.x += elt.offsetLeft;
		pos.y += elt.offsetTop;
		elt = elt.offsetParent;
		}
	return pos;
}
function StInsertAt(st, ich, stInsert)
{
	return st.substr(0, ich) + stInsert + st.substr(ich);
}
function  WMultiple(w, wMult)
{
	return Math.round(w/wMult)*wMult;
}
function St2Digits(w)
{
	var st = "";
	if (w < 10)
		st += "0";
	st += w;
	return st;
}
function FBlankString(st)
{
	st = st.toString();
	st = st.replace(/\s/g, "");
	return (st == "");
}
function StURL(stURL, stText)
{
	if (FBlankString(stURL))
		return STSHtmlEncode(stText);
	return "<A HREF=" + StAttrQuote(stURL) + ">" + STSHtmlEncode(stText) + "</A>";
}
function FrmLocalFieldName(stName)
{
	return FrmStFieldNameFactory(stName, "Local");
}
function fDataLoseConvert(fromType, toType)
{
	switch (fromType)
	{
		case "Text":
		case "Choice":
			switch (toType)
			{
				case "Number":
				case "Currency":
				case "DateTime":
					return true;
			}
			break;
		case "Note":
			switch (toType)
			{
				case "Text":
				case "Choice":
				case "MultiChoice":
				case "Number":
				case "Currency":
				case "DateTime":
					return true;
			}
			break;
		case "MultiChoice":
			switch (toType)
			{
				case "Text":
				case "Note":
				case "Choice":
				case "Number":
				case "Currency":
				case "DateTime":
					return true;
			}
			break;
		case "DateTime":
			switch (toType)
			{
				case "Text":
				case "Note":
				case "Choice":
				case "MultiChoice":
					return true;
			}
			break;
		case "Number":
		case "Currency":
			switch (toType)
			{
				case "Text":
				case "Note":
				case "Choice":
				case "MultiChoice":
				case "Boolean":
					return true;
			}
			break;
	}
	return false;
}
function MsFloorTime(date, ms, exclusive)
{
	var time = date.getTime();
	if (exclusive)
		time = time - 1;
	time = ms * Math.floor(time / ms);
	return time;
}
function Calendar(yr, mon, dopt, stObject)
{
	if (!dopt)
		dopt = new DateOptions;
	this.dopt = dopt;
	var day=1;
	if (yr == null || mon == null)
		{
		var stCalDate = StURLGetVar("CalendarDate");
		if (stCalDate != "")
			{
			yr = stCalDate.substr(0, 4) - 0;
			var idxM2D = stCalDate.indexOf("-",5);
			if (idxM2D == -1) 
				{
				mon = stCalDate.substr(5) - 1;
				}
			else
				{
				mon = stCalDate.substr(5, idxM2D-5) - 1;
				day = stCalDate.substr(idxM2D+1);
				}
			}
		if (stCalDate == "" || isNaN(dopt.DateYMD(yr, mon, 1)))
			{
			var dateToday = this.dopt.Today();
			yr = dateToday.getUTCFullYear();
			mon = dateToday.getUTCMonth();
			day = dateToday.getUTCDate();
			}
		}
	var stCalPeriod = StURLGetVar("CalendarPeriod");
	if (stCalPeriod == "week")
	{
		this.period = "week";
		this.iperiod = 1;
	}	
	else if (stCalPeriod == "day")
	{
		this.period = "vday";
		this.iperiod = 2;
	}
	else if (stCalPeriod == "vday")
	{
		this.period = "vday";
		this.iperiod = 2;		
	}
	else if (stCalPeriod == "month")
	{
		this.period = "month";
		this.iperiod = 0;		
	}
	else
	{
		this.period = dopt.CalendarPeriod;
		if (this.period == "week")
			this.iperiod = 1;		
		else if (this.period == "day")
			this.iperiod = 2;		
		else if (this.period == "vday")
			this.iperiod = 2;		
		else 
			this.iperiod = 0;		
	}
	this.SetDate(yr, mon, day);
	if (this.iperiod == 0 )
	{
		this.cchanMin = 4;
		this.cchanMax = 4;
	}
	else if (this.iperiod == 1 )
	{
		this.cchanMin = 20;
		this.cchanMax = 20;
	}
	else 
	{
		this.cchanMin = 3;
		this.cchanMax = 100; 
	}
	this.ievtMax = 0;
	this.rgEvt = new Array;
	this.fUseDHTML = (browseris.ie && browseris.verIEFull > 4.0 && browseris.win32)
					 || browseris.nav6up;
	this.fDatePicker = false;
	this.dateDP = null;
	if (!stObject)
		stObject = "cal";
	this.stObject = stObject;
}
Calendar.msMinute = 1000*60;
Calendar.msHour = Calendar.msMinute * 60;
Calendar.msDay = Calendar.msHour * 24;
Calendar.msWeek = Calendar.msDay * 7;
var L_rgDOW0_Text = "\u5468\u65e5";
var L_rgDOW1_Text = "\u5468\u4e00";
var L_rgDOW2_Text = "\u5468\u4e8c";
var L_rgDOW3_Text = "\u5468\u4e09";
var L_rgDOW4_Text = "\u5468\u56db";
var L_rgDOW5_Text = "\u5468\u4e94";
var L_rgDOW6_Text = "\u5468\u516d";
Calendar.rgDOW = new Array(L_rgDOW0_Text, L_rgDOW1_Text, L_rgDOW2_Text,
						   L_rgDOW3_Text, L_rgDOW4_Text, L_rgDOW5_Text,
						   L_rgDOW6_Text);
var L_rgDOWLong0_Text = "\u661f\u671f\u65e5";
var L_rgDOWLong1_Text = "\u661f\u671f\u4e00";
var L_rgDOWLong2_Text = "\u661f\u671f\u4e8c";
var L_rgDOWLong3_Text = "\u661f\u671f\u4e09";
var L_rgDOWLong4_Text = "\u661f\u671f\u56db";
var L_rgDOWLong5_Text = "\u661f\u671f\u4e94";
var L_rgDOWLong6_Text = "\u661f\u671f\u516d";
Calendar.rgDOWLong = new Array(L_rgDOWLong0_Text, L_rgDOWLong1_Text, L_rgDOWLong2_Text,
						   L_rgDOWLong3_Text, L_rgDOWLong4_Text, L_rgDOWLong5_Text,
						   L_rgDOWLong6_Text);
var L_rgDOWDP0_Text = "\u65e5";
var L_rgDOWDP1_Text = "\u4e00";
var L_rgDOWDP2_Text = "\u4e8c";
var L_rgDOWDP3_Text = "\u4e09";
var L_rgDOWDP4_Text = "\u56db";
var L_rgDOWDP5_Text = "\u4e94";
var L_rgDOWDP6_Text = "\u516d";
Calendar.rgDOWDP = new Array(L_rgDOWDP0_Text, L_rgDOWDP1_Text, L_rgDOWDP2_Text,
							 L_rgDOWDP3_Text, L_rgDOWDP4_Text, L_rgDOWDP5_Text,
							 L_rgDOWDP6_Text);
var L_rgMonths0_Text = "1 \u6708";
var L_rgMonths1_Text = "2 \u6708";
var L_rgMonths2_Text = "3 \u6708";
var L_rgMonths3_Text = "4 \u6708";
var L_rgMonths4_Text = "5 \u6708";
var L_rgMonths5_Text = "6 \u6708";
var L_rgMonths6_Text = "7 \u6708";
var L_rgMonths7_Text = "8 \u6708";
var L_rgMonths8_Text = "9 \u6708";
var L_rgMonths9_Text = "10 \u6708";
var L_rgMonths10_Text = "11 \u6708";
var L_rgMonths11_Text = "12 \u6708";
Calendar.rgMonths = new Array(L_rgMonths0_Text, L_rgMonths1_Text,
							  L_rgMonths2_Text, L_rgMonths3_Text,
							  L_rgMonths4_Text, L_rgMonths5_Text,
							  L_rgMonths6_Text, L_rgMonths7_Text,
							  L_rgMonths8_Text, L_rgMonths9_Text,
							  L_rgMonths10_Text, L_rgMonths11_Text);
var L_MYDATE_Text = "^2 \u5e74 ^1"; 
var L_YMDATE_Text = "^1 \u5e74 ^2"; 
var L_MDYDATE_Text = "^3 \u5e74 ^1 ^2 \u65e5"; 
var L_DMYDATE_Text = "^3 \u5e74 ^1 ^2 \u65e5"; 
var L_YMDDATE_Text = "^1 \u5e74 ^2 ^3 \u65e5"; 
var L_MDYDATESameYear_Text = "^2 ^1 \u65e5"; 
var L_DMYDATESameYear_Text = "^2 ^1 \u65e5"; 
var L_YMDDATESameYear_Text = "^1 \u5e74 ^2 ^3 \u65e5"; 
var L_DATE1DATE2_Text = "^1 - ^2"; 
var L_MDY_DOW_DATE_Text = "^4 ^3 \u5e74 ^1 ^2 \u65e5"; 
var L_DMY_DOW_DATE_Text = "^4 ^3 \u5e74 ^1 ^2 \u65e5"; 
var L_YMD_DOW_DATE_Text = "^4 ^1 \u5e74 ^2 ^3 \u65e5"; 
Calendar.prototype.StMonthYear = CalStMonthYear;
function CalStMonthYear()
{
	var st = "";
	if (this.iperiod != 0 )
		st += '<SPAN style="cursor:hand;" onmouseover="HighlightText(this, \'red\');" onmouseout="HighlightText(this, \'\');"' + StClickEvent(this.stObject + '.MoveMonth(0)') + '>';
	var stFormat = "";
	var param1 = "";
	var param2 = "";
	switch (this.dopt.stDateOrder)
		{
	case "MDY":
	case "DMY":
		param1 = Calendar.rgMonths[this.mon];
		param2 = this.yr;
		stFormat = L_MYDATE_Text;
		break;
	case "YMD":
		param1 = this.yr;
		param2 = Calendar.rgMonths[this.mon];
		stFormat = L_YMDATE_Text;
		break;
		}
	st += StBuildParam(stFormat, param1, param2);
	if (this.iperiod != 0 )
		st += "</SPAN>";
	return st;
}
Calendar.prototype.StDaySpanMonthYear = CalDaySpanMonthYear;
function CalDaySpanMonthYear()
{
	var st = "";
	var stStart = "";
	var stEnd = "";
	var stFormat1 = "";
	var stFormat2 = "";
	var param1 = "";
	var param2 = "";
	var param3 = "";
	var param4 = "";
	var param5 = "";
	var param6 = "";
	if (this.iperiod != 0 )
		st += '<SPAN style="cursor:hand;" onmouseover="HighlightText(this, \'red\');" onmouseout="HighlightText(this, \'\');"' + StClickEvent(this.stObject + '.MoveMonth(0)') + '>';
	var bDiffYears = this.dateStart.getUTCFullYear() != this.dateEnd.getUTCFullYear();	
	switch (this.dopt.stDateOrder)
		{
	case "MDY":
		param1 = Calendar.rgMonths[this.dateStart.getUTCMonth()];
		param2 = this.dateStart.getUTCDate();
		param3 = this.dateStart.getUTCFullYear();
		if (bDiffYears)
			stFormat1 = L_MDYDATE_Text;
		else
			stFormat1 = L_MDYDATESameYear_Text;
		param4 = Calendar.rgMonths[this.dateEnd.getUTCMonth()];
		param5 = this.dateEnd.getUTCDate();
		param6 = this.dateEnd.getUTCFullYear();
		stFormat2 = L_MDYDATE_Text;
		break;
	case "DMY":
		param1 = this.dateStart.getUTCDate();
		param2 = Calendar.rgMonths[this.dateStart.getUTCMonth()];
		param3 = this.dateStart.getUTCFullYear();
		if (bDiffYears)
			stFormat1 = L_DMYDATE_Text;
		else
			stFormat1 = L_DMYDATESameYear_Text;
		param4 = this.dateEnd.getUTCDate();
		param5 = Calendar.rgMonths[this.dateEnd.getUTCMonth()];
		param6 = this.dateEnd.getUTCFullYear();
		stFormat2 = L_DMYDATE_Text;
		break;
	case "YMD":
		param1 = this.dateStart.getUTCFullYear();
		param2 = Calendar.rgMonths[this.dateStart.getUTCMonth()];
		param3 = this.dateStart.getUTCDate();
		if (bDiffYears)
			stFormat1 = L_YMDDATE_Text;
		else
			stFormat1 = L_YMDDATESameYear_Text;
		param4 = this.dateEnd.getUTCFullYear();
		param5 = Calendar.rgMonths[this.dateEnd.getUTCMonth()];
		param6 = this.dateEnd.getUTCDate();
		stFormat2 = L_YMDDATE_Text;
		break;
		}
	stStart = StBuildParam(stFormat1, param1, param2, param3);
	stEnd = StBuildParam(stFormat2, param4, param5, param6);
	st += StBuildParam(L_DATE1DATE2_Text, stStart, stEnd); 
	if (this.iperiod != 0 )
		st += "</SPAN>";
	return st;
}
Calendar.prototype.StDayMonthYear = CalStDayMonthYear;
function CalStDayMonthYear()
{
	var st = "";
	st += '<SPAN style="cursor:hand;" onmouseover="HighlightText(this, \'red\');" onmouseout="HighlightText(this, \'\');"' + StClickEvent(this.stObject + '.MoveMonth(0)') + '>';
	var stFormat = "";
	var param1 = "";
	var param2 = "";
	var param3 = "";
	var param4 = Calendar.rgDOWLong[this.dow];
	switch (this.dopt.stDateOrder)
		{
	case "MDY":
		param1 = Calendar.rgMonths[this.mon];
		param2 = this.day;
		param3 = this.yr;
		stFormat = L_MDY_DOW_DATE_Text;
		break;
	case "DMY":
		param1 = this.day;
		param2 = Calendar.rgMonths[this.mon];
		param3 = this.yr;
		stFormat = L_DMY_DOW_DATE_Text;
		break;
	case "YMD":
		param1 = this.yr;
		param2 = Calendar.rgMonths[this.mon];
		param3 = this.day;
		stFormat = L_YMD_DOW_DATE_Text;
		break;
		}
	st += StBuildParam(stFormat, param1, param2, param3, param4);
	st += "</SPAN>";
	return st;
}
function alertDate(st, date)
{
	alert(st + ": yr=" + date.getUTCFullYear() + " mon=" + (date.getUTCMonth()+1) + " day=" + date.getUTCDate());
}
Calendar.prototype.SetDate = CalSetDate;
function CalSetDate(yr, mon, day)
{
	var date = new Date(Date.UTC(yr, mon, day));
	this.dateStart = new Date(date.getTime());
	this.dateEnd = new Date(date.getTime());
	this.givenDate = new Date(date.getTime());
	if (this.iperiod == 0  )
		{
		this.dateStart.setUTCDate(1);
		this.dateEnd.setTime(Date.UTC(yr, mon+1, 0));
		}
	var irw = 0;
	if (this.iperiod != 2 )
		{
		this.dateStart.setUTCDate(this.dateStart.getUTCDate() - (this.dateStart.getUTCDay() -this.dopt.dow+7)%7);
		irw = this.IrwFromDate(this.dateEnd);
		this.dateEnd.setUTCDate(this.dateEnd.getUTCDate() + irw * 7 - 1);
		}
	this.irwMax = irw+1;
	if (this.iperiod == 1 )
		{
		this.dateEnd.setTime(this.dateStart.getTime() + 6 * Calendar.msDay);
		date = new Date(this.dateStart.getTime() + 3 * Calendar.msDay);
		}
	else if (this.iperiod == 2 )
		{
		this.dateTodayEnd = new Date(this.dateStart.getTime() + Calendar.msDay - 1);		
		}
	this.day = date.getUTCDate();
	this.mon = date.getUTCMonth();
	this.yr = date.getUTCFullYear();
	this.dow = date.getUTCDay();
}
Calendar.prototype.DayStyle = CalDayStyle;
function CalDayStyle(dateCur, fBottom, fTop, fWeekly)
{
	var st;
	var dateToday = this.dopt.Today();
	if (dateCur.getTime() == dateToday.getTime())
		{
			if (fBottom)
				st = ' style="border-color:\'#FFD275\'; border-bottom-style:solid; border-left-style:solid; border-right-style:solid; border-bottom-width:2pt; border-left-width:2pt; border-right-width:2pt" ';
			else if (fTop)
				st = ' style="border-color:\'#FFD275\'; border-top-style:solid; border-left-style:solid; border-right-style:solid; border-top-width:2pt; border-left-width:2pt; border-right-width:2pt" ';
			else
				st = ' style="border-color:\'#FFD275\'; border-left-style:solid; border-right-style:solid; border-left-width:2pt; border-right-width:2pt" ';
		}
	else if (!fWeekly && dateCur.getUTCMonth() != this.mon)
		{
			st = ' BGCOLOR="#e6e6e6"';
		}
	else
		st = "";
	return st;
}
Calendar.prototype.AddFullEvent = CalAddFullEvent;
function CalAddFullEvent(stDateStart, stDateEnd, stLocation, stDesc, stTitle, stURL, rgIcons)
{
	var dateStart;
	var dateEnd;
	if (stDateStart == "")
		return;
	dateStart = DateOptions.ParseISODate(stDateStart);
	if (stDateEnd == "")
		{
		dateEnd = new Date(dateStart.getTime());
		}
	else
		{
		dateEnd = DateOptions.ParseISODate(stDateEnd);
		}
	if (dateEnd < dateStart)
		dateEnd = new Date(dateStart.getTime());
	var displayDateStart = new Date(dateStart.getTime());
	var displayDateEnd = new Date(dateEnd.getTime());
	if (this.iperiod == 2 )
	{
		if (dateStart > this.dateTodayEnd || dateEnd < this.dateStart)
			return; 
		if (displayDateStart < this.dateStart)
			displayDateStart = this.dateStart;
		var minDisplay = Calendar.msHour/3;	
		if (dateEnd.getTime() < dateStart.getTime()+minDisplay)
			displayDateEnd = new Date(dateStart.getTime()+minDisplay);
	}
	stURL += "&Source=" + escapeProperly(window.location.href);
	var evt = new CalEvent(displayDateStart, displayDateEnd, dateStart, dateEnd, stLocation, stDesc, stTitle, stURL, rgIcons);
	this.AddEvent(evt);
}
Calendar.prototype.AddEvent = CalAddEvent;
function CalAddEvent(evt)
{
	this.rgEvt[this.ievtMax++] = evt;
}
Calendar.prototype.AssignChannels = CalAssignChannels;
function CalAssignChannels()
{
	var ievt;
	this.mpSpan = new Object;       
	this.mpIchan = new Object;      
	this.mpEvents = new Object;     
	var fAllDaySeparate = false;
	var dateTodayStart;
	var dateTodayEnd;
	if (this.iperiod == 2 )
		{   
		fAllDaySeparate = true;
		dateTodayStart = this.dateStart;
		dateTodayEnd = this.dateTodayEnd;
		this.mpNoTimeEvents = new Array;
		this.mpAllDayEvents = new Array;
		var dailyStart = this.dopt.WorkDayStartHour - this.dopt.DailyStartHourDelta;
		var dailyEnd = this.dopt.WorkDayEndHour + this.dopt.DailyEndHourDelta;
		if (dailyStart < 0) dailyStart = 0;
		if (dailyEnd > 24) dailyEnd = 24;
		this.minQuarterStart = 4*dailyStart;
		this.maxQuarterEnd = 4*dailyEnd-1;
		for (ievt=0; ievt < this.rgEvt.length; ievt++)
			{
			evt = this.rgEvt[ievt];
			if ((evt.actualDateStart > dateTodayEnd || (evt.actualDateEnd-1) < dateTodayStart)
				|| (evt.actualDateStart <= dateTodayStart && evt.actualDateEnd >= dateTodayEnd))
				continue;
			irwMin = this.IrwFromDate(evt.dateStart);
			if (irwMin < 0)
				irwMin = 0;
			irwMax = this.IrwFromDate(evt.dateEnd);
			if (irwMax > this.irwMax)
				irwMax = this.irwMax;
			if (irwMin < this.irwMax && irwMax >= 0)
				{
				for (irw = irwMin; irw <= irwMax; irw++)
					{
					var date = new Date;
					this.SetDateFromGrid(date, irw, 0);
					if (date < dateTodayStart || date >= dateTodayEnd)
						continue;
					var quarterRow = date.getTime()/(Calendar.msHour/4);
					var quarterStart = MsFloorTime(evt.dateStart, Calendar.msHour/4, 0)/(Calendar.msHour/4) - quarterRow;
					var quarterEnd = MsFloorTime(evt.dateEnd, Calendar.msHour/4, 1)/(Calendar.msHour/4) - quarterRow + 1;
					if (quarterEnd < quarterStart)
						quarterEnd = quarterStart;
					if (quarterStart < this.minQuarterStart)
						this.minQuarterStart = quarterStart;
					if (quarterEnd > this.maxQuarterEnd)
						this.maxQuarterEnd = quarterEnd;
					if (quarterStart > 0 && 95 - quarterStart < 2)
						this.FVdayOverflow = true;
					}
				}
			}
			this.minQuarterStart = Math.floor(this.minQuarterStart/4)*4;
			if (this.minQuarterStart < 0)
				this.minQuarterStart = 0;
			if (this.maxQuarterEnd > 95)	
				this.maxQuarterEnd = 95;
			else
				this.maxQuarterEnd = 4 * (Math.floor(this.maxQuarterEnd/4) + 1) - 1;
		}
	if (this.iperiod <= 1 )	
		this.rgEvt.sort(CalEvtSort);
	var todayMiliSec = this.dateStart;
	todayMiliSec.setUTCHours(0,0,0,0);
	todayMiliSec = todayMiliSec.getTime();
	for (ievt=0; ievt < this.rgEvt.length; ievt++)
		{
		evt = this.rgEvt[ievt];
		if (fAllDaySeparate)
		{
			if (evt.actualDateStart.getTime() == todayMiliSec
				&& evt.actualDateEnd.getTime() == todayMiliSec)
				{
					this.mpNoTimeEvents[this.mpNoTimeEvents.length] = evt;
					continue;
				}
			if (evt.actualDateStart <= dateTodayStart
				&& evt.actualDateEnd >= dateTodayEnd)
				{
					this.mpAllDayEvents[this.mpAllDayEvents.length] = evt;
					continue;
				}
		}
		irwMin = this.IrwFromDate(evt.dateStart);
		if (irwMin < 0)
			irwMin = 0;
		irwMax = this.IrwFromDate(evt.dateEnd);
		if (irwMax > this.irwMax)
			irwMax = this.irwMax;
		if (irwMin < this.irwMax && irwMax >= 0)
			{
			for (irw = irwMin; irw <= irwMax; irw++)
				{
				this.PlaceEventInRow(evt, irw);
				}
			}
		}
}
function CalEvtSort(e1, e2)
{
	if (e1.multiDay ^ e2.multiDay)
	{
		if (e1.multiDay)
			return -1;
		else
			return 1;
	}
	else if (e1.multiDay)
	{
		var d1 = e1.dateEnd - e1.dateStart;
		var d2 = e2.dateEnd - e2.dateStart;
		if (d2 < d1)
			return -1;
		else if (d2 > d1)
			return 1;
		else
			return 0;
	}
	else
	{
		if (e1.dateStart < e2.dateStart)
			return -1;
		else if (e1.dateStart > e2.dateStart)
			return 1;
		else
			return 0;
	}
}
Calendar.prototype.PlaceEventInRow = CalPlaceEventInRow;
function CalPlaceEventInRow(evt, irw)
{
	var span;
	var date = new Date;
	this.SetDateFromGrid(date, irw, 0);
	if (this.iperiod == 2 )
		{
		if (irw != 0)	
			return;
		var quarterRow = date.getTime()/(Calendar.msHour/4);
		var quarterStart = MsFloorTime(evt.dateStart, Calendar.msHour/4, 0)/(Calendar.msHour/4) - quarterRow;
		var quarterEnd = MsFloorTime(evt.dateEnd, Calendar.msHour/4, 1)/(Calendar.msHour/4) - quarterRow;
		if (quarterEnd < quarterStart)
			quarterEnd = quarterStart;
		var workdayStart;
		var workdayEnd;
		if (this.iperiod == 2 )
			{
			workdayStart = this.minQuarterStart;
			workdayEnd = this.maxQuarterEnd;
			}
		else
			{
			workdayStart = 4*this.dopt.WorkDayStartHour;
			workdayEnd = 4*this.dopt.WorkDayEndHour-1;
			}
		if (quarterEnd >= workdayStart && quarterStart <= workdayEnd)
			{
			if (this.FVdayOverflow)
				workdayEnd = 99;
			quarterStart = Math.max(quarterStart, workdayStart);
			quarterEnd = Math.min(quarterEnd, workdayEnd);
			ichan = this.IchanNext(irw, quarterStart, quarterEnd);
			new Span(this, irw, quarterStart, quarterEnd, ichan, evt);
			}
		}
	else
		{
		var dayRow;
		var dayStart;
		var dayEnd;
		dayRow = date.getTime()/Calendar.msDay;
		dayStart = MsFloorTime(evt.dateStart, Calendar.msDay, 0)/Calendar.msDay - dayRow;
		dayEnd = MsFloorTime(evt.dateEnd, Calendar.msDay, 1)/Calendar.msDay - dayRow;
		if (dayEnd < dayStart
			|| (evt.actualDateEnd.getTime()-evt.actualDateStart.getTime()) < Calendar.msDay)
			{
			dayEnd = dayStart;
			}
		if (dayEnd >= 0 && dayStart <= 6)
			{
			dayStart = Math.max(dayStart, 0);
			dayEnd = Math.min(dayEnd, 6);
			ichan = this.IchanNext(irw, dayStart, dayEnd);
			new Span(this, irw, dayStart, dayEnd, ichan, evt);
			}
		}
}
function Span(cal, irw, start, end, ichan, evt)
{
	this.evt = evt;
	this.cbucket = end - start + 1;
	if (cal.iperiod == 2 )
		{   
		evt.ichan = ichan;
		evt.ihour = start;
		var maxEnd = cal.maxQuarterEnd;
		if (maxEnd == 95)	
			maxEnd = 99;
		evt.rowspan = Math.min(this.cbucket, 1 + maxEnd - start);
		}
	cal.mpSpan[irw + "." + start + "." + ichan] = this;
	for (bucket = start; bucket <= end; bucket++)
		{
		cal.mpIchan[irw + "." + bucket] = ichan + 1;
		var rgevt = cal.mpEvents[irw + "." + bucket];
		if (rgevt == null)
			{
			rgevt = new Array;
			cal.mpEvents[irw + "." + bucket] = rgevt;
			}
		rgevt[rgevt.length] = evt;
		}
}
Calendar.prototype.IchanNext = CalIchanNext;
function CalIchanNext(irw, start, end)
{
	var bucket;
	var ichan = 0;
	for (bucket = start; bucket <= end; bucket++)
		{
		if (this.mpIchan[irw + "." + bucket] != null)
			ichan = Math.max(ichan, this.mpIchan[irw + "." + bucket]);
		}
	return ichan;
}
Calendar.prototype.IrwFromDate = CalIrwFromDate;
function CalIrwFromDate(date)
{
	var irw;
	irw = Math.floor((date.getTime() - this.dateStart.getTime())/Calendar.msWeek);
	return irw;
}
Calendar.prototype.BuildUI = CalBuildUI;
function CalBuildUI()
{
	var st = this.StBuild();
	document.write(st);
}
Calendar.prototype.StBuild = CalStBuild;
function CalStBuild()
{
	this.AssignChannels();
	if (this.fDatePicker)
		return this.StBuildPicker();
	if (!this.fUseDHTML)
		return this.StDownlevelBuild();
	return this.StBuildDHTML();
}
Calendar.prototype.StBuildDHTML = CalStBuildDHTML;
function CalStBuildDHTML()
{
	var st;
	var span;
	var dateCur = new Date;
	var irw;
	var iday;
	var ichan;
	var cchan;
	var ihour;
	var iHourStart;
	var iHourEnd;
	var iGrayStart;	
	var iGrayEnd;	
	iHourStart = iGrayStart = 4*this.dopt.WorkDayStartHour;
	iHourEnd = 4*this.dopt.WorkDayEndHour;
	iGrayEnd = iHourEnd - 1;
	if (this.iperiod == 2 )
		{
		iHourStart = this.minQuarterStart;
		iHourEnd = this.maxQuarterEnd+1;
		if (iHourEnd == 96 && this.FVdayOverflow)
			iHourEnd = 100;
		}
	var stTDHigh = '<th style="cursor:hand;" onmouseover="HighlightText(this, \'red\');" onmouseout="HighlightText(this, \'\');" ';
	if (this.iperiod == 2 )
		{
		cchan = this.IchanNext(0, iHourStart, iHourEnd);
		var cNoTime = this.mpNoTimeEvents.length;
		var cAllDay = this.mpAllDayEvents.length;
		cchan = Math.max(cchan, this.cchanMin);
		if (this.cchanMax > 0)
			cchan = Math.min(cchan, this.cchanMax);
		st = "<table width=100% class=ms-cal cellpadding=0 cellspacing=0>";
		st += '<tr>' + stTDHigh + StClickEvent(this.stObject + '.MoveDate(-1)') + ' class=ms-calhead style="cursor:hand;" width=8%>&lt;</th><th width=84% class=ms-calhead nowrap>' +
			this.StDayMonthYear() +
			'</th>' + stTDHigh + StClickEvent(this.stObject + '.MoveDate(1)') + ' class=ms-calhead style="cursor:hand;" width=8%>&gt;</th></tr>';
		if (cNoTime > 0)
			{
			st += "</table><table width=100% class=ms-cal cellpadding=0 cellspacing=0>\r";
			st += "<tr height=0><td width="+(this.dopt.AllDayWidth+8)+"pt/><td/></tr>\r";
			st += "<tr><td class=ms-CalAllDay rowspan="+(cNoTime+1)+"></td><td width=1%/></tr>";
			for (i=0; i < cNoTime; i++)
				{
					evt = this.mpNoTimeEvents[i];
					st += "<tr><td class=ms-Vapptsingle style='border-top:1px solid black; border-left:1px solid black; border-bottom:1px solid black; border-right:1px solid black;' ";
					st += " TITLE=" + StAttrQuote(evt.StTip(this.dopt)) + "><nobr>"+
						StRenderVDayEvt(evt, this.dopt, 2) + "</nobr></td></tr>\r";
				}
			}
		if (cAllDay > 0)
			{
			st += "</table><table width=100% class=ms-cal cellpadding=0 cellspacing=0>\r";
			st += "<tr height=0><td width="+(this.dopt.AllDayWidth+8)+"pt/><td/></tr>\r";
			st += "<tr><td class=ms-CalAllDay rowspan="+(cAllDay+1)+">"+this.dopt.L_AllDay_Text+"</td><td width=1%/></tr>";
			for (i=0; i < cAllDay; i++)
				{
					evt = this.mpAllDayEvents[i];
					st += "<tr><td class=ms-Vapptsingle style='border-top:1px solid black; border-left:1px solid black; border-bottom:1px solid black; border-right:1px solid black;' ";
					st += " TITLE=" + StAttrQuote(evt.StTip(this.dopt)) + "><nobr>"+
						StRenderVDayEvt(evt, this.dopt, 2) + "</nobr></td></tr>\r";
				}
			}
		st += "</table><table width=100% STYLE='table-layout:fixed' class=ms-vcal cellpadding=0 cellspacing=0>\r";
		st += "<tr height=0><td width="+this.dopt.AllDayWidth+"pt/><td width=8pt/>\r";
		for (ichan = 1; ichan < cchan; ichan++)
			{
				st += "<td/>\r";
			}
		st += "</tr>\r";
		var LayoutGrid = new Object;         
		var HitDetect = new Array(iHourEnd); 
		for (ihour = iHourStart; ihour < iHourEnd; ihour++)
			{
			HitDetect[ihour] = 0;
			for (ichan = 0; ichan < cchan; ichan++)
				LayoutGrid[ihour + "." + ichan] = 0;
			}
		for (i = 0; i < this.rgEvt.length; i++)
			{
			var evt = this.rgEvt[i];
			var ihour = evt.ihour;
			var ichan = evt.ichan;
			var rowspan = evt.rowspan;
			var max = ichan+1;
			for (irow = 0; irow < rowspan; irow++)
				if (HitDetect[ihour+irow] > max)
					max = HitDetect[ihour+irow];
			for (irow = 0; irow < rowspan; irow++)
				{
				HitDetect[ihour+irow] = max;
				LayoutGrid[(ihour+irow) + "." + ichan] = 1;
				}
			}
		for (i = 0; i < this.rgEvt.length; i++)
			{
			var width = 0;
			var irow = 0;
			ihour = this.rgEvt[i].ihour;
			max = HitDetect[ihour]
			rowspan = this.rgEvt[i].rowspan;
			var hit=0;
			var popMax = false;
			for (irow = 1; irow < rowspan; irow++)
				{
				hit = HitDetect[ihour+irow];
				popMax |= hit != max;
				if (hit > max)
					max = hit;
				}
			if (!popMax)
				continue;
			for (irow = 0; irow < rowspan; irow++)
				HitDetect[ihour+irow] = max;
			}
		for (i = this.rgEvt.length-1; i >= 0; i--)
			{
			var width = 0;
			var irow = 0;
			ihour = this.rgEvt[i].ihour;
			max = HitDetect[ihour]
			rowspan = this.rgEvt[i].rowspan;
			var hit=0;
			var popMax = false;
			for (irow = 1; irow < rowspan; irow++)
				{
				hit = HitDetect[ihour+irow];
				popMax |= hit != max;
				if (hit > max)
					max = hit;
				}
			if (!popMax)
				continue;
			for (irow = 0; irow < rowspan; irow++)
				HitDetect[ihour+irow] = max;
			}
		for (ihour = iHourStart; ihour < iHourEnd; ihour++)
			{
			st += "<tr>\r";
			if (ihour%4 == 0)
				{
				var stHour = ihour/4;
				if (stHour == 24)
					stHour = "&nbsp;"; 
				else if (this.dopt.f12Hour)
					{
					stHour = ((ihour/4+11)%12+1);
					if (this.dopt.TimeMarkPosn == 0)
						{
						stHour += " " + ((ihour/4 < 12) ? this.dopt.stAM : this.dopt.stPM);
						}
					else
						stHour = ((ihour/4 < 12) ? this.dopt.stAM : this.dopt.stPM) + " " + stHour;
					}
				var stGrayBG = "";
				if ((ihour < iGrayStart || ihour > iGrayEnd))
				{
					stGrayBG = ' BGCOLOR="#e6e6e6" ';
				}
				if (ihour != iHourStart || cAllDay > 0 || cNoTime > 0)
					{
					st += "<td class=ms-CalHour rowspan=2"+stGrayBG+"><nobr>" + stHour + "</nobr></td>";
					st += "<td class=ms-calHour"+stGrayBG+">&nbsp;</td>\r";
					}
				else
					{
					st += "<td class=ms-firstCalHour rowspan=2"+stGrayBG+"><nobr>" + stHour + "</nobr></td>";
					st += "<td class=ms-firstCalHour"+stGrayBG+">&nbsp;</td>\r";
					}
				}
			else if (ihour%2 == 0)
				{
				st += "<td class=ms-CalHalfHour"+stGrayBG+">&nbsp;</td>\r";
				st += "<td class=ms-calHalfHour"+stGrayBG+">&nbsp;</td>\r";
				}
			else if (ihour%4 == 1)
				{
				st += "<td class=ms-CalQuarterHour"+stGrayBG+">&nbsp;</td>\r";
				}
			else if (ihour%4 == 3)
				{
				st += "<td class=ms-CalQuarterHour"+stGrayBG+">&nbsp;</td>\r";
				st += "<td class=ms-calQuarterHour"+stGrayBG+">&nbsp;</td>\r";
				}
			for (ichan = 0; ichan < cchan; ichan++)
				{
				span = this.mpSpan[0 + "." + ihour + "." + ichan];
				if (span != null)
					{
					var stClass = "ms-Vappt";
					var rowspan = span.evt.rowspan;
					var colspan = Math.floor(cchan / HitDetect[ihour]);
					if (colspan > cchan / this.cchanMin)
						colspan = Math.floor(cchan / this.cchanMin);
					var reduceby = colspan - 1;
					if (reduceby > 0)
						for (irow = 0; irow < rowspan; irow++)
							{
							reduceby = colspan - 1;
							for (jchan = cchan-1; jchan > ichan && reduceby > 0; jchan--)
								{
								if (LayoutGrid[(ihour+irow) + "." + jchan] == 0)
									{
										LayoutGrid[(ihour+irow) + "." + jchan] = 1;
										reduceby--;
									}
								}
							}
					st += "<td class=" + stClass +
						" style='border-top:1px solid black; border-left:1px solid black; border-bottom:2px solid black; border-right:2px solid black;' rowspan=" + span.evt.rowspan;
					if (colspan > 1)
						st += " colspan=" + colspan;
					st += " TITLE=" + StAttrQuote(span.evt.StTip(this.dopt)) + "><nobr>"+
						StRenderVDayEvt(span.evt, this.dopt, span.evt.rowspan) + "</nobr></td>\r";
					}
				else if (LayoutGrid[ihour + "." + ichan] == 0)
					{
					if (ihour%4 == 0)
						{
						if (ihour != iHourStart || cAllDay > 0 || cNoTime > 0)
							st += "<td class=ms-calHour" +stGrayBG+">&nbsp;</td>\r";
						else
							st += "<td class=ms-firstCalHour"+stGrayBG+">&nbsp;</td>\r";
						}
					else if (ihour%2 == 0)
						st += "<td class=ms-calHalfHour"+stGrayBG+">&nbsp;</td>\r";
					else
						st += "<td class=ms-calQuarterHour"+stGrayBG+">&nbsp;</td>\r";
					}
				}
			st += "</tr>\r";
			}
		st += "<tr>\r";
		for (ichan = -2; ichan < cchan; ichan++)
			{
			st += "<td class=ms-CalHour>&nbsp;</td>\r";
			}
		st += "</tr>\r";
		}
	else 
		{
		var fWeekly = this.iperiod == 1;
		st = "<table width=100% class=ms-cal cellpadding=0 cellspacing=0>";
		st += '<tr>' + stTDHigh + StClickEvent(this.stObject + '.MoveDate(-1)') + ' class=ms-calhead style="cursor:hand;">&lt;</td><td class=ms-calhead colspan=5>';
		if (this.iperiod == 0 )
			st += this.StMonthYear();
		else 
			st += this.StDaySpanMonthYear();
		st += '</td>' + stTDHigh + StClickEvent(this.stObject + '.MoveDate(1)') + ' class=ms-calhead style="cursor:hand;">&gt;</td></tr>';
		st += "<tr>\r";
		for (iday = 0; iday < 7; iday++)
			{
			st += "<td class=ms-calDOW>" + Calendar.rgDOW[(iday+this.dopt.dow)%7] + "</td>\r";
			}
		st += "</tr>";
		for (irw = 0; irw < this.irwMax; irw++)
			{
			cchan = Math.max(this.IchanNext(irw, 0, 6), this.cchanMin);
			if (this.cchanMax > 0)
				cchan = Math.min(cchan, this.cchanMax);
			st += "<tr>\r";
			for (iday = 0; iday < 7; iday++)
				{
				this.SetDateFromGrid(dateCur, irw, iday);
				st += '<td class=ms-calTop' + this.DayStyle(dateCur, false, true, fWeekly) +
					'>&nbsp;<span style="cursor:hand;" onmouseover="HighlightText(this, \'red\');" onmouseout="HighlightText(this, \'\');"' + StClickEvent(this.stObject + ".MoveToDay(" + dateCur.getUTCFullYear() + "," + (dateCur.getUTCMonth()+1) + "," + dateCur.getUTCDate() + ")") + ">" + dateCur.getUTCDate() + "</span>&nbsp;</td>\r";
				}
			st += "</tr>\r";
			for (ichan = 0; ichan < cchan; ichan++)
				{
				if (this.iperiod == 1 )
				{	
					st += "<tr>\r";
					for (iday = 0; iday < 7; iday++)
						{
						this.SetDateFromGrid(dateCur, irw, iday);
						if (ichan == cchan-1 && this.SpanCheck(irw, iday, ichan, cchan)) 
							{
								st += "<td class=ms-apptsingle " + this.DayStyle(dateCur, false, false, fWeekly) + ">&nbsp;</td>";
							}
						else
							{
							span = this.mpSpan[irw + "." + iday + "." + ichan];
							if (span != null
								&& !span.evt.multiDay
								&& 0 != span.evt.actualDateStart.getTime() % Calendar.msDay
								&& 0 != span.evt.actualDateEnd.getTime() % Calendar.msDay)
								{
								var stClass = "ms-apptsingle" + this.DayStyle(dateCur, false, false, fWeekly);
								st += "<td class=" + stClass +
											" colspan=" + span.cbucket + " TITLE=" + StAttrQuote(span.evt.StTip(this.dopt)) + "><nobr>";
								st += StEvtTime(span.evt, this.dopt, true);
								st += "&nbsp;</nobr></td>\r";
								iday += span.cbucket - 1;
								}
							else
								{
								st += "<td class=ms-calMid" + this.DayStyle(dateCur, false, false, fWeekly) + ">&nbsp;</td>\r";
								}
							}
						}
					st += "</tr>\r";
				}
				st += "<tr>\r";
				for (iday = 0; iday < 7; iday++)
					{
					this.SetDateFromGrid(dateCur, irw, iday);
					if (ichan == cchan-1 && this.SpanCheck(irw, iday, ichan, cchan)) 
						{
							st += "<td class=ms-apptsingle " + this.DayStyle(dateCur, false, false, fWeekly) +
							'><span style="cursor:hand;" onmouseover="HighlightText(this, \'red\');" onmouseout="HighlightText(this, \'\');"' + StClickEvent(this.stObject + ".MoveToDay(" + dateCur.getUTCFullYear() + "," + (dateCur.getUTCMonth()+1) + "," + dateCur.getUTCDate() + ")") +
							">"+this.dopt.L_More_Text+"</span></td>\r";
						}
					else
						{
						span = this.mpSpan[irw + "." + iday + "." + ichan];
						if (span != null)
							{
							var stClass = "ms-appt";
							if (!span.evt.multiDay)
								stClass = "ms-apptsingle" + this.DayStyle(dateCur, false, false, fWeekly);
							st += "<td class=" + stClass +
								" colspan=" + span.cbucket + " TITLE=" + StAttrQuote(span.evt.StTip(this.dopt)) + "><nobr>"+
								StURL(span.evt.stURL, span.evt.stTitle) + "</nobr></td>\r";
							iday += span.cbucket - 1;
							}
						else
							{
							st += "<td class=ms-calMid" + this.DayStyle(dateCur, false, false, fWeekly) + ">&nbsp;</td>\r";
							}
						}
					}
				st += "</tr>\r";
				st += "<tr>\r";
				if (ichan == cchan-1)
					stClass = "ms-CalBot";
				else
					stClass = "ms-CalSpacer";
				for (iday = 0; iday < 7; iday++)
					{
					this.SetDateFromGrid(dateCur, irw, iday);
					st += "<td class=" + stClass + this.DayStyle(dateCur, ichan == cchan-1, false, fWeekly) + ">&nbsp;</td>\r";
					}
				st += "</tr>\r";
				}
			}
		}
	st += "</table>";
	return st;
}
Calendar.prototype.SpanCheck = CalSpanCheck;
function CalSpanCheck(irw, iday, ichan, cchan)
{
	var span;
	var i;
	var iMax;
	if (this.IchanNext(irw, iday, iday) > cchan)
		return true;
	span = this.mpSpan[irw + "." + iday + "." + ichan];
	if (span != null)
	{
		iMax = span.cbucket+iday;
		if (iMax > 7)
			iMax = 7;
		for (i=iday+1; i<iMax; i++)
		{
			if (this.IchanNext(irw, i, i) > cchan)
				return true;
		}
	}
	return false;
}
function StRenderVDayEvt(evt, dopt, rowSpan)
{
	var st = "";
	st += "<table height=12px border='0' cellpadding='0' cellspacing='0' style='border-collapse: collapse; padding-right:6px' ><tr>";
	if (evt.rgIcons && evt.rgIcons.length)
	{
		var i;
		var bAllBlank = true;
		for (i in evt.rgIcons)
			if (evt.rgIcons[i] && evt.rgIcons[i].indexOf("blank.gif") < 0)
			{
				bAllBlank=false;
				break;
			}				
		if (!bAllBlank)
		{
			st += "<td valign=top nowrap>";
			for (i in evt.rgIcons)
				if (evt.rgIcons[i] && evt.rgIcons[i].length)
					st += evt.rgIcons[i];
			st += "</td>";
		}
	}
	st += "<td nowrap>" + StURL(evt.stURL, evt.stTitle) + "</td></tr></table>";
	if (rowSpan > 2)
		st += "<nobr>" + StEvtTime(evt, dopt, false) + "</nobr>";
	if (rowSpan > 3
		&& evt.stLocation != null)
		st += "<br><nobr>" + STSHtmlEncode(evt.stLocation) + "</nobr>";
	return st;
}
function StEvtTime(evt, dopt, fAMPM)
{
	var st="";
	if (fAMPM)
		st += dopt.StTime(evt.actualDateStart);
	else
		st += dopt.StBareTime(evt.actualDateStart);
	if (evt.actualDateStart.getTime() != evt.actualDateEnd.getTime()
		&& (MsFloorTime(evt.actualDateStart, Calendar.msDay, 0) == MsFloorTime(evt.actualDateEnd, Calendar.msDay, 0)
			|| (evt.actualDateEnd.getTime() - evt.actualDateStart.getTime()) < Calendar.msDay))
		{
		st += " - ";
		if (fAMPM)
			st += dopt.StTime(evt.actualDateEnd);
		else
			st += dopt.StBareTime(evt.actualDateEnd);
		}
	return st;
}
function StClickEvent(st)
{
	return 'onclick="' + st + '" ondblclick="' + st + '"';
}
var L_TodaysDate_Text = "\u4eca\u5929\u662f ^1";
Calendar.prototype.StBuildPicker = CalStBuildPicker;
function CalStBuildPicker()
{
	var st;
	var dateCur = new Date;
	var dateToday = this.dopt.Today();
	var irw;
	var iday;
	var stClass;
	var ievt;
	var L_LittleRedDiamond_TXT = "&loz;"; // This is the little red diamond in the calendar picker. If the diamond doesn't show up for your language you can localize it to e.g. an asterisk.
	st = '<TABLE ONSELECTSTART="return false;" CLASS=ms-datepicker CELLPADDING="2" CELLSPACING="0" BORDER="1">\r';
	var stTDHigh = '<td style="cursor:hand;" onmouseover="Highlight(this, \'yellow\', \'black\');" onmouseout="Highlight(this, \'\', \'\');" ';
	st += '<tr>' + stTDHigh + StClickEvent(this.stObject + '.MoveMonth(-1)') + ' class=ms-dpnextprev>&lt;</td><td class=ms-dphead colspan=5>' +
		this.StMonthYear() +
		'</td>' + stTDHigh + StClickEvent(this.stObject + '.MoveMonth(1)') + ' class=ms-dpnextprev>&gt;</td></tr>';
	st += "<tr>\r";
	for (iday = 0; iday < 7; iday++)
		{
		st += '<TD class=ms-dpdow HEIGHT="20" WIDTH="14%">' +
			'&nbsp;' + Calendar.rgDOWDP[(iday+this.dopt.dow)%7] + '&nbsp;</TD>\r';
		}
	st += "</tr>\r";
	for (irw = 0; irw < this.irwMax; irw++)
		{
		st += "<tr>\r";
		for (iday = 0; iday < 7; iday++)
			{
			this.SetDateFromGrid(dateCur, irw, iday);
			var rgevt = this.mpEvents[irw + "." + iday];
			var fHasEvent = (rgevt != null);
			var yr = dateCur.getUTCFullYear();
			var mon = dateCur.getUTCMonth();
			var day = dateCur.getUTCDate();
			st += stTDHigh + StClickEvent(this.stObject + '.ClickDay(' + yr + ',' + mon + ',' + day + ')');
			if (fHasEvent)
				{
				var stTips = "";
				for (ievt = 0; ievt < rgevt.length; ievt++)
					{
					stTips += rgevt[ievt].StTip(this.dopt);
					if (ievt < rgevt.length-1)
						stTips += "\r";
					}
				st += " TITLE=" + StAttrQuote(stTips);
				}
			st += ' WIDTH="14%"' +
				this.DPDayStyle(dateCur, fHasEvent) + '>&nbsp;' + (fHasEvent ? "<b>" : "") +
				dateCur.getUTCDate() + (fHasEvent ? "</b>" : "") +
				(dateCur.getTime() == dateToday.getTime() ? "<font color=red>" + L_LittleRedDiamond_TXT + "</font>" : "&nbsp;");
			st += '</TD>\r';
			}
		st += "</tr>\r";
		}
	var stTodayLink = "<A HREF='javascript:" + this.stObject + ".SetDate(" + dateToday.getUTCFullYear() + "," +
		dateToday.getUTCMonth() + "," + dateToday.getUTCDate() + ");'>" + this.dopt.StDate(dateToday) + "</A>";
	st += "<tr><td class=ms-DPFoot colspan=7><font color=red>&loz;</font>" +
		StBuildParam(L_TodaysDate_Text, stTodayLink) + "</td></tr>";
	st += "</table>";
	return st;
}
Calendar.prototype.MoveDate = CalMoveDate;
function CalMoveDate(delta)
{
	if(this.iperiod == 2 )
		this.MoveVDay(delta)
	else if (this.iperiod == 1 )
		this.MoveWeek(delta)
	else
		this.MoveMonth(delta);
}
Calendar.prototype.MoveMonth = CalMoveMonth;
function CalMoveMonth(dmon)
{
	var stURL;
	var mon = this.givenDate.getUTCFullYear() * 12 + this.givenDate.getUTCMonth() + dmon;
	var yr = Math.floor(mon / 12);
	mon = mon % 12;
	if (dmon != 0)
		stURL = StURLSetVar("CalendarDate", yr + "-" + St2Digits(mon+1) + "-1");
	else
		stURL = StURLSetVar("CalendarDate", yr + "-" + St2Digits(mon+1) + "-" + (this.givenDate.getUTCDate()));
	stURL = StURLSetVar2(stURL, "CalendarPeriod", "month");
	this.Post(stURL);
}
Calendar.prototype.MoveWeek = CalMoveWeek;
function CalMoveWeek(dweek)
{
	var stURL;
	var date = this.givenDate;
	date.setUTCDate(this.givenDate.getUTCDate() + 7*dweek);
	stURL = StURLSetVar("CalendarDate", date.getUTCFullYear() + "-" + St2Digits(date.getUTCMonth()+1) + "-" + (date.getUTCDate()));
	stURL = StURLSetVar2(stURL, "CalendarPeriod", "week");
	this.Post(stURL);
}
Calendar.prototype.MoveDay = CalMoveDay;
Calendar.prototype.MoveVDay = CalMoveDay;   
function CalMoveDay(dday)
{
	var stURL;
	var date = this.givenDate;
	date.setUTCDate(this.givenDate.getUTCDate() + dday);
	stURL = StURLSetVar("CalendarDate", date.getUTCFullYear() + "-" + St2Digits(date.getUTCMonth()+1) + "-" + (date.getUTCDate()));
	stURL = StURLSetVar2(stURL, "CalendarPeriod", "day");
	this.Post(stURL);
}
Calendar.prototype.MoveToDay = CalMoveToDay;
function CalMoveToDay(yr, mon, day)
{
	var stURL;
	stURL = StURLSetVar("CalendarDate", yr + "-" + St2Digits(mon) + "-" + day);
	stURL = StURLSetVar2(stURL, "CalendarPeriod", "day");
	this.Post(stURL);
}
Calendar.prototype.MoveToToday = CalMoveToToday;
function CalMoveToToday()
{
	var date = this.dopt.Today();
	var stURL = StURLSetVar("CalendarDate", date.getUTCFullYear() + "-" + St2Digits(date.getUTCMonth()+1) + "-" + date.getUTCDate());
	this.Post(stURL);
}
Calendar.prototype.Post = CalDoPost;
function CalDoPost(stURL)
{
	if (this.stViewID && this.stViewID.length)
		stURL = StURLSetVar2(stURL, "View", this.stViewID);
	SubmitFormPost(stURL);
}
function EditSeries(stEditURL)
{
	var stID = "";
	if (stEditURL)
		stID = StSearchVar(stEditURL, "ID");
	else
		stID = StURLGetVar("ID");
	if (stID.length)
	{
		var iOccurDate = stID.indexOf(".0.");
		if (iOccurDate > 0)
		{
			var stURL = "";
			if (stEditURL)
			{
				stURL = window.location.href;
				var ichQ = stURL.indexOf("?");
				if (ichQ > 0)
					stEditURL += stURL.substring(ichQ, stURL.length);
				stURL = StURLSetVar2(stEditURL, "ID", stID.substr(0, iOccurDate));
			}
			else
				stURL = StURLSetVar("ID", stID.substr(0, iOccurDate));
			window.location.href = stURL;
		}
	}
}
function EditSeriesID(stMasterID, stEditURL)
{
	if (stMasterID.length)
	{
		var stURL = "";
		if (stEditURL)
		{
			stURL = window.location.href;
			var ichQ = stURL.indexOf("?");
			if (ichQ > 0)
				stEditURL += stURL.substring(ichQ, stURL.length);
			stURL = StURLSetVar2(stEditURL, "ID", stMasterID);
		}
		else
			stURL = StURLSetVar("ID", stMasterID);
		window.location.href = stURL;
	}
}
function StURLSetVar(stVar, stValue)
{
	return StURLSetVar2(window.location.href, stVar, stValue);
}
function StViewURLSetVar(viewPage, stVar, stValue)
{
	stUrl = window.location.href;
	p1 = stUrl.lastIndexOf("/");
	if (p1 > 0)
		stUrl = stUrl.substring(0, p1+1) + viewPage;
	return StURLSetVar2(stUrl, stVar, stValue);
}
function StURLSetVar2(stURL, stVar, stValue)
{
	var stNewSet = stVar + "=" + stValue;
	var ichQ = stURL.indexOf("?");
	if (ichQ != -1)
		{
		var ich = stURL.indexOf("?" + stVar + "=", ichQ);
		if (ich == -1)
			{
			ich = stURL.indexOf("&" + stVar + "=", ichQ);
			if (ich != -1)
				stNewSet = "&" + stNewSet;
			}
		else
			{
			stNewSet = "?" + stNewSet;
			}
		if (ich != -1)
			{
			var re = new RegExp("[&?]" + stVar + "=[^&]*", "");
			stURL = stURL.replace(re, stNewSet);
			}
		else
			{
			stURL = stURL + "&" + stNewSet;
			}
		}
	else
		stURL = stURL + "?" + stNewSet;
	return stURL;
}
function StURLGetVar(stVar)
{
	var stURL = document.location.href;
	return StSearchVar(stURL, stVar);
}
function StSearchVar(st, stVar)
{
	var re = new RegExp("[?&]" + stVar + "=", "g");
	var ich = st.search(re);
	if (ich == -1)
		return "";
	ich += stVar.length + 2;
	var ichEnd = st.indexOf("&", ich+1);
	if (ichEnd == -1)
		ichEnd = st.length;
	var stValue = st.substring(ich, ichEnd);
	return stValue;
}
function HighlightText(elt, stText)
{
	if (stText != "")
		{
		elt.colorTextSav = elt.style.color;
		elt.style.color = stText;
		}
	else
		{
		elt.style.color = elt.colorTextSav;
		}
}
function Highlight(elt, stHighlight, stText)
{
	if (stHighlight != "")
		{
		elt.colorBackSav = elt.style.backgroundColor;
		elt.colorTextSav = elt.style.color;
		elt.style.backgroundColor = stHighlight;
		elt.style.color = stText;
		}
	else
		{
		elt.style.backgroundColor = elt.colorBackSav;
		elt.style.color = elt.colorTextSav;
		}
}
Calendar.prototype.DPDayStyle = CalDPDayStyle;
function CalDPDayStyle(dateCur, fHasEvent)
{
	var st = "";
	if (dateCur.getTime() == this.dateDP.getTime())
		st += " class=ms-dpselectedday";
	else if (dateCur.getUTCMonth() != this.mon)
		st += " class=ms-dpnonmonth";
	else
		st += " class=ms-dpday";
	if (fHasEvent)
		{
		st += ' style:"font-weight: bold;"';
		}
	return st;
}
Calendar.prototype.StDownlevelBuild = CalStDownlevelBuild;
function CalStDownlevelBuild()
{
	var st;
	var dateCur = new Date;
	var irw;
	var iday;
	var stClass;
	var ievt;
	st = '<TABLE CELLPADDING="2" CELLSPACING="0" WIDTH="100%" BORDER="1">\r';
	st += '<TR><TD class=ms-calhead><A class=ms-calhead TARGET=_self HREF="javascript:' + this.stObject + '.MoveDate(-1);"><B>&lt;</B></A></TD><TD class=ms-calhead colspan=5>' +
		this.StMonthYear() +
		'</TD><TD class=ms-calhead><A class=ms-calhead TARGET=_self HREF="javascript:' + this.stObject + '.MoveDate(1);"><B>&gt;</B></A></TD></TR>';
	st += "<tr>\r";
	for (iday = 0; iday < 7; iday++)
		{
		st += '<TD class=ms-calDOWDown HEIGHT="20" WIDTH="14%">' +
			'&nbsp;' + Calendar.rgDOW[(iday+this.dopt.dow)%7] + "&nbsp;</TD>\r";
		}
	st += "</tr>\r";
	for (irw = 0; irw < this.irwMax; irw++)
		{
		st += "<tr>\r";
		for (iday = 0; iday < 7; iday++)
			{
			this.SetDateFromGrid(dateCur, irw, iday);
			st += '<TD class=ms-calDown HEIGHT="80" WIDTH="14%"' +
				this.DayStyle(dateCur) + '>&nbsp;' + dateCur.getUTCDate() + "&nbsp;<br>\r";
			var rgevt = this.mpEvents[irw + "." + iday];
			if (rgevt != null)
				{
				for (ievt = 0; ievt < rgevt.length; ievt++)
					{
					st += StURL(rgevt[ievt].stURL, rgevt[ievt].stTitle) + '<br>\r';
					}
				}
			st += '</TD>';
			}
		st += "</tr>\r";
		}
	st += "</table>";
	return st;
}
Calendar.prototype.SetDateFromGrid = CalSetDateFromGrid;
function CalSetDateFromGrid(date, irw, iday)
{
	date.setTime(this.dateStart.getTime() + irw * Calendar.msWeek +
		iday*Calendar.msDay);
}
var L_NoTitle_Text = "(\u65e0\u6807\u9898)";
function CalEvent(dateStart, dateEnd, actualDateStart, actualDateEnd, stLocation, stDesc, stTitle, stURL, rgIcons)
{
	this.dateStart = dateStart;
	this.dateEnd = dateEnd;
	this.actualDateStart = actualDateStart;
	this.actualDateEnd = actualDateEnd;
	this.stLocation = stLocation;
	this.stDesc = stDesc;
	this.stTitle = stTitle;
	if (stTitle.length == 0)
		this.stTitle = L_NoTitle_Text;
	this.stURL = stURL;
	this.rgIcons = rgIcons;
	var start;
	var end;
	var dayStart = MsFloorTime(dateStart, Calendar.msDay, 0);
	var dayEnd = MsFloorTime(dateEnd, Calendar.msDay, 1);
	if (dayStart < dayEnd
		&& (actualDateEnd.getTime() - actualDateStart.getTime()) >= Calendar.msDay)
	{
		this.multiDay = true;
	}
	else
		this.multiDay = false;
	var quarterStart = MsFloorTime(dateStart, Calendar.msHour/4, 0);
	var quarterEnd = MsFloorTime(dateEnd, Calendar.msHour/4, 1);
	if (quarterStart < quarterEnd)
		this.multiQuarter = true;
}
CalEvent.prototype.FOverlap = EvtFOverlap;
function EvtFOverlap(evt)
{
	return evt.dateStart <= this.dateEnd && evt.dateEnd >= this.dateStart;
}
var L_Tip_Text = "^1: ^2";
CalEvent.prototype.StTip = EvtStTip;
function EvtStTip(dopt)
{
	var stT;
	var stTime = StEvtTime(this, dopt, true);
	if (DateOptions.FHasTime(this.actualDateStart) || DateOptions.FHasTime(this.actualDateEnd))
		stT = StBuildParam(L_Tip_Text, stTime, this.stTitle);
	else
		stT = this.stTitle;
	if (!FBlankString(this.stLocation))
		stT += "\r" + this.stLocation;
	if (!FBlankString(this.stDesc))
		stT += "\r" + this.stDesc;
	return stT;
}
cGCMinimumWidth = 400;
cGCMinimumHeight = 200;
cGCMaxGCResizeCount = 10;
var glGCObjectHeight = 0;
var glGCObjectWidth = 0;
glGCResizeCounter = 0;
function TestGCObject( GCObject )
{
	if (((browseris.ie55up) && (typeof(GCObject) == "undefined")) || (GCObject == null) || (GCObject.object == null))
		return false;
	return true;
}
function GCComputeSizing(GCObject)
{
	if (TestGCObject(GCObject))
	{
		var fBIDI = (document.documentElement.currentStyle.direction == "rtl");
		var lGCWindowWidth = document.documentElement.scrollWidth;
		var lGCWindowHeight = document.documentElement.scrollHeight;
		var lGCObjectOffsetLeft = 0;
		var lGCObjectOffsetTop = 0;
		if (fBIDI)
			{
			lGCObjectOffsetLeft = -180;
			lGCObjectOffsetTop = 120;
			}
		else
			{
			lGCObjectOffsetLeft = 32;
			lGCObjectOffsetTop = -2;
			}
		var lGCObjectWalker = GCObject.parentElement;
		while (lGCObjectWalker != document.body)
		{
			lGCObjectOffsetLeft += lGCObjectWalker.offsetLeft;
			lGCObjectOffsetTop += lGCObjectWalker.offsetTop;
			lGCObjectWalker = lGCObjectWalker.offsetParent;
			if (fBIDI)
				if (lGCObjectWalker.offsetLeft > 0)
					break;
		}
		lGCObjectOffsetLeft += GCObject.parentElement.offsetLeft;
		lGCObjectOffsetTop += GCObject.parentElement.offsetTop;
		glGCObjectHeight = lGCWindowHeight - lGCObjectOffsetTop;
		if (glGCObjectHeight > lGCWindowHeight)
			glGCObjectHeight = lGCWindowHeight
		if (glGCObjectHeight < cGCMinimumHeight)
			glGCObjectHeight = cGCMinimumHeight;
		if (fBIDI)
			{
			glGCObjectWidth = lGCWindowWidth + lGCObjectOffsetLeft;
			}
		else
			glGCObjectWidth = lGCWindowWidth - lGCObjectOffsetLeft;
		if (glGCObjectWidth > lGCWindowWidth)
				glGCObjectWidth = lGCWindowWidth;
		if (glGCObjectWidth < cGCMinimumWidth)
			glGCObjectWidth = cGCMinimumWidth;
	}
}
function GCResizeGridControl(GCObject)
{
	if (TestGCObject(GCObject))
	{
		var lGCOldObjectHeight = glGCObjectHeight;
		var lGCOldglGCObjectWidth = glGCObjectWidth;
		GCComputeSizing(GCObject);
		if (lGCOldObjectHeight != glGCObjectHeight)
			GCObject.height = glGCObjectHeight;
		if (lGCOldglGCObjectWidth != glGCObjectWidth) 
			GCObject.width = glGCObjectWidth;
	} 
}
function GCWindowResize(GCObject)
{
	if (TestGCObject(GCObject))
	{
		glGCResizeCounter = 0;
		GCResizeGridControl(GCObject);
	}
}
function GCOnResizeGridControl(GCObject)
{
	if (TestGCObject(GCObject))
	{
		if (glGCResizeCounter < cGCMaxGCResizeCount)
		{
			glGCResizeCounter++;
			GCResizeGridControl(GCObject);
		}
	}
}
function GCActivateAndFocus(GCObject)
{
	if (TestGCObject(GCObject))
	{
		GCObject.SetActive;
		GCObject.Focus;
 	}
}
function GCNavigateToNonGridPage()
{
	var strDocUrl = window.location.href;
	gridPart = strDocUrl.match("ShowInGrid=");
	if (gridPart)
	{
		gridSet = /ShowInGrid=\w*/;
		strDocUrl = strDocUrl.replace(gridSet, "");	
	}
   	var idxQuery = strDocUrl.indexOf("?");
	if (idxQuery != -1)
		{
		var idxQry2 = strDocUrl.indexOf("?", idxQuery+1);
		if (idxQry2 != -1)
			strDocUrl = strDocUrl.slice(0, idxQry2);
		strDocUrl = strDocUrl + "&";
		}
	else
		strDocUrl = strDocUrl + "?";
	strDocUrl = strDocUrl + "ShowInGrid=False";
	document.location.replace(STSPageUrlValidation(strDocUrl));
}
function GCAddNewColumn(GCObject,path)
{
	if (TestGCObject(GCObject))
	{
	  var source = window.location.href;
	  var listName = GCObject.Name;
	  var colName = GCObject.SelectedColumnUniqueName; 
	  var ltr = GCObject.RightToLeft; 
	  var viewGUID = GCObject.ViewGUID;
	  var page = "FldNew.aspx";
	  var listServerTemplate = GCObject.ServerTemplate;
	  if (listServerTemplate == "102" ) 
	  {
	    page = "QstNew.aspx"; 
	  }
	  path = path + "/_layouts/" + L_Language_Text + "/" + page + "?List=" + listName + "&View=" + viewGUID + "&Source=" + source + "&RelativeToField=" + colName + "&LTR=" + ltr;
	  window.location = path 
	}
}
function GCEditDeleteColumn(GCObject,path)
{
	if (TestGCObject(GCObject))
	{
		  var source = window.location.href;
		  var colName = GCObject.SelectedColumnUniqueName; 
		  var listName = GCObject.Name;
		  var page = "FldEdit.aspx"; 
		  var listServerTemplate = GCObject.ServerTemplate;
		  if (listServerTemplate == "102" ) 
		  {
		    page = "QstEdit.aspx"; 
		  }
		  path = path + "/_layouts/" + L_Language_Text + "/" + page +"?List=" + listName  + "&Field=" + colName + "&Source=" + source;
		  window.location = path 
	}
}
function GCShowHideTaskPane(GCObject)
{
	if (TestGCObject(GCObject))
	{
		var state = GCObject.DisplayTaskPane;
		GCObject.DisplayTaskPane = !state;
	}
}
function GCShowHideTotalsRow(GCObject)
{
	if (TestGCObject(GCObject))
	{
		var state = GCObject.DisplaySheetTotals;
		GCObject.DisplaySheetTotals = !state;
	}
}
function GCGridNewRow(GCObject)
{
	if (TestGCObject(GCObject))
	{
		GCObject.SelectNewRow();
	}
}
function GCRefresh(GCObject)
{
	if (TestGCObject(GCObject))
	{
		GCObject.Refresh();
	}
}
function GCNewFolder(GCObject)
{
	if (TestGCObject(GCObject))
	{
		GCObject.NewFolder();
	}
}
var FileuploadString =  "fileupload"; 
var FileUploadIndex = 0;
var FileUploadIndexStart;
var attachmentsOnClientToBeRemoved;
var attachmentsOnClientToBeRemovedIndex;
var attachmentsOnServerToBeRemoved;
var attachmentsOnServerToBeRemovedIndex;
function UploadAttachment()
{
    var L_IE5upRequiredForAttachment_Text = 
        "\u60a8\u7684\u6d4f\u89c8\u5668\u4e0d\u652f\u6301\u9644\u4ef6\u529f\u80fd\u3002\n\u8981\u4f7f\u7528\u9644\u4ef6\u529f\u80fd\uff0c\u60a8\u7684\u8ba1\u7b97\u673a\u5fc5\u987b\u8fd0\u884c Internet Explorer 5.0 for Windows \u6216\u66f4\u9ad8\u7248\u672c\u3002";
    if (browseris.ie5up && browseris.win32)
        ShowPartAttachment();
    else
        alert(L_IE5upRequiredForAttachment_Text);
}
function IssueShowHideView(fShow)
{
    var issueviewstyle = "block";
    if (!fShow)
        issueviewstyle = "none";
    var relatedIssueTable = document.getElementById("idRelatedIssueTable");
    var historyTable = document.getElementById("idHistoryIssuetable");
    var relatedIssueHeadTable = document.getElementById("idRelatedIssueHeadtable");
    var historyHeadTable = document.getElementById("idHistoryIssueHeadtable");
    if (relatedIssueTable != null)
      relatedIssueTable.style.display= issueviewstyle; 
    if (historyTable != null)
      historyTable.style.display= issueviewstyle;
    if (relatedIssueHeadTable != null)
      relatedIssueHeadTable.style.display= issueviewstyle; 
    if (historyHeadTable != null)
      historyHeadTable.style.display=issueviewstyle;         
}
function ShowPart1()
{
    partAttachment.style.display="none";
    part1.style.display="block";    
    IssueShowHideView(true);
    frm.SetFirstFocus(true);
}
function ShowPartAttachment()
{
    part1.style.display="none";
    partAttachment.style.display="block";
    document.all.item(FileuploadString+FileUploadIndex).focus();
    IssueShowHideView(false);
}
function CancelAttach()
{
    fileID = FileuploadString + FileUploadIndex;
    fileInput = attachmentsOnClient.children[fileID];
    filename = fileInput.value;
    if (filename)
    {
        fileInput.outerHTML = "<input type=file class=ms-long name="+fileID+">";
    }
    ShowPart1();
}
function OkAttach()
{
    fileID = FileuploadString + FileUploadIndex;
    fileInput = attachmentsOnClient.all(fileID);
    filename = TrimWhiteSpaces(fileInput.value);
    if (!filename)
    {
        var L_FileNameRequired_TXT = "\u6587\u4ef6\u540d\u4e0d\u80fd\u4e3a\u7a7a\u3002";
        alert(L_FileNameRequired_TXT);  
        fileInput.focus();
    }
    else
    {
        var L_FileUploadToolTip_text = "\u540d\u79f0";
        oRow = idAttachmentsTable.insertRow();
        RowID = 'attachRow' + FileUploadIndex;
        oRow.id = RowID;
        oCellFileName = oRow.insertCell();
        oCellFileName.className = "ms-vb";
        oCellFileName.innerHTML =  filename + "&nbsp;&nbsp;&nbsp;&nbsp;";
        oCellControl = oRow.insertCell();
        oCellControl.className = "ms-propertysheet";
        oCellControl.innerHTML = "<IMG SRC='" + document.all.RectGifUrl.value + 
            "'>&nbsp;<a tabindex=1 href='javascript:RemoveLocal(" + RowID + ",\"" + fileID + 
            "\")'>" + L_Delete_Text + "</a>";        
        fileInput.style.display="none";
        ++FileUploadIndex;
        attachmentsOnClient.insertAdjacentHTML("beforeEnd",
            "<input tabIndex=1 type=file class=ms-long name=" + 
            FileuploadString + FileUploadIndex + 
            " title=" + L_FileUploadToolTip_text +">");
        var theForm = fileInput.form;
        theForm.encoding = 'multipart/form-data';
        idAttachmentsRow.style.display='block';
        ShowPart1();
    }
}
function RemoveLocal(RowID, FileID)
{
    idAttachmentsTable.deleteRow(RowID.rowIndex);
    attachmentsOnClient.children[FileID].outerHTML = "";
    if (idAttachmentsTable.rows.length == 0)
        idAttachmentsRow.style.display='none';
}
function RemoveFromServer(guid)
{
    var L_ConfirmRemove_TXT = "\u662f\u5426\u786e\u5b9e\u8981\u5220\u9664\u6b64\u9644\u4ef6?";
    if (confirm(L_ConfirmRemove_TXT))
    {
        document.getElementById("idAttachmentsTable").deleteRow(document.getElementById(guid).rowIndex);
        document.getElementsByName("attachmentsToBeRemovedFromServer").item(0).value += guid + ";";
        if (document.getElementById("idAttachmentsTable").rows.length == 0)
           document.getElementById("idAttachmentsRow").style.display='none';
    }
}
var L_Edit_Text           = "\u7f16\u8f91";
var L_ViewItem_Text       = "\u67e5\u770b\u9879\u76ee";
var L_EditItem_Text       = "\u7f16\u8f91\u9879\u76ee";
var L_EditSeriesItem_Text = "\u7f16\u8f91\u5e8f\u5217";
var L_DeleteItem_Text     = "\u5220\u9664\u9879\u76ee";
var L_DeleteDocItem_Text  = "\u5220\u9664";
var L_ViewProperties_Text = "\u67e5\u770b\u5c5e\u6027";
var L_EditProperties_Text = "\u7f16\u8f91\u5c5e\u6027";
var L_Discuss_Text        = "\u8ba8\u8bba";
var L_Subscribe_Text      = "\u901a\u77e5\u6211";
var L_Review_Text         = "\u8bf7\u6c42\u5ba1\u9605";
var L_EditIn_Text         = "\u5728 ^1 \u4e2d\u7f16\u8f91"; 
var L_Checkin_Text        = "\u7b7e\u5165";
var L_Checkout_Text       = "\u7b7e\u51fa";
var L_CreateDWS_Text      = "\u521b\u5efa\u6587\u6863\u5de5\u4f5c\u533a";
var L_PublishBack_Text    = "\u53d1\u5e03\u5230\u6e90\u4f4d\u7f6e";
var L_Versions_Text       = "\u7248\u672c\u8bb0\u5f55";
var L_Reply_Text          = "\u7b54\u590d";
var L_ExportContact_Text  = "\u5bfc\u51fa\u8054\u7cfb\u4eba";
var L_ExportEvent_Text    = "\u5bfc\u51fa\u4e8b\u4ef6";
var L_Reschedule_Text     = "\u91cd\u65b0\u8ba1\u5212\u9009\u9879";
var L_Move_Text           = "\u79fb\u52a8";
var L_Keep_Text           = "\u4fdd\u7559";
var L_Delete_Text         = "\u5220\u9664";
var L_Open_Text           = "\u6253\u5f00";
var L_SiteSettings_Text   = "\u66f4\u6539\u7f51\u7ad9\u8bbe\u7f6e";
var L_ManageUsers_Text    = "\u7ba1\u7406\u7528\u6237";
var L_DeleteSite_Text     = "\u5220\u9664\u7f51\u7ad9";
var L_SiteStorage_Text    = "\u7ba1\u7406\u7f51\u7ad9\u5b58\u50a8";
var L_Sharing_Text        = "\u5171\u4eab";
var L_Settings_Text       = "\u8bbe\u7f6e";
var L_Remove_Text         = "\u4ece\u6b64\u5217\u8868\u4e2d\u5220\u9664";
var L_ModerateItem_Text   = "\u6279\u51c6/\u62d2\u7edd";
var L_DownloadOriginal_Text = "\u4e0b\u8f7d\u56fe\u7247";
var L_EditVersion_Text    = "\u7f16\u8f91";
var L_ViewVersion_Text    = "\u67e5\u770b";
var L_RestoreVersion_Text = "\u6062\u590d";
var L_DeleteVersion_Text  = "\u5220\u9664";
var L_EditInOIS_Text      = "\u7f16\u8f91\u56fe\u7247";
var L_AddToMyLinks_Text   = "\u6dfb\u52a0\u5230\u201c\u6211\u7684\u94fe\u63a5\u201d";
var L_AddToCategory_Text  = "\u63d0\u4ea4\u5230\u95e8\u6237\u533a\u57df";
function ContextInfo()
{
    this.listBaseType   = null;
    this.listTemplate   = null;
    this.listName       = null;
    this.listUrlDir     = null;
    this.HttpPath       = null;
    this.HttpRoot       = null;
    this.imagesPath     = null;
    this.PortalUrl      = null;
    this.isWebEditorPreview = null;
    this.rootFolderForDisplay = null;
    this.isPortalTemplate = null;
    this.isModerated = false; 
    this.recursiveView = false; 
    this.displayFormUrl = null;
    this.editFormUrl    = null;
    this.newFormUrl     = null;   
    this.ctxId          = null;
}
var IsMenuShown = false;
var itemTableDeferred = null;
var itemTable = null;
var imageCell = null;
var onKeyPress = false;
var downArrowText = null;
var currentCtx = null;
var currenMenu = null;
var currentItemID = null;
var currentItemAppName = null;
var currentItemProgId = null;
var currentItemIcon = null;
var currentItemOpenControl = null;
var currentItemFileUrl = null; 
var currentItemFSObjType = null; 
var currentItemCheckedOutUserId = null;
var currentItemCheckoutExpires = null;
function resetExecutionState()
{
    IsMenuShown = false;
    itemTable = null;
    EndDeferItem();
    imageCell = null;
    onKeyPress = false;
    currentCtx = null;
    currenMenu = null;
    currentItemID = null;
    downArrowText = null;
    currentItemAppName = null;
    currentItemProgId = null;
    currentItemIcon = null;
    currentItemOpenControl = null;
    currentItemFileUrl = null;
    currentItemFSObjType = null;
    currentItemCheckedOutUserId = null;
    currentItemCheckoutExpires = null;
}
function GetSelectedElement(elem, tagName)
{
    while(elem != null && elem.tagName != tagName)
        elem = elem.parentNode;       
    return elem;
}
function setupMenuContext(ctx)
{
    currentCtx = ctx;
}
function FindSTSMenuTable(elm)
{
    var ctxName = elm.getAttribute("CTXName");
    while (elm != null && (ctxName == null ||ctxName == ""))
    {
    	elm = GetSelectedElement(elm.parentNode, "TABLE");
		if (elm != null)
			ctxName = elm.getAttribute("CTXName");
    }
    return elm;
}
function OnLink(elm)
{
    if (!browseris.ie55up)
        return false;
    elm.onblur = OutItem;
    elm.onkeypress = PopMenu;
    var elmTmp = FindSTSMenuTable(elm);
    if (elmTmp == null)
        return false;
    OnItem(elmTmp);
    return false;
}
function StartDeferItem(elm)
{
    if (elm != itemTable)
    {
        itemTableDeferred = elm;
        elm.onmouseout = EndDeferItem;
        elm.onclick = DeferredOnItem;
        elm.oncontextmenu = DeferredOnItem;
    }
}
function DeferredOnItem()
{
    var elm = itemTableDeferred;
    if (elm != null)
    {
        HideSelectedRow();
        OnItem(elm);
        CreateMenu();
        window.event.returnValue=false;
    }
}
function EndDeferItem()
{
    var elm = itemTableDeferred;
    if (elm != null)
    {
        itemTableDeferred = null;
        elm.onmouseout = null;
        elm.onclick = null;
        elm.oncontextmenu = null;
    }
}
function OnItem(elm)
{
    if (!browseris.ie5up || !browseris.win32)
        return false;
    if (IsMenuOn())
    {
        StartDeferItem(elm);
        return false;
    }
    if (itemTable != null)
        OutItem();
    itemTable = elm;
    currentItemID = itemTable.ItemId;
    var createCtx = new Function("setupMenuContext(" + itemTable.CTXName + ");");
    createCtx();
    var ctx = currentCtx;
    itemTable.className="ms-selectedtitle";
    if (browseris.ie55up)
    {
        itemTable.onclick = CreateMenu;
        itemTable.oncontextmenu = CreateMenu;
    }
    else 
    { 
        itemTable.onclick = EditMenuDefaultForOnclick;
        itemTable.oncontextmenu = EditMenuDefaultForOnclick;
    }
    itemTable.onmouseout = OutItem;
    titleRow = itemTable.children[0].children[0];
    i = 0;
    while (titleRow.children[i] != null)
        imageCell = titleRow.children[i++];
    if (ctx.listTemplate == LISTTEMPLATE_MEETINGS)
    {
        if (itemTable.menuType == "Orphaned") 
            downArrowText = L_Reschedule_Text;
    }
    else
        downArrowText = L_Edit_Text;
    imageCell.children[0].src = ctx.imagesPath + "downarrw.gif";
    imageCell.children[0].alt = downArrowText;
    imageCell.children[0].style.visibility = "visible";
    imageCell.style.visibility="visible";
    imageCell.className="ms-menuimagecell";
    return true;
}
function OutItem()
{
    if (!IsMenuOn() && itemTable != null)
    {
        itemTable.className="ms-unselectedtitle";
        itemTable.onclick = "";
        itemTable.onmouseout = "";
        if (imageCell != null)
        {
            imageCell.children[0].style.visibility="hidden";
            imageCell.style.visibility="hidden";
            imageCell.bgColor="";
        }
        resetExecutionState();
    }
}
function HideSelectedRow()
{
    var srcElement = GetSelectedElement(event.srcElement, "TABLE");
    if (srcElement != itemTable && itemTable != null)
    {
        OutItem();
    }
}
function IsMenuOn()
{
    if (!IsMenuShown)
        return false;
    var fIsOpen = false;
//@cc_on
//@if (@_jscript_version >= 5)
//@ try {
//@  fIsOpen = currenMenu.isOpen();
//@ } catch (e) {};
//@else
//@end
	if (!fIsOpen)
		IsMenuShown = false;
    return fIsOpen;
}
function PopMenu()
{
    if (!browseris.ie55up)
        return true;
    if (!IsMenuOn() && event.shiftKey && event.keyCode == 13)
    { 
        onKeyPress=true;
        CreateMenu();
        onKeyPress=false;
        return false;
    } 
    else
        return true;
}
function CreateMenu()
{
    if (! IsContextSet()) 
        return;
    var ctx = currentCtx;
    if (itemTable == null || imageCell == null ||
        (onKeyPress == false &&
         (event.srcElement.tagName=="A" ||
          event.srcElement.parentNode.tagName == "A")))
        return;
    IsMenuShown = true;
    window.document.body.onclick="";
    m = CMenu(currentItemID + "_menu");
    currenMenu = m;
	if (ctx.isVersions)
		AddVersionMenuItems(m, ctx);
    else if (ctx.listBaseType == BASETYPE_DOCUMENT_LIBRARY)
        AddDocLibMenuItems(m, ctx);
    else if (ctx.listTemplate == LISTTEMPLATE_MEETINGS)
         AddMeetingMenuItems(m, ctx);
    else   
         AddListMenuItems(m, ctx);
    OMenu(m, itemTable, null, null, -1);
    document.body.onclick=HideSelectedRow;
    return false;
}
function AddMeetingMenuItems(m, ctx)
{
    if (itemTable.menuType == "Orphaned")
    {
        var currentInstanceId = itemTable.ItemId;
        strDisplayText = L_Move_Text;
        strAction = "GoToMtgMove('" + ctx.listUrlDir + "'," + currentInstanceId + ",'" + itemTable.DateTime + "','" + itemTable.DateTimeISO + "')";
        strImagePath = "";
        CAMOpt(m, strDisplayText, strAction, strImagePath);
        strDisplayText = L_Keep_Text;
        strAction = "MtgKeep('" + ctx.HttpPath + "','" + ctx.listName + "'," + currentInstanceId + ")";
        strImagePath = "";
        CAMOpt(m, strDisplayText, strAction, strImagePath);
        strDisplayText = L_Delete_Text;
        strAction = "MtgDelete('" + ctx.HttpPath + "','" + ctx.listName + "'," + currentInstanceId + ")";
        strImagePath = ctx.imagesPath + "delitem.gif";
        CAMOpt(m, strDisplayText, strAction, strImagePath);
    }
}
function AddListMenuItems(m, ctx)
{
    if (typeof(Custom_AddListMenuItems) != "undefined") 
    {
        if (Custom_AddListMenuItems(m, ctx))           
            return;
    }
    if (ctx.listBaseType == BASETYPE_DISCUSSION)
    {
        strDisplayText = L_Reply_Text;
        if(itemTable.Ordering.length>=504) 
        {
            var L_ReplyLimitMsg_Text="\u65e0\u6cd5\u7b54\u590d\u6b64\u7ebf\u7d22\u3002\u5df2\u8fbe\u5230\u7b54\u590d\u9650\u5236\u3002";
            strAction="alert('" + L_ReplyLimitMsg_Text + "')";
        }
        else
        {
            strAction = "STSNavigate('" + ctx.newFormUrl 
            + "?Threading=" + escapeProperly(itemTable.Ordering)
            + "&Guid=" + escapeProperly(itemTable.ThreadID)
            + "&Subject=" + escapeProperly(itemTable.Subject)
            + "&Source=" + GetSource() + "')";
        }
        strImagePath = ctx.imagesPath + "reply.gif";
        CAMOpt(m, strDisplayText, strAction, strImagePath);
    }
    strDisplayText = L_ViewItem_Text;
    strAction = "STSNavigate('" + ctx.displayFormUrl+"?ID="+ currentItemID + "&Source=" +
                GetSource() + "')";
    strImagePath = "";
    CAMOpt(m, strDisplayText, strAction, strImagePath);
    strDisplayText = L_EditItem_Text;
    strAction = "STSNavigate('" + ctx.editFormUrl+"?ID="+ currentItemID + "&Source=" +
                GetSource() + "')";
    strImagePath = ctx.imagesPath + "edititem.gif";
    CAMOpt(m, strDisplayText, strAction, strImagePath);
    if (ctx.listTemplate == LISTTEMPLATE_EVENTS &&
        currentItemID.indexOf(".0.") > 0)
    {
        var SeriesIdEnd = currentItemID.indexOf(".0.");
        var itemSeriesID = currentItemID.substr(0, SeriesIdEnd);
        strDisplayText = L_EditSeriesItem_Text;
        strAction = "STSNavigate('" + ctx.editFormUrl+"?ID="+ itemSeriesID + "&Source=" +
                    GetSource() + "')";
        strImagePath = ctx.imagesPath + "recur.gif";
        CAMOpt(m, strDisplayText, strAction, strImagePath);
    }
    if (currentItemID.indexOf(".0.") < 0)
    {
		strDisplayText = L_DeleteItem_Text;
		strAction = "DeleteListItem()";
		strImagePath = ctx.imagesPath + "delitem.gif";
		CAMOpt(m, strDisplayText, strAction, strImagePath);
    }
    if (ctx.listTemplate == LISTTEMPLATE_CONTACTS)
    {
        strDisplayText = L_ExportContact_Text;
        strAction = "STSNavigate('" + ctx.HttpPath + "&Cmd=Display&CacheControl=1&List=" + ctx.listName + "&ID=" +  currentItemID + "&Using=" + escapeProperly(ctx.listUrlDir) + "/vcard.vcf" + "')";
        strImagePath = ctx.imagesPath + "exptitem.gif";
        CAMOpt(m, strDisplayText, strAction, strImagePath);
    }
    if (currentItemID.indexOf(".0.") < 0)
    {
        strDisplayText = L_Subscribe_Text;
        strAction = "NavigateToSubNewAspx('" + ctx.HttpRoot + "', 'List=" + ctx.listName + "&ID=" + currentItemID +"')";
        strImagePath = "";
        CAMOpt(m, strDisplayText, strAction, strImagePath);
    }
    if (ctx.isModerated == true &&
        ctx.listBaseType != BASETYPE_SURVEY)
    {
        strDisplayText = L_ModerateItem_Text;
        strAction = "STSNavigate('" + ctx.editFormUrl+"?ID="+ currentItemID + "&ChangeApproval=TRUE&Source=" +
                    GetSource() + "')";
        strImagePath = "";
        CAMOpt(m, strDisplayText, strAction, strImagePath);
    }
}
function GetRootFolder(ctx)
{
    var RootFolder = GetUrlKeyValue("RootFolder");
    if (RootFolder == "" || bValidSearchTerm)
    {
        var FileDirRef;
        if (itemTable)
            FileDirRef = itemTable.getAttribute("FileDirRef");
        if (FileDirRef != null)
            RootFolder = "/" + FileDirRef;
        else
            RootFolder = "/" + ctx.listUrlDir;
        RootFolder = escapeProperly(RootFolder);
    }
    return "&RootFolder=" + RootFolder;
}
function AddDocLibMenuItems(m, ctx)
{
    if (typeof(Custom_AddDocLibMenuItems) != "undefined") 
    {
        if (Custom_AddDocLibMenuItems(m, ctx))           
            return;
    }
    var RootFolder = GetRootFolder(ctx);
    setupMenuContext(ctx);
    if (currentItemFileUrl == null)
        currentItemFileUrl = itemTable.ServerUrl;
    if (currentItemFSObjType == null)
        currentItemFSObjType = itemTable.FSObjType;
    var currentItemEscapedFileUrl = escapeProperly(
        unescapeProperly(currentItemFileUrl));
    if (currentItemFSObjType != 1) 
    {
        strDisplayText = L_ViewProperties_Text;    
        strAction = "STSNavigate('" + ctx.displayFormUrl+"?ID="+ currentItemID + 
                    "&Source=" + GetSource() + RootFolder + "')";
        strImagePath = "";
        CAMOpt(m, strDisplayText, strAction, strImagePath);
    }
    strDisplayText = L_EditProperties_Text;    
    strAction = "STSNavigate('" + ctx.editFormUrl+"?ID="+ currentItemID + 
                "&Source=" + GetSource() + RootFolder + "')";
    strImagePath = ctx.imagesPath + "edititem.gif";
    CAMOpt(m, strDisplayText, strAction, strImagePath);
    if (currentItemFSObjType != 1) 
    {
        if (ctx.isWebEditorPreview == 0)
        {
            if (ctx.listTemplate == LISTTEMPLATE_IMAGE_LIBRARY && itemTable.IsImage == "1")
            {
                strDisplayText = L_EditInOIS_Text;
                strAction = "EditSingleImage('" + currentItemID  + "')";
                strImagePath = ctx.imagesPath + "oisweb.gif";
                CAMOpt(m, strDisplayText, strAction, strImagePath);
            }
            else
            {
                setDocType();
                if (currentItemAppName != "" && currentItemOpenControl != "")
                {
                    strDisplayText = StBuildParam(L_EditIn_Text, currentItemAppName);
                    strAction = "editDocumentWithProgID2('" + currentItemFileUrl + "', '" + currentItemProgId + "', '" + currentItemOpenControl + "')";
                    strImagePath = ctx.imagesPath + currentItemIcon;
                    CAMOpt(m, strDisplayText, strAction, strImagePath);
                }
            }
        }
    }
    strDisplayText = L_DeleteDocItem_Text;
    strAction = "DeleteDocLibItem('" + 
            ctx.HttpPath + "&Cmd=Delete&List=" + ctx.listName + 
            "&ID=" + currentItemID + "&owsfileref=" +
            currentItemEscapedFileUrl + "&NextUsing=" + GetSource() + "')";
    strImagePath = ctx.imagesPath + "delitem.gif";
    CAMOpt(m, strDisplayText, strAction, strImagePath);
    if (ctx.isModerated == true)
    {
        strDisplayText = L_ModerateItem_Text;
        strAction = "STSNavigate('" + ctx.editFormUrl+"?ID="+ currentItemID + "&ChangeApproval=TRUE&Source=" +
                    GetSource() + RootFolder + "')";
        strImagePath = "";
        CAMOpt(m, strDisplayText, strAction, strImagePath);
    }
    if (currentItemFSObjType != 1 && ctx.listTemplate == LISTTEMPLATE_IMAGE_LIBRARY)
    {
        strAction = "DownloadOriginalImage(" + currentItemID + ")";
        strImagePath = ctx.imagesPath + "download.gif";
        strDisplayText = L_DownloadOriginal_Text;
        CAMOpt(m, strDisplayText, strAction, strImagePath);
    }
    if (currentItemFSObjType != 1) 
    {
        CAMSep(m);
        AddCheckinCheckoutMenuItem(m, ctx, currentItemEscapedFileUrl);
        AddVersionsMenuItem(m, ctx, currentItemEscapedFileUrl);
		CAMSep(m);
        if (ctx.PortalUrl != null)
        {
            strDisplayText = L_AddToMyLinks_Text;
            strAction = "Portal_Tasks('PinToMyPage')"; ;
            strImagePath = "";
            CAMOpt(m, strDisplayText, strAction, strImagePath);
            strDisplayText = L_AddToCategory_Text;
            strAction = "Portal_Tasks('Categorize')"; ;
            strImagePath = "";
            CAMOpt(m, strDisplayText, strAction, strImagePath);
            CAMSep(m);
        }
    }
    strDisplayText = L_Subscribe_Text;
    strAction = "NavigateToSubNewAspx('" + ctx.HttpRoot + "', 'List=" + ctx.listName + "&ID=" + currentItemID + "')";
    strImagePath = "";
    CAMOpt(m, strDisplayText, strAction, strImagePath);
    if (currentItemFSObjType != 1) 
    {
        strDisplayText = L_Discuss_Text;
        strAction = "STSNavigate('" + ctx.HttpPath + "&Cmd=COMMFRMS&URL=";
        if (ctx.isWebEditorPreview == 0)
            strAction += currentItemEscapedFileUrl;
        strAction += "')";
        strImagePath = ctx.imagesPath + "icdisc.gif";
        CAMOpt(m, strDisplayText, strAction, strImagePath);
        if (ctx.listTemplate != LISTTEMPLATE_IMAGE_LIBRARY)
        	AddWorkspaceMenuItem(m, ctx);
    }
}
function AddCheckinCheckoutMenuItem(m, ctx, url)
{
    if (currentItemCheckedOutUserId == null)
        currentItemCheckedOutUserId = itemTable.COUId;
    if (currentItemCheckedOutUserId != "")
       {
       strDisplayText = L_Checkin_Text;
       strAction = "NavigateToCheckinAspx('" + ctx.HttpRoot + "', 'FileName=" + url + "')";
       strImagePath = ctx.imagesPath + "checkin.gif";
       }
    else
       {
       strDisplayText = L_Checkout_Text;
       strAction = "NavigateToCheckinAspx('" + ctx.HttpRoot + "', 'FileName=" + url + "&Checkout=true')";
       strImagePath = ctx.imagesPath + "checkout.gif";
       }
    CAMOpt(m, strDisplayText, strAction, strImagePath);
}
function AddWorkspaceMenuItem(m, ctx)
{
    if (itemTable.SourceUrl != null && itemTable.SourceUrl != "" && itemTable.SourceUrl != "%20")
    {
        strAction = "STSNavigate('" + ctx.HttpRoot + "/_layouts/" + L_Language_Text + "/publishback.aspx?list=" + ctx.listName + "&item=" + currentItemID + GetRootFolder(ctx) + "')";
        CAMOpt(m, L_PublishBack_Text, strAction, "");
    }
    else
    {
        strAction = "STSNavigate('" + ctx.HttpRoot + "/_layouts/" + L_Language_Text + "/createws.aspx?list=" + ctx.listName + "&item=" + currentItemID + GetRootFolder(ctx) + "')";
        CAMOpt(m, L_CreateDWS_Text, strAction, "");
    }
}
function AddVersionsMenuItem(m, ctx, url)
{
    strDisplayText = L_Versions_Text;
    strAction = "NavigateToVersionsAspx('" + ctx.HttpRoot + "', 'list=" + ctx.listName + "&FileName=" + url +"')";
    strImagePath = ctx.imagesPath + "versions.gif";
    CAMOpt(m, strDisplayText, strAction, strImagePath);
}
function AddVersionMenuItems(m, ctx)
{      
    CAMOpt(m, L_ViewVersion_Text, "javascript:ViewVersion()", "");
    CAMOpt(m, L_RestoreVersion_Text, "javascript:RestoreVersion()", "");
    CAMOpt(m, L_DeleteVersion_Text, "javascript:DeleteVersion()", "");
}
function ViewVersion()
{
    if (!ViewDoc(itemTable.verUrl))
        STSNavigate(itemTable.verUrl);
}
var L_Version_Restore_Confirm_Text = "\u60a8\u5c06\u7528\u6240\u9009\u7248\u672c\u66ff\u6362\u5f53\u524d\u7248\u672c\u3002";
var L_Version_RestoreVersioningOff_Confirm_Text = "\u7248\u672c\u63a7\u5236\u5f53\u524d\u88ab\u7981\u7528\u3002\u56e0\u6b64\uff0c\u60a8\u5c06\u8986\u76d6\u5f53\u524d\u7248\u672c\u3002\u5bf9\u6b64\u7248\u672c\u7684\u6240\u6709\u66f4\u6539\u90fd\u5c06\u4e22\u5931\u3002";
var L_Version_NoRestore_Current_ERR = "\u65e0\u6cd5\u6062\u590d\u5f53\u524d\u7248\u672c\u3002";
function RestoreVersion()
{
    if (! IsContextSet()) 
        return;
    var ctx = currentCtx;
    if (itemTable.isCur != "0")
    {
        alert(L_Version_NoRestore_Current_ERR);
    }
    else if (confirm(ctx.verEnabled ? L_Version_Restore_Confirm_Text : L_Version_RestoreVersioningOff_Confirm_Text))
    {
        SubmitFormPost(ctx.HttpPath+"&op=Restore&ver="+itemTable.verId);
    }
}
var L_Version_Delete_Confirm_Text = "\u60a8\u5c06\u5220\u9664\u6b64\u7248\u672c\u3002";
var L_Version_NoDelete_Current_ERR = "\u65e0\u6cd5\u5220\u9664\u5f53\u524d\u7248\u672c\u3002";
function DeleteVersion()
{
    if (! IsContextSet()) 
        return;
    var ctx = currentCtx;
    if (itemTable.isCur != "0")
    {
        alert(L_Version_NoDelete_Current_ERR);
    }
    else if (confirm(L_Version_Delete_Confirm_Text))
    {
        SubmitFormPost(ctx.HttpPath+"&op=Delete&ver="+itemTable.verId);
    }
}
var L_Version_DeleteAll_Confirm_Text = "\u60a8\u5c06\u5220\u9664\u4e0e\u6b64\u6587\u4ef6\u5173\u8054\u7684\u6240\u6709\u4ee5\u524d\u7248\u672c\u3002";
var L_Version_NoDeleteAll_None_ERR = "\u6ca1\u6709\u8981\u5220\u9664\u7684\u4ee5\u524d\u7248\u672c\u3002";
function DeleteAllVersions(nVers, ctx)
{
    if (nVers <= 1)
    {
        alert(L_Version_NoDeleteAll_None_ERR);
    }
    else if (confirm(L_Version_DeleteAll_Confirm_Text))
    {
        SubmitFormPost(ctx.HttpPath+"&op=DeleteAll");
    }
}
function NavigateToSubNewAspx(strHttpRoot, strArgs)
{
    STSNavigate(strHttpRoot + "/_layouts/" + L_Language_Text + "/SubNew.aspx?" + strArgs + "&Source=" + GetSource());
}
function NavigateToVersionsAspx(strHttpRoot, strArgs)
{
    STSNavigate(strHttpRoot + "/_layouts/" + L_Language_Text + "/Versions.aspx?" + strArgs + "&Source=" + GetSource());
}
function NavigateToCheckinAspx(strHttpRoot, strArgs)
{
    SubmitFormPost(strHttpRoot + "/_layouts/" + L_Language_Text + 
    			"/Checkin.aspx?" + strArgs + "&Source=" + GetSource());
}
function setDocType()
{
    var strArray;
    strArray = itemTable.DocIcon.split("|");
    currentItemIcon = strArray[0];
    currentItemAppName = strArray[1];
    currentItemOpenControl = strArray[2];
    currentItemProgId = itemTable.HTMLType;
}
function DeleteListItem()
{
    if (! IsContextSet()) 
        return;
    var ctx = currentCtx;    
    if (confirm(L_STSDelConfirm_Text))
    {
        SubmitFormPost(ctx.HttpPath + "&Cmd=Delete&List=" + ctx.listName + 
                    "&ID=" + currentItemID + "&NextUsing=" + GetSource());
    }
}
function DeleteDocLibItem(delUrl)
{        
    if (! IsContextSet()) 
        return;
    if (confirm(currentItemFSObjType == 1  ? L_STSDelConfirm1_Text : L_STSDelConfirm_Text))
    {
        SubmitFormPost(delUrl);
    }
}
function EditMenuDefaultForOnclick()
{
    if (! IsContextSet()) 
        return;
    var ctx = currentCtx;
    if (ctx.isVersions)
    {
        STSNavigate(itemTable.verUrl);
    }
    else if (ctx.listTemplate == LISTTEMPLATE_MEETINGS)
    {
       var currentInstanceID = currentItemID;
       MtgNavigate(currentInstanceID);
    }
    else
    {
       EditListItem();
    }
}
function EditListItem()
{
	if (event.srcElement.tagName=="A" ||
        event.srcElement.parentNode.tagName == "A")
        return;
    if (! IsContextSet()) 
        return;
    var ctx = currentCtx;
    var editFormUrl =  ctx.editFormUrl + "?ID=" + currentItemID + 
                       "&Source=" + GetSource()
    if (ctx.listBaseType == BASETYPE_DOCUMENT_LIBRARY)
        editFormUrl = editFormUrl + GetRootFolder(ctx)
    STSNavigate(editFormUrl);
}
function DoNavigateToTemplateGallery(strSaveLocUrl, strTGUrl)
{
    document.cookie = "MSOffice_AWS_DefSaveLoc=" + strSaveLocUrl;
    STSNavigate(strTGUrl);
}
function Portal_Tasks(cmd)
{
    if (! IsContextSet()) 
        return;
    var ctx = currentCtx;
    var fileRef = unescapeProperly(currentItemFileUrl);
    var idx1=0, idx2=0;
    idx1 = fileRef.lastIndexOf("/")
    idx2 = fileRef.lastIndexOf(".")
    if (idx1 < 0 || idx2 < 0 || idx1 > idx2) 
        return;
    var fileName = fileRef.substr(idx1+1, idx2-idx1-1);
    var serverUrl = "";
    idx1 = ctx.HttpRoot.indexOf("://");
    if (idx1 > 0)	
    {
        idx2 = ctx.HttpRoot.indexOf("/", idx1  + 3);
        if (idx2 > 0)
            serverUrl = ctx.HttpRoot.substring(0, idx2);
        else
            serverUrl = ctx.HttpRoot;
    }
    var currentItemFileFullUrl = "";
    if (currentItemFileUrl.charAt(0) == "/"
        || currentItemFileUrl.substr(0,3).toLowerCase() == "%2f")
    {
        currentItemFileFullUrl = serverUrl + currentItemFileUrl;
    }
    else
    {
        currentItemFileFullUrl = currentItemFileUrl;
    }
    var strParams = "";
    if (false ==setElementValue("ListViewURL", currentItemFileFullUrl))
    {
        strParams = strParams + "&ListViewURL=" + escapeProperly(currentItemFileFullUrl);
    }
    if (false == setElementValue("ListTitle", fileName))
    {
        strParams = strParams + "&ListTitle=" + escapeProperly(fileName);
    }
    if (false == setElementValue("ListDescription", ""))
    {
        strParams = strParams + "&ListDescription=";
    }
    if (false == setElementValue("ReturnUrl", window.location.href))
    {
        strParams = strParams + "&ReturnUrl=" + escapeProperly(window.location.href);
    }
    if (ctx.PortalUrl.substr(0, 4) != "http")
    { 
		ctx.PortalUrl = serverUrl + ctx.PortalUrl;
    }
    var url = ctx.PortalUrl + "_vti_bin/portalapi.aspx?cmd=" + cmd;
    url = url + "&IconUrl=" + ctx.imagesPath + currentItemIcon + strParams;
    SubmitFormPost(url);
}
function IsContextSet()
{
    if (currentCtx == null || currentCtx.HttpPath == null ||
        currentItemID == null)
        return false;
    else
        return true;
}
var IMNControlObj = null;
var bIMNControlInited = false;
var IMNDictionaryObj = null;
var bIMNSorted = false;
var bIMNOnloadAttached = false;
var IMNOrigScrollFunc = null;
var bIMNInScrollFunc = false;
var IMNSortableObj = null;
var IMNHeaderObj = null;
var IMNNameDictionaryObj = null;
var IMNShowOfflineObj = null;
function EnsureIMNControl()
{
    if (!bIMNControlInited)
    {
        if (browseris.ie5up && browseris.win32)
        {
//@cc_on
//@if (@_jscript_version >= 5)
//@            try
//@            {
//@                IMNControlObj = new ActiveXObject("Name.NameCtrl.1");
//@            } catch(e)
//@            {
//@                
//@            };
//@else
//@end
        }
        bIMNControlInited = true;
        if (IMNControlObj)
        {
            IMNControlObj.OnStatusChange = IMNOnStatusChange;
        }
    }
    return IMNControlObj;
}
function IMNGetStatusImage(state, showoffline)
{
    var img = "blank.gif";
    switch (state)
    {
        case 0:
            img = "imnon.gif";
        break;      
        case 1:
            if (showoffline)
            {
                img = "imnoff.gif";
            }
            else
            {
                img = "blank.gif";
            }
        break;  
        case 2:
            img = "imnaway.gif";
        break;
        case 3:
            img = "imnbusy.gif";
        break;
        case 4:
            img = "imnaway.gif";
        break;
        case 5:
            img = "imnbusy.gif";
        break;
        case 6:
            img = "imnaway.gif";
        break;
    }
    return img;
}
function IMNGetHeaderImage()
{
    return "imnhdr.gif";
}
function IMNIsOnlineState(state)
{
    if (state == 1)
    {
            return false;
    }
    return true;
}
function IMNSortList(j, oldState, state)
{
    var objTable = null; 
    var objRow = null;
    if (IMNSortableObj && IMNSortableObj[j])
    {
        objRow = document.getElementById(j);
        while (objRow && !(objRow.tagName == "TR" &&
               typeof(objRow.Sortable) != "undefined"))
        {
            objRow = objRow.parentNode;
        }
        objTable = objRow;
        while (objTable && objTable.tagName != "TABLE")
        {
            objTable = objTable.parentNode;
        }
        if (objTable != null && objRow != null)
        {
            if (objTable.rows[1].style.display == "none")
            {
                for (i=1; i<4; i++)
                {
                    objTable.rows[i].style.display = "block";
                }
            }
            if (!IMNIsOnlineState(oldState) && IMNIsOnlineState(state))
            {
                objTable.rows[2].style.display = "none"; 
                i = 3;
                while (objTable.rows[i].id != "Offline" && objTable.rows[i].innerText < objRow.innerText)
                	i++;
                objTable.moveRow(objRow.rowIndex, i); 
                if (	objTable.rows[objTable.rows.length - 3].id == "Offline")
                {   
                    objTable.rows[objTable.rows.length - 2].style.display = "block"; 
                }
            }
            else if (IMNIsOnlineState(oldState) && !IMNIsOnlineState(state))
            {
                if (objRow.rowIndex == 3 && 
                	objTable.rows[objRow.rowIndex + 1].id == "Offline")
                {   
                    objTable.rows[2].style.display = "block"; 
                }
                if (objTable.rows[objTable.rows.length - 3].id == "Offline")
                {   
                    objTable.rows[objTable.rows.length - 2].style.display = "none"; 
                }
                i = objTable.rows.length - 2;
                while (objTable.rows[i - 1].id != "Offline" && objTable.rows[i].innerText > objRow.innerText)
                    i--;
                objTable.moveRow(objRow.rowIndex, i); 
            }
        }
    }
}
function IMNOnStatusChange(name, state, id)
{
    if (IMNDictionaryObj)
    {
        var img = IMNGetStatusImage(state, IMNSortableObj[id] ||
                                    IMNShowOfflineObj[id]);
        if (IMNDictionaryObj[id] != state)
        {
            if (bIMNSorted)
                IMNSortList(id, IMNDictionaryObj[id], state);
            IMNUpdateImage(id, img);
            IMNDictionaryObj[id] = state;
        }
    }
}
function IMNUpdateImage(id, img)
{
    var obj = document.images(id);
    if (obj)
    {
        var oldImg = obj.src;
        var index = oldImg.lastIndexOf("/");
        var newImg = oldImg.slice(0, index + 1);
        newImg += img;
        if (oldImg != newImg)
            obj.src = newImg;
        if (obj.altbase)
        {
            obj.alt = obj.altbase;
        }
    }
}
function IMNHandleAccelerator()
{
    if (IMNControlObj)
    {
       if (event.altKey && event.shiftKey &&
            event.keyCode==121)
        {
           IMNControlObj.DoAccelerator();
        }
    }
}
function IMNGetOOUILocation(obj)
{
    var objRet = new Object;
    var objSpan = obj;
    var objOOUI = obj;
    var oouiX = 0, oouiY = 0, objDX = 0;
    var fRtl = document.dir == "rtl";
    while (objSpan && objSpan.tagName != "SPAN" && objSpan.tagName != "TABLE")
    {
        objSpan = objSpan.parentNode;
    }
    if (objSpan)
    {
       var collNodes = objSpan.tagName == "TABLE" ?
                       objSpan.rows(0).cells(0).childNodes :
                       objSpan.childNodes;
       var i;
       for (i = 0; i < collNodes.length; ++i)
       {   
           if (collNodes.item(i).tagName == "IMG" && collNodes.item(i).id)
           {
               objOOUI = collNodes.item(i);
               break;
           }
       }
    }
    obj = objOOUI;
    while (obj)
    {
        if (fRtl)
        {
             if (obj.scrollWidth >= obj.clientWidth + obj.scrollLeft)        
                  objDX = obj.scrollWidth - obj.clientWidth - obj.scrollLeft;             
             else
                  objDX = obj.clientWidth + obj.scrollLeft - obj.scrollWidth;
             oouiX += obj.offsetLeft + objDX;
        }
        else
            oouiX += obj.offsetLeft - obj.scrollLeft;
        oouiY += obj.offsetTop - obj.scrollTop;
        obj = obj.offsetParent;            
    }
    try
    {
        obj = window.frameElement;
        while (obj)
        {
            if (fRtl)
            {
                if (obj.scrollWidth >= obj.clientWidth + obj.scrollLeft)        
                    objDX = obj.scrollWidth - obj.clientWidth - obj.scrollLeft;             
                else
                    objDX = obj.clientWidth + obj.scrollLeft - obj.scrollWidth;
                oouiX += obj.offsetLeft + objDX;
            }
            else
                oouiX += obj.offsetLeft - obj.scrollLeft;
            oouiY += obj.offsetTop - obj.scrollTop;
            obj = obj.offsetParent;
        }
    } catch(e)
    {
    };
    objRet.objSpan = objSpan;
    objRet.objOOUI = objOOUI;
    objRet.oouiX = oouiX;
    objRet.oouiY = oouiY;
    if (fRtl)
        objRet.oouiX += objOOUI.offsetWidth;
    return objRet;
}
function IMNShowOOUIMouse()
{
    IMNShowOOUI(0);
}
function IMNShowOOUIKyb()
{
    IMNShowOOUI(1);
}
function IMNShowOOUI(inputType)
{
    if (browseris.ie5up && browseris.win32)
    {
        var obj = window.event.srcElement;
        var objSpan = obj;
        var objOOUI = obj;
        var oouiX = 0, oouiY = 0;
        if (EnsureIMNControl() && IMNNameDictionaryObj)
        {
            var objRet = IMNGetOOUILocation(obj);
            objSpan = objRet.objSpan;
            objOOUI = objRet.objOOUI;
            oouiX = objRet.oouiX;
            oouiY = objRet.oouiY;
            var name = IMNNameDictionaryObj[objOOUI.id];
            if (objSpan)
                objSpan.onkeydown = IMNHandleAccelerator;
            IMNControlObj.ShowOOUI(name, inputType, oouiX, oouiY);
        }
    }
}
function IMNHideOOUI()
{
    if (IMNControlObj)
    {
        IMNControlObj.HideOOUI();
        return false;
    }
    return true;
}
function IMNScroll()
{
    if (!bIMNInScrollFunc)
    {
        bIMNInScrollFunc = true;
        IMNHideOOUI();
    }
    bIMNInScrollFunc = false;
    return IMNOrigScrollFunc ? IMNOrigScrollFunc() : true;   
}
function IMNRC(name)
{
    if (name == null || name == '')
        return;
    if (browseris.ie5up && browseris.win32)
    {
        var obj = window.event.srcElement;
        var objSpan = obj;
        var id = obj.id;
        var fFirst = false;
        if (!IMNDictionaryObj)
        {
            IMNDictionaryObj = new Object();
            IMNNameDictionaryObj = new Object();
            IMNSortableObj = new Object();
            IMNShowOfflineObj = new Object();
            if (!IMNOrigScrollFunc)
            {
                IMNOrigScrollFunc = window.onscroll;
                window.onscroll = IMNScroll;
            }
        }
        if (IMNDictionaryObj)
        {
            if (!IMNNameDictionaryObj[id])
            {
                IMNNameDictionaryObj[id] = name;
                fFirst = true;
            }
            if (typeof(IMNDictionaryObj[id]) == "undefined")
            {
                IMNDictionaryObj[id] = 1;
            }
            if (!IMNSortableObj[id] &&
                (typeof(obj.Sortable) != "undefined"))
            {
                IMNSortableObj[id] = obj.Sortable;
                if (!bIMNOnloadAttached)
                {
                    if (EnsureIMNControl() && IMNControlObj.PresenceEnabled)
                        window.attachEvent("onload", IMNSortTable);
                    bIMNOnloadAttached = true;
                }
            }
            if (!IMNShowOfflineObj[id] &&
                (typeof(obj.ShowOfflinePawn) != "undefined"))
            {
                IMNShowOfflineObj[id] = obj.ShowOfflinePawn;
            }
            if (fFirst && EnsureIMNControl() && IMNControlObj.PresenceEnabled)
            {
                var state = 1, img;
                state = IMNControlObj.GetStatus(name, id);
                if (IMNIsOnlineState(state) || IMNSortableObj[id] ||
                    IMNShowOfflineObj[id])
                {
                    img = IMNGetStatusImage(state, IMNSortableObj[id] ||
                                            IMNShowOfflineObj[id]);
                    IMNUpdateImage(id, img);
                    IMNDictionaryObj[id] = state;
                }
            }        
        }
        if (fFirst)
        {
            var objRet = IMNGetOOUILocation(obj);
            objSpan = objRet.objSpan;
            if (objSpan)
            {
                objSpan.onmouseover = IMNShowOOUIMouse;
                objSpan.onfocusin = IMNShowOOUIKyb;
                objSpan.onmouseout = IMNHideOOUI;
                objSpan.onfocusout = IMNHideOOUI;
            }
        }
    }
}
function IMNSortTable()
{
    var id;
    for (id in IMNDictionaryObj)
    {
        IMNSortList(id, 1, IMNDictionaryObj[id]);
    }
    bIMNSorted = true;
}
function IMNRegisterHeader()
{
    if (browseris.ie5up && browseris.win32)
    {
        var obj = window.event.srcElement;
        if (!IMNHeaderObj)
        {
            IMNHeaderObj = new Object();
        }
        if (IMNHeaderObj)
        {
            var id = obj.id;
            if (!IMNHeaderObj[id])
            {
                IMNHeaderObj[id] = id;
                var img;
                img = IMNGetHeaderImage();
                IMNUpdateImage(id, img);
            }
        }
    }
}
function HelpWindowHelper(strParam)
{
    var strHelpUrl;
    if (strParam == "")
        strHelpUrl = "/_layouts/" + L_Language_Text + "/help.aspx" + "?LCID=" + L_Language_Text;
    else
        strHelpUrl = "/_layouts/" + L_Language_Text + "/help.aspx" + strParam + "&LCID=" + L_Language_Text;
    var wndHelp = window.open(strHelpUrl, "STSHELP", "width=270,height=500,menubar,scrollbars,toolbar,resizable");
    wndHelp.focus();
}
function HelpWindowKey(strKey)
{
    if(typeof(navBarHelpOverrideKey) != "undefined" &&
       strKey.toLowerCase() == "navbarhelphome")
       strKey = navBarHelpOverrideKey;
    HelpWindowHelper("?Key=" + strKey);
}
function HelpWindowUrl(strUrl)
{
    HelpWindowHelper("?Url=" + strUrl);
}
function HelpWindow()
{
    HelpWindowKey("helphome");
}
var L_EmptySlideShow_Text = "\u8be5\u5e93\u4e2d\u627e\u4e0d\u5230\u4efb\u4f55\u56fe\u7247\u3002\u8bf7\u6dfb\u52a0\u56fe\u7247\uff0c\u7136\u540e\u518d\u8bd5\u4e00\u6b21\u3002";
var L_NotOurView_Text = "\u8be5\u64cd\u4f5c\u4e0d\u80fd\u5728\u5f53\u524d\u89c6\u56fe\u4e2d\u5b8c\u6210\u3002\u8bf7\u9009\u62e9\u5176\u4ed6\u89c6\u56fe\u91cd\u8bd5\u3002";
var fImglibJssLoaded = false;
function EditSelectedImages()
{
    if (!fImglibJssLoaded)
    {
        alert(L_NotOurView_Text);
        return;    
    }
    _EditSelectedImages();
}
function DeleteImages()
{
    if (!fImglibJssLoaded)
    {
        alert(L_NotOurView_Text);
        return;    
    }
    _DeleteImages();
}
function SendImages()
{
    if (!fImglibJssLoaded)
    {
        alert(L_NotOurView_Text);
        return;    
    }
    _SendImages();
}
function DownloadImages()
{
    if (!fImglibJssLoaded)
    {
        alert(L_NotOurView_Text);
        return;    
    }
    _DownloadImages();
}
var MSOTlPn_prevBuilder=null;
var MSOTlPn_prevWidth = 0;
var MSOTlPn_prevHeight = 0;
var MSOTlPn_shownViewChangeWarning = false;
var MSOWebPartPage_hideNextBeforeUnload = false;
var MSOWebPartPage_partDeleted = "";
function MSOLayout_CheckAndSaveChanges()
{
	if(document.forms[MSOWebPartPageFormName].MSOLayout_LayoutChanges != null && document.forms[MSOWebPartPageFormName].MSOLayout_LayoutChanges.value != "")
	{
		MSOLayout_SaveChanges();
	}
}
function MSOWebPartPage_ExportCheckWarning(address, hasPersonalizations)
{
	var doexport = true;
	if (hasPersonalizations)
	{
		if (!confirm(MSOStrings.ExportPersonalizationDialogText))
		{
			doexport = false;
		}
	}
	if (doexport)
	{
		var oldSavePerformed = false;
		if(typeof(MSOWPSC_SavePerformed) == "boolean")
		{
			oldSavePerformed = MSOWPSC_SavePerformed;
		}
		MSOWebPartPage_SetWindowLocation(address);
		if(typeof(MSOWPSC_SavePerformed) == "boolean")
		{
			MSOWPSC_SavePerformed = oldSavePerformed;
			MSOWebPartPage_hideNextBeforeUnload = true;
		}	
	}
}
function MSOMode_SetMode(bAllUsers)
{
	var newUrl = MSOMode_GetNewUrl(bAllUsers);
	MSOLayout_CheckAndSaveChanges();
	if(document.forms[MSOWebPartPageFormName].MSOTlPn_View.value != 4)
	{
		document.forms[MSOWebPartPageFormName].MSOTlPn_View.value = 0;
		var toolPaneViewExpression = /[& | \?]ToolPaneView=[-0-9A-Z]*/ig;
		newUrl = MSOMode_RemoveMode(newUrl, toolPaneViewExpression);
	}
	document.forms[MSOWebPartPageFormName].MSOWebPartPage_Shared.value = bAllUsers ? "true" : "false";
	document.forms[MSOWebPartPageFormName].action = newUrl;
	document.forms[MSOWebPartPageFormName].submit();
}
function MSOMode_GetNewUrl(bAllUsers, newUrl)
{
	if (newUrl==null)
	{
		newUrl = document.location.href;
	}
	var personalViewExpression = /[& | \?]PageView=Personal/ig;
	var allUsersViewExpression = /[& | \?]PageView=Shared/ig;
	var newMode = "PageView=" + (bAllUsers ? "Shared" : "Personal");
	newUrl = MSOMode_RemoveMode(newUrl, personalViewExpression);
	newUrl = MSOMode_RemoveMode(newUrl, allUsersViewExpression);
	newUrl = MSOMode_AddMode(newUrl, allUsersViewExpression, newMode);
	return newUrl;
}
function MSOMode_RemoveMode(newUrl, regExpression)
{
	var hashMarkExpression = /\#/;
	var hashMarkIndex = newUrl.search(hashMarkExpression);
	if(hashMarkIndex != -1)
	{
		newUrl = newUrl.substring(0, hashMarkIndex);
	}
	var questionMarkExpression = /\?/;
	var questionMarkIndex = newUrl.search(questionMarkExpression);
	if(questionMarkIndex != -1)
	{
		var pathString = newUrl.substring(0, questionMarkIndex);
		var queryString = newUrl.substring(questionMarkIndex, newUrl.length);
		queryString = queryString.replace(regExpression,'');
		if(queryString.length != 0 && queryString.charAt(0) != '?')
		{
			queryString = "?" + queryString;
		}
		newUrl = pathString + queryString;
	}
	return newUrl;
}
function MSOMode_AddMode(newUrl, regExpression, stringToAdd)
{
	var hashMarkExpression = /\#/;
	var hashMarkIndex = newUrl.search(hashMarkExpression);
	if(hashMarkIndex != -1)
	{
		newUrl = newUrl.substring(0, hashMarkIndex);
	}
	var questionMarkExpression = /\?/;
	var questionMarkIndex = newUrl.search(questionMarkExpression);
	if(questionMarkIndex == -1 )
	{
		newUrl += '?' + stringToAdd; 
	}
	else
	{
		var queryString = newUrl.substring(questionMarkIndex, newUrl.length);
		if(queryString.search(regExpression) == -1)
		{
			newUrl += '&' + stringToAdd; 
		}		
	}
	return newUrl;
}
function MSOPGrid_BuilderVisible(builderID)
{
	MSOPGrid_HidePrevBuilder();
	MSOTlPn_prevBuilder=null;
	builderID.style.display='inline';
}
function MSOPGrid_HidePrevBuilder()
{
	if(MSOTlPn_prevBuilder !=null)
	{
		eval(MSOTlPn_prevBuilder).style.display='none'; 
	}
}
function MSOPGrid_doBuilder(builderUrl, editorId, dialogFeatures)
{
	var pReturnValue=showModalDialog(builderUrl,editorId,dialogFeatures);
	editorId.value=pReturnValue;
//@cc_on
//@if (@_jscript_version >= 5)
//@		try { editorId.focus(); } catch (exception) {}
//@else
//@end
}
function MSOWebPartPage_RestorePageDefault()
{
	if(confirm(MSOStrings.ResetPagePersonalizationDialogText))
	{
		var newInput = document.createElement('INPUT');
		//@cc_on
		//@if (@_jscript_version >= 5)
		//@		try
		//@else
		//@end
		{
			newInput.type='hidden';
		}
		//@cc_on
		//@if (@_jscript_version >= 5)
		//@		catch(e){newInput.style.display = 'none';}
		//@else
		//@end
		newInput.name = 'MSOWebPartPage_RestorePageDefault';
		newInput.value = 'true';
		document.forms[MSOWebPartPageFormName].appendChild(newInput);
		if(document.forms[MSOWebPartPageFormName].MSOLayout_LayoutChanges != null)
		{
			document.forms[MSOWebPartPageFormName].MSOLayout_LayoutChanges.value = ""
		}
		MSOMode_SetMode(false);
	}
}
function MSOWebPartPage_RestorePartDefaults(webPartID)
{
	if(confirm(MSOStrings.ResetPartPersonalizationDialogText))
	{
		var newInput = document.createElement('INPUT');
		//@cc_on
		//@if (@_jscript_version >= 5)
		//@		try
		//@else
		//@end
		{
			newInput.type='hidden';
		}
		//@cc_on
		//@if (@_jscript_version >= 5)
		//@		catch(e){newInput.style.display = 'none';}
		//@else
		//@end
		newInput.name = 'MSO_RestoreSettings';
		newInput.value = webPartID;
		document.forms[MSOWebPartPageFormName].appendChild(newInput);
		MSOMode_SetMode(false);
	}
}
function MSOWebPartPage_MenuDoPostBack(eventTarget, eventArgument) 
{
	var theform = document.forms[MSOWebPartPageFormName];
	var eventTargetField = theform.__EVENTTARGET;
	var eventArgumentField = theform.__EVENTARGUMENT;
	if(eventTargetField == null)
	{
		eventTargetField = document.createElement('INPUT');
		eventTargetField.style.display = 'none';
		eventTargetField.name = '__EVENTTARGET';
		document.forms[MSOWebPartPageFormName].appendChild(eventTargetField);
	}
	if(eventArgumentField == null)
	{
		eventArgumentField = document.createElement('INPUT');
		eventArgumentField.style.display = 'none';
		eventArgumentField.name = '__EVENTARGUMENT';
		document.forms[MSOWebPartPageFormName].appendChild(eventArgumentField);
	}
	eventTargetField.value = eventTarget;
	eventArgumentField.value = eventArgument;
	theform.submit();
}
function MSOWebPartPage_SignIn()
{
	var newInput = document.createElement('INPUT');
	//@cc_on
	//@if (@_jscript_version >= 5)
	//@		try
	//@else
	//@end
	{
		newInput.type='hidden';
	}
	//@cc_on
	//@if (@_jscript_version >= 5)
	//@		catch(e){newInput.style.display = 'none';}
	//@else
	//@end
	newInput.name = 'MSOWebPartPage_AnonymousAccessLogIn';
	newInput.value = "1";
	document.forms[MSOWebPartPageFormName].appendChild(newInput);
	document.forms[MSOWebPartPageFormName].submit();
}
function MSOWebPartPage_SetWindowLocation(newLocation)
{
	var newLocationLowerCase = newLocation.toLowerCase();
	if(newLocationLowerCase.indexOf('javascript:') == 0 || newLocationLowerCase.indexOf('vbscript:') == 0)
	{
		MSOWebPartPage_hideNextBeforeUnload = true;
	}
	window.location = newLocation;
}
function MSOWebPartPage_SetNewWindowLocation(newLocation)
{
	window.open(newLocation);
}
function MSOTlPn_onToolPaneCloseClick()
{
	var ToolPaneViewClosed = '0';
	var PostbackSourceSettingsHide = '49';
	MSOTlPn_ShowToolPaneWrapper(ToolPaneViewClosed, PostbackSourceSettingsHide);
}
function MSOPGrid_InvokeFPBuilder(type,arguments,editorCtrl)
{
	editorCtrl.value=window.external.InvokeBuilder(type,arguments,editorCtrl.id);
	editorCtrl.focus();
}
function MSOMenu_KeyboardClick(widget)
{
	for(var index=1; index < arguments.length; index++)
	{
		if(event.keyCode == arguments[index])
		{
			widget.click();
			event.returnValue = false;
			return;
		}
	}
}
function MSOTlPn_ToggleDisplay(strID,strImgName,strAnchorName,strAltExpandText,strAltCollapseText, strImageAnchorName)
{
	var fieldID= strID+'_STATEFIELD';
	var stateFieldValue;
	if( document.all.item(strID).style.display == 'none' )
	{
		document.all.item(strID).style.display = '';
		document.images[strImgName].src = '/_layouts/images/TPMin2.gif';
		document.images[strImgName].alt = strAltCollapseText;
		document.all.item(strImageAnchorName).title = strAltCollapseText;
		document.all.item(strAnchorName).title = strAltCollapseText;
		stateFieldValue = "1";
	}
	else
	{
		document.all.item(strID).style.display = 'none';
		document.images[strImgName].src = '/_layouts/images/TPMax2.gif';
		document.images[strImgName].alt = strAltExpandText;
		document.all.item(strImageAnchorName).title = strAltExpandText;
		document.all.item(strAnchorName).title= strAltExpandText;
		stateFieldValue = "0";
	}
	if(document.all[fieldID] != null)
	{
		document.all[fieldID].value = stateFieldValue;
	}
}			
var MSOTlPn_originalToolPaneWidth;
function MSOTlPn_onToolPaneMaxClick()
{
	var mod = 1;
	var minMaxIcon = document.all['MSOTlPn_minMaxIcon'];
	var newSrc = minMaxIcon.src.substring(0, minMaxIcon.src.lastIndexOf('/')+1);
	if (document.all['MSOTlPn_Tbl'].toolpaneWide == null)
	{
		MSOTlPn_originalToolPaneWidth = document.all['MSOTlPn_Tbl'].style.width;
		document.all['MSOTlPn_Tbl'].style.width = (parseInt(document.all['MSOTlPn_Tbl'].offsetWidth)+100).toString()+"px";
		newSrc += ((document.dir == "rtl") ? "tpmax.gif" : "tpmin.gif"); 
		minMaxIcon.title = MSOStrings.ToolPaneShrinkToolTip;
		minMaxIcon.alt = MSOStrings.ToolPaneShrinkToolTip;
		minMaxIcon.parentElement.title = MSOStrings.ToolPaneShrinkToolTip;
		document.all['MSOTlPn_Tbl'].toolpaneWide = "1";
	}
	else
	{
		document.all['MSOTlPn_Tbl'].style.width = MSOTlPn_originalToolPaneWidth;
		newSrc += ((document.dir == "rtl") ? "tpmin.gif" : "tpmax.gif"); 
		minMaxIcon.title = MSOStrings.ToolPaneWidenToolTip;
		minMaxIcon.alt = MSOStrings.ToolPaneWidenToolTip;
		minMaxIcon.parentElement.title = MSOStrings.ToolPaneWidenToolTip;
		document.all['MSOTlPn_Tbl'].toolpaneWide = null;
		mod = -1;
	}
	minMaxIcon.src = newSrc;
	var x = document.all['MSOTlPn_Tbl'];
	for(var i = 0; i < x.all.length; i++)
	{
//@cc_on
//@if (@_jscript_version >= 5)
//@		try
//@else
//@end
		{
			if (x.all(i).getAttribute('ms-TlPnWiden')=="true")
			{			
			   x.all(i).style.pixelWidth += mod*120;
			}
		}
//@cc_on
//@if (@_jscript_version >= 5)
//@		catch (e)
//@else
//@end
		{
		}
	}
	MSOTlPn_WindowResize();
}
function MSOTlPn_WindowResize()
{	
	var objToolPane = document.all['MSOTlPn_MainTD'];
	if (objToolPane == null || objToolPane.offsetWidth == 0) return;
	var widthToolPane = objToolPane.offsetWidth;
	var docFrame = (document.body.offsetWidth - document.body.clientWidth);
	var spDiv = document.all['MSOTlPn_WebPartPageDiv'];
	if ((spDiv.offsetWidth + objToolPane.offsetWidth) == document.body.clientWidth)
	{
		return;
	}
	var widthAncestors = 0;
	var next = spDiv.offsetParent;
	var elementWidth = 0;
	while (next != null)
	{
	    if (document.dir != "rtl")
	    {
		    elementWidth = next.offsetLeft + (next.offsetWidth - (next.clientLeft + next.clientWidth));
		    if (next.offsetParent != null)
		    {
		        elementWidth += next.offsetParent.clientLeft;
		    }
	    }
	    else
	    {
		    elementWidth = (next.offsetParent != null) ? (next.offsetParent.offsetWidth - (next.offsetLeft + next.offsetWidth)) : 0;
	    }
		widthAncestors += elementWidth;
		next = next.offsetParent;	
	}
	widthAncestors -= docFrame;
	var widthCenter = document.body.clientWidth - (widthAncestors + widthToolPane);
	if (widthCenter < 250) 
		widthCenter = 250;
	document.all['MSO_tblPageBody'].style.pixelWidth = widthCenter +widthToolPane;
	spDiv.style.pixelWidth = widthCenter;	
	if (window.event.type == "load" && document.all.MSOTlPn_TlPnCaptionSpan!= null)
		document.all.MSOTlPn_TlPnCaptionSpan.scrollIntoView(false);
}
function MSOTlPn_CheckUrl()
{
	var toolPaneViewExpression = /[& | \?]ToolPaneView=[-0-9A-Z]*/ig;
	var formAction = document.forms[MSOWebPartPageFormName].action;
	var newUrl;
	newUrl = MSOMode_RemoveMode(document.forms[MSOWebPartPageFormName].action, toolPaneViewExpression);
	document.forms[MSOWebPartPageFormName].action = newUrl;
}
function MSOTlPn_Resize(obj)
{
	if (MSOTlPn_prevWidth != obj.clientWidth)
	{
		MSOTlPn_prevWidth = obj.clientWidth;
		MSOTlPn_WindowResize();
	}
	if (MSOTlPn_prevHeight != document.body.clientHeight)
	{
		MSOTlPn_prevHeight = document.body.clientHeight;
		var spDiv = document.all['MSOTlPn_WebPartPageDiv'];
		spDiv.style.height = "100%";
		spDiv.style.height = spDiv.offsetHeight;
	}
}
function MSOWebPartPage_SetupFixedWidthWebParts()
{
	var fixedWidthTitles = document.all['MSOFixedWidthTitle'];
	if(fixedWidthTitles != null)
	{
		if(fixedWidthTitles.length > 0)
		{
			for(var elementIndex = 0; elementIndex < fixedWidthTitles.length; elementIndex++)
			{
				fixedWidthTitles[elementIndex].style.width = MSOWebPartPage_AllocateSpaceForFirstTD(fixedWidthTitles[elementIndex]);
			}
		}
		else
		{
			fixedWidthTitles.style.width = MSOWebPartPage_AllocateSpaceForFirstTD(fixedWidthTitles);
		}
	}
}
function MSOWebPartPage_AllocateSpaceForFirstTD(titleDiv)
{
	var tempElement = document.createElement("DIV");
	tempElement.style.width = titleDiv.fixedWidth;
	document.body.appendChild(tempElement);
	var pixelSize = tempElement.offsetWidth;
	document.body.removeChild(tempElement);
	var tempTable = MSOLayout_GetParentTable(titleDiv).cloneNode(true); 
	if(tempTable != 0) 
	{
		document.body.appendChild(tempTable);
		var tempTableRow = tempTable.rows(0);
		for(var index = 1; index < tempTableRow.cells.length; index++)
		{
			pixelSize -= tempTableRow.cells(index).offsetWidth;
		}
		document.body.removeChild(tempTable);
	}
	return (pixelSize < 1) ? 1 : pixelSize;
}
function MSOWebPartPage_FindControlName(name)
{
   var labelcollection = document.all.tags("label");
   if (labelcollection != null)
   {
	   for (i = 0; i < labelcollection.length; i++)
	   {
			var label = labelcollection[i];
			if (label.innerText == name)
			{
				if (label.htmlFor.indexOf("_EDITOR") != -1)
				{
					return(label.htmlFor);
				}
			}
	   }
   }
   return null;
}
function MSOTlPn_ListViewChange(strWarningText)
{
    if (MSOTlPn_shownViewChangeWarning)
        return;
    alert(strWarningText);
    MSOTlPn_shownViewChangeWarning = true;
}
function MSOTlPn_CustomWindowResize()
{
	var objToolPane = document.all['MSOTlPn_Tbl'];
	if (objToolPane == null || objToolPane.offsetWidth == 0) return;
	objToolPane.style.pixelWidth = document.body.clientWidth;
}
function MSOTlPn_ShowListFilter()
{
	if (document.all['WebPartListFilter'].style.display == 'none')
	{
		document.all['WebPartListFilter'].style.display = 'block'; 
		document.forms[MSOWebPartPageFormName].MSOGallery_FilterVisible.value = "true";
	}
	else
	{
		document.all['WebPartListFilter'].style.display = 'none';
		document.forms[MSOWebPartPageFormName].MSOGallery_FilterVisible.value = "false";
	}
}
function MSOGallery_GetCookie(name) 
{
	var prefix = name + "=";
	var cookieStartIndex = document.cookie.indexOf(prefix);
	if (cookieStartIndex == -1)
	{
		return null;
	}
	var cookieEndIndex = document.cookie.indexOf(";", cookieStartIndex + prefix.length);
	if (cookieEndIndex == -1)
	{
		cookieEndIndex = document.cookie.length;
	}
	return unescape(document.cookie.substring(cookieStartIndex + prefix.length, cookieEndIndex));
} 
function MSOTlPn_ShowAllUsersToolPane(view, source, storageKey)
{
	MSOLayout_CheckAndSaveChanges();
	document.forms[MSOWebPartPageFormName].action = MSOMode_GetNewUrl(true);
	MSOTlPn_ShowToolPaneWrapper(view, source, storageKey);
}
function MSOLayout_MakeInvisibleIfEmpty()
{
	var allElements = document.getElementsByName("_invisibleIfEmpty"); 
	var agt = navigator.userAgent.toLowerCase();
	var isNav = ((agt.indexOf('mozilla')!=-1)&&((agt.indexOf('spoofer')==-1) && (agt.indexOf('compatible')==-1)));
	var isIE = (agt.indexOf("msie")!=-1);
	for (var curElement = 0; curElement < allElements.length; curElement++) 
	{
		if ((isIE && allElements[curElement].childNodes.length == 0)
			|| (isNav && allElements[curElement].childNodes.length <= 1))
		{
			allElements[curElement].style.display = "none";
		}
	}
}
function MSOLayout_GetParentRow(tableCell)
{
	var parentRow = tableCell.parentElement;
	while(parentRow.tagName != "TR" && parentRow.tagName != "BODY") parentRow = parentRow.parentElement;
	if(parentRow.tagName != "TR")
	{
		return null;
	}
	else
	{
		return parentRow;
	}
}
function MSOLayout_GetParentTable(TableCell)
{
	for (var currentObject = TableCell; currentObject.tagName != 'TABLE'; currentObject = currentObject.parentElement)
	{
		if(currentObject == document.body) return 0;
	}
	return currentObject;
}
function ShowMtgNavigatorPane()
{
	document.getElementById("MeetingNavigatorPane").style.display = "block";
}
function HideMtgNavigatorPane()
{
	document.getElementById("MeetingNavigatorPane").style.display = "none";
}
function MtgShowTimeZone()
{
	if (GetCookie("MtgTimeZone") == "1")
	{
		MtgToggleTimeZone();
	}
}
function MtgToggleTimeZone() 
{
    var timezoneElem = document.getElementById("TimeZoneSection");
    var timezoneLinkElem = document.getElementById("TimeZoneLink");
    var L_ShowTZ_Text = "\u663e\u793a\u65f6\u533a";
    var L_HideTZ_Text = "\u9690\u85cf\u65f6\u533a";    
    if ( timezoneElem.style.display == "none" )
    {
        timezoneElem.style.display = "inline";
        timezoneLinkElem.innerHTML = "&lt;&lt;"
        timezoneLinkElem.title = L_HideTZ_Text;
        SetCookie("MtgTimeZone", "1", "");	
    }
    else
    {
        timezoneElem.style.display = "none";
        timezoneLinkElem.innerHTML = "&gt;&gt;"
        timezoneLinkElem.title = L_ShowTZ_Text;
        SetCookie("MtgTimeZone", "0", "");		
    }
}
function GetPageUrl(fHomePage)
{
	return unescapeProperly(fHomePage ? g_webUrl : g_pageUrl);
}
function MtgNavigate(instanceId)
{
	if (instanceId == g_instanceId)
		return;
	var fHomePage = !g_fPageGlobal;
	window.location.href = GetPageUrl(fHomePage) + '?InstanceID=' + instanceId + '&' + g_thispagedata;
}
function GoToMtgMove(listUrlDir, instanceId, instanceDateTime, instanceDateTimeISO)
{
	window.location.href = g_webUrl + '/' + listUrlDir + '/movetodt.aspx'
						+ '?FromInstanceID=' + instanceId
						+ '&FromInstanceDate=' + escapeProperly(instanceDateTime)
						+ '&FromInstanceDateISO=' + escapeProperly(instanceDateTimeISO)
						+ '&Source=' + escapeProperly(window.location.href);
}
function MtgKeep(httpPath, listId, instanceId)
{
	var L_MtgKeepConfirm_Text = "\u8be5\u4f1a\u8bae\u65e5\u671f\u4fe1\u606f\u4e0e\u60a8\u65e5\u5386\u548c\u8ba1\u5212\u7a0b\u5e8f\u4e2d\u7684\u4fe1\u606f\u4e0d\u5339\u914d\u3002\u5982\u679c\u4fdd\u7559\u6b64\u4f1a\u8bae\u65e5\u671f\uff0c\u5219\u65e5\u671f\u5c06\u51fa\u73b0\u5728\u5de5\u4f5c\u533a\u7684\u201c\u4f1a\u8bae\u7cfb\u5217\u201d\u5217\u8868\u4e2d\u3002";
	if (confirm(L_MtgKeepConfirm_Text))
		SubmitFormPost( httpPath
						+ '&Cmd=MtgKeep&List=' + escapeProperly(listId)
						+ '&EditInstanceID=' + instanceId
						+ '&NextUsing=' + escapeProperly(window.location.href) );
}
function MtgDelete(httpPath, listId, instanceId)
{
	var L_MtgDeleteConfirm_Text = "\u5173\u8054\u7684\u4f1a\u8bae\u65e5\u671f\u548c\u5185\u5bb9\u5c06\u4ece\u6b64\u5de5\u4f5c\u533a\u5220\u9664\u3002";
	if (confirm(L_MtgDeleteConfirm_Text))
	{
		var fHomePage = (instanceId == g_instanceId);
		SubmitFormPost( httpPath
						+ '&Cmd=MtgMove&List=' + escapeProperly(listId)
						+ '&FromInstanceID=' + instanceId + '&ToInstanceID=-3'
						+ '&NextUsing=' + escapeProperly(fHomePage ? GetPageUrl(true) : window.location.href) );
	}
}
function FormatDate(sDate, eDate)
{
	var sIdx = sDate.indexOf(" ");
	var sTime = sDate.substr(sIdx+1);
	sDate = sDate.substr(0, sIdx);
	var eIdx = eDate.indexOf(" ");
	var eTime = eDate.substr(eIdx+1);
	eDate = eDate.substr(0, eIdx);
	var L_Date_Text = "<b>\u65e5\u671f:</b>";
	var L_Time_Text = "<b>\u65f6\u95f4:</b>";
	var L_DateSeparator=" - ";
	if(browseris.win32 && sDate == eDate)
		L_DateSeparator= " -\u200e ";
	if (sDate == eDate)
	{
		document.write(L_Date_Text + " " + sDate);
		if (sTime != eTime)
			document.write(" " + L_Time_Text + " " + sTime + L_DateSeparator + eTime);
		else
			document.write(" " + L_Time_Text + " " + sTime);
	}
	else
	{
		document.write(L_Date_Text + " " + sDate + " (" + sTime + ")" + L_DateSeparator + eDate + " (" + eTime + ")");
	}
}
function SetCookie(name, value, path)
{
    document.cookie = name + "=" + value + ";path=" + path;
}
function SetAsLastTabVisited()
{
	if (typeof(g_pageUrl) != "undefined" && typeof(g_webUrl) != "undefined")
		SetCookie("MtgLastTabVisited",
			escapeProperly(unescapeProperly(g_pageUrl)),
			escapeProperlyCore(unescapeProperly(g_webUrl),  true));
}
function GetCookie(name)
{
  var aCookie = document.cookie.split("; ");
  for (var i=0; i < aCookie.length; i++)
  {
    var aCrumb = aCookie[i].split("=");
    if (name == aCrumb[0]) 
      return unescapeProperly(aCrumb[1]);
  }
  return null;
}
function MtgDeletePageConfirm()
{
	var L_DeleteGlobalConfirm_Text = "\u6b64\u7f51\u9875\u5c06\u4ece\u4e0e\u6b64\u5de5\u4f5c\u533a\u5173\u8054\u7684\u6240\u6709\u4f1a\u8bae\u4e2d\u5220\u9664\u3002";
	var L_DeleteConfirm_Text = "\u662f\u5426\u786e\u5b9e\u8981\u5220\u9664\u6b64\u7f51\u9875?";
	var text;
	if (document.getElementById("MtgTlPart_PageType").value == 'MtgTlPart_LocalPage')
		text = L_DeleteConfirm_Text;
	else
		text = L_DeleteGlobalConfirm_Text + L_DeleteConfirm_Text;
	return confirm(text);
}
function GetAlertText(isDetached)
{
	var L_DETACHEDSINGLEEXCEPT_Text    = "\u6b64\u4f1a\u8bae\u65e5\u671f\u4e0d\u518d\u4e0e\u65e5\u5386\u548c\u8ba1\u5212\u7a0b\u5e8f\u4e2d\u7684\u4f1a\u8bae\u76f8\u5173\u8054\u3002\u6b64\u4f1a\u8bae\u65e5\u671f\u53ef\u80fd\u5df2\u88ab\u53d6\u6d88\uff0c\u6216\u8005\u6307\u5411\u5de5\u4f5c\u533a\u7684\u94fe\u63a5\u5df2\u4ece\u8ba1\u5212\u4f1a\u8bae\u4e2d\u5220\u9664\u3002";
	var L_DETACHEDCANCELLEDEXCEPT_Text = "\u6b64\u4f1a\u8bae\u65e5\u671f\u5df2\u4ece\u65e5\u5386\u548c\u8ba1\u5212\u7a0b\u5e8f\u4e2d\u53d6\u6d88\u3002\u82e5\u8981\u6307\u5b9a\u8981\u5bf9\u5de5\u4f5c\u533a\u4e2d\u7684\u76f8\u5173\u8054\u4fe1\u606f\u6267\u884c\u7684\u64cd\u4f5c\uff0c\u8bf7\u6267\u884c\u4ee5\u4e0b\u64cd\u4f5c: \u5728\u201c\u4f1a\u8bae\u5e8f\u5217\u201d\u7a97\u683c\u4e2d\uff0c\u6307\u5411\u4f1a\u8bae\u65e5\u671f\uff0c\u7136\u540e\u5728\u4e0b\u62c9\u5217\u8868\u4e2d\uff0c\u5355\u51fb\u201c\u4fdd\u7559\u201d\u3001\u201c\u5220\u9664\u201d\u6216\u201c\u79fb\u52a8\u201d\u3002";
	var L_DETACHEDUNLINKEDSINGLE_Text  = "\u6b64\u4f1a\u8bae\u65e5\u671f\u4e0d\u518d\u4e0e\u65e5\u5386\u548c\u8ba1\u5212\u7a0b\u5e8f\u4e2d\u7684\u76f8\u5173\u8054\u4f1a\u8bae\u76f8\u94fe\u63a5\u3002\u82e5\u8981\u6307\u5b9a\u8981\u5bf9\u5de5\u4f5c\u533a\u4e2d\u7684\u4fe1\u606f\u6267\u884c\u7684\u64cd\u4f5c\uff0c\u8bf7\u6267\u884c\u4ee5\u4e0b\u64cd\u4f5c: \u5728\u201c\u4f1a\u8bae\u5e8f\u5217\u201d\u7a97\u683c\u4e2d\uff0c\u6307\u5411\u4f1a\u8bae\u65e5\u671f\uff0c\u7136\u540e\u5728\u4e0b\u62c9\u5217\u8868\u4e2d\uff0c\u5355\u51fb\u201c\u4fdd\u7559\u201d\u3001\u201c\u5220\u9664\u201d\u6216\u201c\u79fb\u52a8\u201d\u3002";
	var L_DETACHEDCANCELLEDSERIES_Text = "\u6b64\u4f1a\u8bae\u5e8f\u5217\u5df2\u4ece\u65e5\u5386\u548c\u8ba1\u5212\u7a0b\u5e8f\u4e2d\u53d6\u6d88\u3002";
	var L_DETACHEDUNLINKEDSERIES_Text  = "\u6b64\u4f1a\u8bae\u5e8f\u5217\u4e0d\u518d\u4e0e\u65e5\u5386\u548c\u8ba1\u5212\u7a0b\u5e8f\u4e2d\u7684\u76f8\u5173\u8054\u4f1a\u8bae\u5e8f\u5217\u76f8\u94fe\u63a5\u3002\u60a8\u53ef\u4fdd\u7559\u6216\u5220\u9664\u5de5\u4f5c\u533a\u3002\u5982\u679c\u4fdd\u7559\u5de5\u4f5c\u533a\uff0c\u5219\u5c06\u4e0d\u80fd\u628a\u8be5\u5de5\u4f5c\u533a\u94fe\u63a5\u5230\u5176\u4ed6\u8ba1\u5212\u4f1a\u8bae\u3002";
	var L_DETACHEDSERIESNOWSINGLE_Text = "\u6b64\u4f1a\u8bae\u5df2\u5728\u65e5\u5386\u548c\u8ba1\u5212\u7a0b\u5e8f\u4e2d\u4ece\u5b9a\u671f\u4f1a\u8bae\u66f4\u6539\u4e3a\u975e\u5b9a\u671f\u4f1a\u8bae\u3002\u60a8\u53ef\u4fdd\u7559\u6216\u5220\u9664\u5de5\u4f5c\u533a\u3002\u5982\u679c\u4fdd\u7559\u5de5\u4f5c\u533a\uff0c\u5219\u5c06\u4e0d\u80fd\u628a\u8be5\u5de5\u4f5c\u533a\u94fe\u63a5\u5230\u5176\u4ed6\u8ba1\u5212\u4f1a\u8bae\u3002";
	var L_DETACHEDSINGLENOWSERIES_Text = "\u6b64\u4f1a\u8bae\u5df2\u5728\u65e5\u5386\u548c\u8ba1\u5212\u7a0b\u5e8f\u4e2d\u4ece\u975e\u5b9a\u671f\u4f1a\u8bae\u66f4\u6539\u4e3a\u5b9a\u671f\u4f1a\u8bae\u3002\u5f53\u524d\u5de5\u4f5c\u533a\u4e0d\u652f\u6301\u5b9a\u671f\u4f1a\u8bae\u3002\u8bf7\u5728\u8ba1\u5212\u7a0b\u5e8f\u4e2d\uff0c\u53d6\u6d88\u4f1a\u8bae\u4e0e\u8be5\u5de5\u4f5c\u533a\u7684\u94fe\u63a5\uff0c\u7136\u540e\u518d\u5c06\u4f1a\u8bae\u94fe\u63a5\u5230\u65b0\u7684\u5de5\u4f5c\u533a\u3002\u65b0\u5de5\u4f5c\u533a\u5c06\u81ea\u52a8\u652f\u6301\u5b9a\u671f\u4f1a\u8bae\u3002";
	var L_DETACHEDNONGREGORIANCAL_Text = "\u521b\u5efa\u6b64\u4f1a\u8bae\u6240\u4f7f\u7528\u7684\u65e5\u5386\u548c\u8ba1\u5212\u7a0b\u5e8f\u4ec5\u652f\u6301\u5bf9\u4f1a\u8bae\u5de5\u4f5c\u533a\u7684\u7cfb\u5217\u66f4\u65b0\u3002\u5728\u8be5\u7a0b\u5e8f\u4e2d\u6240\u505a\u7684\u5355\u4e2a\u4f1a\u8bae\u66f4\u6539\u5c06\u4e0d\u4f1a\u663e\u793a\u5728\u8be5\u5de5\u4f5c\u533a\u4e2d\u3002";
	var L_DETACHEDPASTEXCPMODIFIED_Text = "\u6b64\u8fc7\u53bb\u7684\u4f1a\u8bae\u65e5\u671f\u5df2\u4ece\u65e5\u5386\u548c\u9884\u5b9a\u7a0b\u5e8f\u4e2d\u4fee\u6539\u6216\u53d6\u6d88\u3002\u82e5\u8981\u4fdd\u7559\uff0c\u5220\u9664\u6216\u79fb\u52a8\u5de5\u4f5c\u533a\u4e2d\u7684\u4f1a\u8bae\uff0c\u8bf7\u4f7f\u7528\u201c\u4f1a\u8bae\u5e8f\u5217\u201d\u7a97\u683c\u4e2d\u4f1a\u8bae\u65e5\u671f\u65c1\u7684\u4e0b\u62c9\u83dc\u5355\u3002\u82e5\u8981\u66f4\u65b0\u5de5\u4f5c\u533a\u4e2d\u4f1a\u8bae\u7684\u8ba1\u5212\u4fe1\u606f\uff0c\u8bf7\u4f7f\u7528\u8ba1\u5212\u7a0b\u5e8f\u66f4\u65b0\u7279\u5b9a\u4f1a\u8bae\u7684\u53d1\u751f\u65f6\u95f4\u3002";
	var howOrphaned = isDetached & (0x10 - 1);
	var howDetached = isDetached - howOrphaned;
	if (howOrphaned)
	{
		switch (howOrphaned)
		{
			case 1:	return (g_meetingCount == 1) ? L_DETACHEDSINGLEEXCEPT_Text : L_DETACHEDCANCELLEDEXCEPT_Text;
			case 2:	return L_DETACHEDCANCELLEDSERIES_Text;
			case 3: return L_DETACHEDCANCELLEDEXCEPT_Text;
			case 4:	return (g_meetingCount == 1) ? L_DETACHEDSINGLEEXCEPT_Text : L_DETACHEDUNLINKEDSINGLE_Text;
			case 5:	return L_DETACHEDUNLINKEDSERIES_Text;
			case 6:	return L_DETACHEDSERIESNOWSINGLE_Text;
			case 7:	return L_DETACHEDSINGLENOWSERIES_Text;
			case 8:	return L_DETACHEDPASTEXCPMODIFIED_Text;
		}
	}
	else if (howDetached)
	{
		switch (howDetached)
		{
			case 16: return L_DETACHEDNONGREGORIANCAL_Text;
		}
	}
	return null;
}
function MtgRedirect()
{
	var strServerRelative = GetCookie("MtgLastTabVisited");
	if (strServerRelative == null)
	{
		if (typeof(L_Menu_BaseUrl) != "undefined")
			strServerRelative = L_Menu_BaseUrl;
		else if (typeof(g_webUrl) != "undefined")
			strServerRelative = g_webUrl;
		else
			strServerRelative = "../../";
	}
	else
		strServerRelative = escapeProperlyCore(strServerRelative, true);
	window.location.href = strServerRelative;
}
function MakeMtgInstanceUrl(strUrl, instanceID)
{
	if (instanceID != "undefined" && instanceID != '')
	{
		var iQueryString = strUrl.indexOf('?');
		if (iQueryString == -1 || strUrl.indexOf('InstanceID=', iQueryString) == -1)
			strUrl = strUrl + (iQueryString == -1 ? '?' : '&') + 'InstanceID=' + instanceID;
	}
	return strUrl;
}

// SIG // Begin signature block
// SIG // MIIaIAYJKoZIhvcNAQcCoIIaETCCGg0CAQExCzAJBgUr
// SIG // DgMCGgUAMGcGCisGAQQBgjcCAQSgWTBXMDIGCisGAQQB
// SIG // gjcCAR4wJAIBAQQQEODJBs441BGiowAQS9NQkAIBAAIB
// SIG // AAIBAAIBAAIBADAhMAkGBSsOAwIaBQAEFFqWkS0XpjDQ
// SIG // mvaYu4qUOdM74r9ZoIIUvDCCArwwggIlAhBKGdI4jIJZ
// SIG // HKVdc18VXdyjMA0GCSqGSIb3DQEBBAUAMIGeMR8wHQYD
// SIG // VQQKExZWZXJpU2lnbiBUcnVzdCBOZXR3b3JrMRcwFQYD
// SIG // VQQLEw5WZXJpU2lnbiwgSW5jLjEsMCoGA1UECxMjVmVy
// SIG // aVNpZ24gVGltZSBTdGFtcGluZyBTZXJ2aWNlIFJvb3Qx
// SIG // NDAyBgNVBAsTK05PIExJQUJJTElUWSBBQ0NFUFRFRCwg
// SIG // KGMpOTcgVmVyaVNpZ24sIEluYy4wHhcNOTcwNTEyMDAw
// SIG // MDAwWhcNMDQwMTA3MjM1OTU5WjCBnjEfMB0GA1UEChMW
// SIG // VmVyaVNpZ24gVHJ1c3QgTmV0d29yazEXMBUGA1UECxMO
// SIG // VmVyaVNpZ24sIEluYy4xLDAqBgNVBAsTI1ZlcmlTaWdu
// SIG // IFRpbWUgU3RhbXBpbmcgU2VydmljZSBSb290MTQwMgYD
// SIG // VQQLEytOTyBMSUFCSUxJVFkgQUNDRVBURUQsIChjKTk3
// SIG // IFZlcmlTaWduLCBJbmMuMIGfMA0GCSqGSIb3DQEBAQUA
// SIG // A4GNADCBiQKBgQDTLiDwaHwsLS6BHLEGsqcLtxENV9pT
// SIG // 2HXjyTMqstT2CVs08+mQ/gkM0NsbWrnN5/aIsZ3AhyXr
// SIG // fVgQc2p4y3EV/cZY9imrWF6WBP0tYhFYgRzKcZTVIlgv
// SIG // 1cwUBYQ2upSqtE1K6e47Iq1WmX4hnGyGwEpHl2q0pjbV
// SIG // /Akt07Q5mwIDAQABMA0GCSqGSIb3DQEBBAUAA4GBAGFV
// SIG // Dj57x5ISfhEQjiLM1LMTK1voROQLeJ6kfvOnB3Ie4lnv
// SIG // zITjiZRM205h77Ok+0Y9UDQLn3BW9o4qfxfO5WO/eWkH
// SIG // cy6wlSiK9e2qqdJdzQrKEAmPzrOvKJbEeSmEktz/umdC
// SIG // SKaQEOS/YficU+WT0XM/+P2dT4SsVdH9EWNjMIIEAjCC
// SIG // A2ugAwIBAgIQCHptXG9ik0+6xP1D4RQYnTANBgkqhkiG
// SIG // 9w0BAQQFADCBnjEfMB0GA1UEChMWVmVyaVNpZ24gVHJ1
// SIG // c3QgTmV0d29yazEXMBUGA1UECxMOVmVyaVNpZ24sIElu
// SIG // Yy4xLDAqBgNVBAsTI1ZlcmlTaWduIFRpbWUgU3RhbXBp
// SIG // bmcgU2VydmljZSBSb290MTQwMgYDVQQLEytOTyBMSUFC
// SIG // SUxJVFkgQUNDRVBURUQsIChjKTk3IFZlcmlTaWduLCBJ
// SIG // bmMuMB4XDTAxMDIyODAwMDAwMFoXDTA0MDEwNjIzNTk1
// SIG // OVowgaAxFzAVBgNVBAoTDlZlcmlTaWduLCBJbmMuMR8w
// SIG // HQYDVQQLExZWZXJpU2lnbiBUcnVzdCBOZXR3b3JrMTsw
// SIG // OQYDVQQLEzJUZXJtcyBvZiB1c2UgYXQgaHR0cHM6Ly93
// SIG // d3cudmVyaXNpZ24uY29tL3JwYSAoYykwMTEnMCUGA1UE
// SIG // AxMeVmVyaVNpZ24gVGltZSBTdGFtcGluZyBTZXJ2aWNl
// SIG // MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA
// SIG // wHphh+uypwNjGysaYd6AtxUdoIuQPbsnkoQUOeuFzimS
// SIG // BmZIpANPjehPp/CvXtEvGceR8bWee5Ehzun/407w/K+V
// SIG // WLhjLeaO9ikYzXCOUMPtlrtA274l6EJV1vaF8gbni5kc
// SIG // MfMDD9RMnCQq3Bsbj4LzsO+nTeMUp+CP1sdowmFYqXLU
// SIG // +DBIT9kvb2Mg2YnKgnvCS7woxYFo5+aCQKxGOqD5PzbN
// SIG // TLtUQlp6ZXv+hOTHR1SsuT3sgMca98QzgYHJKpX7f146
// SIG // h5AU28wudfLva+Y9qWC+QgGqT6pbqD8iMZ8SFflzoR6C
// SIG // iwQr6kYCTG2PH1AulUsqeAaEdD2RjyxHMQIDAQABo4G4
// SIG // MIG1MEAGCCsGAQUFBwEBBDQwMjAwBggrBgEFBQcwAYYk
// SIG // aHR0cDovL29jc3AudmVyaXNpZ24uY29tL29jc3Avc3Rh
// SIG // dHVzMAkGA1UdEwQCMAAwRAYDVR0gBD0wOzA5BgtghkgB
// SIG // hvhFAQcBATAqMCgGCCsGAQUFBwIBFhxodHRwczovL3d3
// SIG // dy52ZXJpc2lnbi5jb20vcnBhMBMGA1UdJQQMMAoGCCsG
// SIG // AQUFBwMIMAsGA1UdDwQEAwIGwDANBgkqhkiG9w0BAQQF
// SIG // AAOBgQAt809jYCwY2vUkD1KzDOuzvGeFwiPtj0YNzxpN
// SIG // vvN8eiAwMhhoi5K7Mpnwk7g7FQYnez4CBgCkIZKEEwrF
// SIG // mOVAV8UFJeivrxFqqeU7y+kj9pQpXUBV86VTncg2Ojll
// SIG // CHNzpDLSr6y/xwU8/0Xsw+jaJNHOY64Jp/viG+P9QQpq
// SIG // ljCCBBIwggL6oAMCAQICDwDBAIs8PIgR0T72Y+zfQDAN
// SIG // BgkqhkiG9w0BAQQFADBwMSswKQYDVQQLEyJDb3B5cmln
// SIG // aHQgKGMpIDE5OTcgTWljcm9zb2Z0IENvcnAuMR4wHAYD
// SIG // VQQLExVNaWNyb3NvZnQgQ29ycG9yYXRpb24xITAfBgNV
// SIG // BAMTGE1pY3Jvc29mdCBSb290IEF1dGhvcml0eTAeFw05
// SIG // NzAxMTAwNzAwMDBaFw0yMDEyMzEwNzAwMDBaMHAxKzAp
// SIG // BgNVBAsTIkNvcHlyaWdodCAoYykgMTk5NyBNaWNyb3Nv
// SIG // ZnQgQ29ycC4xHjAcBgNVBAsTFU1pY3Jvc29mdCBDb3Jw
// SIG // b3JhdGlvbjEhMB8GA1UEAxMYTWljcm9zb2Z0IFJvb3Qg
// SIG // QXV0aG9yaXR5MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8A
// SIG // MIIBCgKCAQEAqQK9wXDmO/JOGyifl3heMOqiqY0lX/j+
// SIG // lUyjt/6doiA+fFGim6KPYDJr0UJkee6sdslU2vLrnIYc
// SIG // j5+EZrPFa3piI9YdPN4PAZLolsS/LWaammgmmdA6LL8M
// SIG // tVgmwUbnCj44liypKDmo7EmDQuOED7uabFVhrIJ8oWAt
// SIG // d0zpmbRkO5pQHDEIJBSfqeeRKxjmPZhjFGBYBWWfHTdS
// SIG // h/en75QCxhvTv1VFs4mAvzrsVJROrv2nem10Tq8YzJYJ
// SIG // KCEAV5BgaTe7SxIHPFb/W/ukZgoIptKBVlfvtjteFoF3
// SIG // BNr2vq6Alf6wzX/WpxpyXDzKvPAIoyIwswaFybMgdxOF
// SIG // 3wIDAQABo4GoMIGlMIGiBgNVHQEEgZowgZeAEFvQcO9p
// SIG // cp4jUX4Usk2O/8uhcjBwMSswKQYDVQQLEyJDb3B5cmln
// SIG // aHQgKGMpIDE5OTcgTWljcm9zb2Z0IENvcnAuMR4wHAYD
// SIG // VQQLExVNaWNyb3NvZnQgQ29ycG9yYXRpb24xITAfBgNV
// SIG // BAMTGE1pY3Jvc29mdCBSb290IEF1dGhvcml0eYIPAMEA
// SIG // izw8iBHRPvZj7N9AMA0GCSqGSIb3DQEBBAUAA4IBAQCV
// SIG // 6AvAjfOXGDXtuAEk2HcR81xgMp+eC8s+BZGIj8k65iHy
// SIG // 8FeTLLWgR8hi7/zXzDs7Wqk2VGn+JG0/ycyq3gV83TGN
// SIG // PZ8QcGq7/hJPGGnA/NBD4xFaIE/qYnuvqhnIKzclLb5l
// SIG // oRKKJQ9jo/dUHPkhydYV81KsbkMyB/2CF/jlZ2wNUfa9
// SIG // 8VLHvefEMPwgMQmIHZUpGk3VHQKl8YDgA7Rb9LHdyFfu
// SIG // ZUnHUlS2tAMoEv+Q1vAIj364l8WrNyzkeuSod+N2oADQ
// SIG // aj/B0jaK4EESqDVqG2rbNeHUHATkqEUEyFozOG5NHA1i
// SIG // twqijNPVVD9GzRxVpnDbEjqHk3Wfp9KgMIIEyTCCA7Gg
// SIG // AwIBAgIQaguZT8AA3qoR1NhAmqi+5jANBgkqhkiG9w0B
// SIG // AQQFADBwMSswKQYDVQQLEyJDb3B5cmlnaHQgKGMpIDE5
// SIG // OTcgTWljcm9zb2Z0IENvcnAuMR4wHAYDVQQLExVNaWNy
// SIG // b3NvZnQgQ29ycG9yYXRpb24xITAfBgNVBAMTGE1pY3Jv
// SIG // c29mdCBSb290IEF1dGhvcml0eTAeFw0wMDEyMTAwODAw
// SIG // MDBaFw0wNTExMTIwODAwMDBaMIGmMQswCQYDVQQGEwJV
// SIG // UzETMBEGA1UECBMKV2FzaGluZ3RvbjEQMA4GA1UEBxMH
// SIG // UmVkbW9uZDEeMBwGA1UEChMVTWljcm9zb2Z0IENvcnBv
// SIG // cmF0aW9uMSswKQYDVQQLEyJDb3B5cmlnaHQgKGMpIDIw
// SIG // MDAgTWljcm9zb2Z0IENvcnAuMSMwIQYDVQQDExpNaWNy
// SIG // b3NvZnQgQ29kZSBTaWduaW5nIFBDQTCCASAwDQYJKoZI
// SIG // hvcNAQEBBQADggENADCCAQgCggEBAKKEFVPYCzAONJX/
// SIG // OhvC8y97bTcjTfPSjOX9r/3FAjQfJMflodxU7H4CdEer
// SIG // 2zJYFhRRKTjxfrK0jDpHtTlOblTCMQw6bfvNzctQnBuu
// SIG // p9jZSiY/tcXLj5biSfJt2OmWPt4Fz/CmVTetL2DNgGFC
// SIG // oUlUSg8Yt0vZk5kwWkd1ZLTTu922qwydT7hzOxg6qrSH
// SIG // jLCIsE1PH04RtTOA3w06ZG9ExzS9SpObvKYd+QUjTmAp
// SIG // j8wq8oSama2o2wpwe9Y0QZClt2bHXBsdozMOm1QDGj+Y
// SIG // kLjM5z0EdEMcj/c55rOsSHprKg5iAWE5dm79PpgHSxTx
// SIG // AUb9FQDgR9pP5AXkgCUCAQOjggEoMIIBJDATBgNVHSUE
// SIG // DDAKBggrBgEFBQcDAzCBogYDVR0BBIGaMIGXgBBb0HDv
// SIG // aXKeI1F+FLJNjv/LoXIwcDErMCkGA1UECxMiQ29weXJp
// SIG // Z2h0IChjKSAxOTk3IE1pY3Jvc29mdCBDb3JwLjEeMBwG
// SIG // A1UECxMVTWljcm9zb2Z0IENvcnBvcmF0aW9uMSEwHwYD
// SIG // VQQDExhNaWNyb3NvZnQgUm9vdCBBdXRob3JpdHmCDwDB
// SIG // AIs8PIgR0T72Y+zfQDAQBgkrBgEEAYI3FQEEAwIBADAd
// SIG // BgNVHQ4EFgQUKVy5G7bNM+67nll99+XKLsQNNCgwGQYJ
// SIG // KwYBBAGCNxQCBAweCgBTAHUAYgBDAEEwCwYDVR0PBAQD
// SIG // AgFGMA8GA1UdEwEB/wQFMAMBAf8wDQYJKoZIhvcNAQEE
// SIG // BQADggEBAEVY4ppBf/ydv0h3d66M2eYZxVe0Gr20uV8C
// SIG // oUVqOVn5uSecLU2e/KLkOIo4ZCJC37kvKs+31gbK6yq/
// SIG // 4BqFfNtRCD30ItPUwG2IgRVEX2SDZMSplCyK25A3Sg+3
// SIG // 6NRhj3Z24dkl/ySElY0EVlSUoRw6PoK87qWHjByMS3lf
// SIG // tUn6XjJpOh9UrXVN32TnMDzbZElE+/vEHEJx5qA9Re5r
// SIG // AJ+sQr26EbNW5PvVoiqB2B9OolW+J49wpqJsG/9UioK8
// SIG // gUumobFmeqkXp8sGwEfrprPpMRVTPSoEv/9zSNyLJ0P8
// SIG // Y+juJIdbvjbR6DH1Mtle33l6ujCsaYZK+4wRvxuNVFkw
// SIG // ggUPMIID96ADAgECAgphBxFDAAAAAAA0MA0GCSqGSIb3
// SIG // DQEBBQUAMIGmMQswCQYDVQQGEwJVUzETMBEGA1UECBMK
// SIG // V2FzaGluZ3RvbjEQMA4GA1UEBxMHUmVkbW9uZDEeMBwG
// SIG // A1UEChMVTWljcm9zb2Z0IENvcnBvcmF0aW9uMSswKQYD
// SIG // VQQLEyJDb3B5cmlnaHQgKGMpIDIwMDAgTWljcm9zb2Z0
// SIG // IENvcnAuMSMwIQYDVQQDExpNaWNyb3NvZnQgQ29kZSBT
// SIG // aWduaW5nIFBDQTAeFw0wMjA1MjUwMDU1NDhaFw0wMzEx
// SIG // MjUwMTA1NDhaMIGhMQswCQYDVQQGEwJVUzETMBEGA1UE
// SIG // CBMKV2FzaGluZ3RvbjEQMA4GA1UEBxMHUmVkbW9uZDEe
// SIG // MBwGA1UEChMVTWljcm9zb2Z0IENvcnBvcmF0aW9uMSsw
// SIG // KQYDVQQLEyJDb3B5cmlnaHQgKGMpIDIwMDIgTWljcm9z
// SIG // b2Z0IENvcnAuMR4wHAYDVQQDExVNaWNyb3NvZnQgQ29y
// SIG // cG9yYXRpb24wggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAw
// SIG // ggEKAoIBAQCqmb05qBgn9Cs9C0w/fHcup8u10YwNwjp0
// SIG // 15O14KBLP1lezkVPmnkp8UnMGkfuVcIIPhIg+FXy7l/T
// SIG // 4MqWvDDe/ljIJzLQhVTo8JEQu/MrvhnlA5sLhh3zsDmM
// SIG // uP0LHTxzJqxXK8opohWQghXid6NAUgOLncJwuh/pNPbz
// SIG // NZJOVYP42jC2IN5XBrVaQgbeWcvy36a9FUdxGSUj0stv
// SIG // mxl532pb8XYFeSn8w1bKj0QIhVWKy8gPRktVy4yWd0qH
// SIG // 6KlBBsf/DeloV2Nyw2lXtEPPMjow3Bvp1UMmKnn+ldsi
// SIG // ZyTJL9A04+b7UUmGuDzQJV/W7J4DYYepaEDH+OID5s8F
// SIG // AgMBAAGjggFAMIIBPDAOBgNVHQ8BAf8EBAMCBsAwEwYD
// SIG // VR0lBAwwCgYIKwYBBQUHAwMwHQYDVR0OBBYEFGvIxlEg
// SIG // 8LQv06C2rn9eJrK4h1IpMIGpBgNVHSMEgaEwgZ6AFClc
// SIG // uRu2zTPuu55Zffflyi7EDTQooXSkcjBwMSswKQYDVQQL
// SIG // EyJDb3B5cmlnaHQgKGMpIDE5OTcgTWljcm9zb2Z0IENv
// SIG // cnAuMR4wHAYDVQQLExVNaWNyb3NvZnQgQ29ycG9yYXRp
// SIG // b24xITAfBgNVBAMTGE1pY3Jvc29mdCBSb290IEF1dGhv
// SIG // cml0eYIQaguZT8AA3qoR1NhAmqi+5jBKBgNVHR8EQzBB
// SIG // MD+gPaA7hjlodHRwOi8vY3JsLm1pY3Jvc29mdC5jb20v
// SIG // cGtpL2NybC9wcm9kdWN0cy9Db2RlU2lnblBDQS5jcmww
// SIG // DQYJKoZIhvcNAQEFBQADggEBADUj/RNU/Onc8N0MFHr6
// SIG // p7PO/ac6yLrl5/YD+1Pbp5mpoJs2nAPrgkccIb0Uy+dn
// SIG // QAnHFpECVc5DQrTNG12w8zIEPRLlHacHp4+jfkVVdhuW
// SIG // lZFp8N0480iJ73BAt9u1VYDAA8QutijcCoIOx0Pjekhd
// SIG // uAaJkkBsbsXc+JrvC74hCowvOrXtp85xh2gj4bPkGH24
// SIG // RwGlK8RYy7KJbF/90yzEb7gjsg3/PPIRRXTyCQaZGN1v
// SIG // wIYBGBIdKxavVu9lM6HqZ070S4Kr6Q/cAfrfYH9mR13L
// SIG // LHDMe07ZBrhujAz+Yh5C+ZN8oqsKntAjEK5NeyeRbya+
// SIG // aPqmP58j68idu4cxggTQMIIEzAIBATCBtTCBpjELMAkG
// SIG // A1UEBhMCVVMxEzARBgNVBAgTCldhc2hpbmd0b24xEDAO
// SIG // BgNVBAcTB1JlZG1vbmQxHjAcBgNVBAoTFU1pY3Jvc29m
// SIG // dCBDb3Jwb3JhdGlvbjErMCkGA1UECxMiQ29weXJpZ2h0
// SIG // IChjKSAyMDAwIE1pY3Jvc29mdCBDb3JwLjEjMCEGA1UE
// SIG // AxMaTWljcm9zb2Z0IENvZGUgU2lnbmluZyBQQ0ECCmEH
// SIG // EUMAAAAAADQwCQYFKw4DAhoFAKCBoDAZBgkqhkiG9w0B
// SIG // CQMxDAYKKwYBBAGCNwIBBDAcBgorBgEEAYI3AgELMQ4w
// SIG // DAYKKwYBBAGCNwIBFTAjBgkqhkiG9w0BCQQxFgQU7B37
// SIG // emaL6EQKz8pcgd9pQGb+hOkwQAYKKwYBBAGCNwIBDDEy
// SIG // MDCgDoAMAG8AdwBzAC4AagBzoR6AHGh0dHA6Ly9vZmZp
// SIG // Y2UubWljcm9zb2Z0LmNvbSAwDQYJKoZIhvcNAQEBBQAE
// SIG // ggEAd0lVCAkeUnBHxBP6H8XR9h1FmUJPXu/El/1yfBy5
// SIG // 2qrglw00x7S12k548N/3Rpy1yHE8yQ8WfmMXa/eX5qXY
// SIG // 888PNY/tyJ3JUBujqYr+ADERXX+Ypv8Adshbs86BwvoO
// SIG // 9+7LA75Xo2O2tyEnPM1jeLrj3DZ7LuEsgv08TMCK0Xub
// SIG // 1Pmu4+RYhKJN7Be6Ybvf7xnqOaTIAO2u+BzbkQlHtQQV
// SIG // 4X7ZXWZwMAgqQC7oF43MiKWJfavwkEkO5qSZnZYQ38Hj
// SIG // nOjJJJj59ZBuY0aFo8ex3UV6IHfrA0yWCkpO3hU6L1Kd
// SIG // fBvTC35dV/2btUZiHzcK/h+ddWjflBRLbebRV6GCAkww
// SIG // ggJIBgkqhkiG9w0BCQYxggI5MIICNQIBATCBszCBnjEf
// SIG // MB0GA1UEChMWVmVyaVNpZ24gVHJ1c3QgTmV0d29yazEX
// SIG // MBUGA1UECxMOVmVyaVNpZ24sIEluYy4xLDAqBgNVBAsT
// SIG // I1ZlcmlTaWduIFRpbWUgU3RhbXBpbmcgU2VydmljZSBS
// SIG // b290MTQwMgYDVQQLEytOTyBMSUFCSUxJVFkgQUNDRVBU
// SIG // RUQsIChjKTk3IFZlcmlTaWduLCBJbmMuAhAIem1cb2KT
// SIG // T7rE/UPhFBidMAwGCCqGSIb3DQIFBQCgWTAYBgkqhkiG
// SIG // 9w0BCQMxCwYJKoZIhvcNAQcBMBwGCSqGSIb3DQEJBTEP
// SIG // Fw0wMzA3MTUwNjA2MDJaMB8GCSqGSIb3DQEJBDESBBAG
// SIG // N9JwwtlLYBue+F2tUNnJMA0GCSqGSIb3DQEBAQUABIIB
// SIG // AIogEdi43gtfvajbUOjp+ew7xHmg56M5bvzEB32xV5CZ
// SIG // PgOOVAc7MsDuCkF1nCZxVSeRXa2CH2CqAloleOw480Pb
// SIG // t367x6xt+FWuydZ8Npa3IUb9dney/da3Wv5cTLJtCEHu
// SIG // /SOHgI+tcmUGjYSF4qk9TpClxYtBWEIlzfEAEsa+XWgw
// SIG // 3pNTCwgu4boOiYDbpqrgLRtEOJ8GPbJ0nd8sXzyOH1wg
// SIG // Y+1JgWuDGs8h1GQDi4hA8VfTUV6hIJyyhPnj3NvaCzrh
// SIG // jHO1SjIADcIf8BhOjssbV8PAcWYJnKt8BwX1C7QdjoV7
// SIG // 8WRMVqNo2DX8ZQq3nFN7iN5Lz0XBn9fVtvc=
// SIG // End signature block
