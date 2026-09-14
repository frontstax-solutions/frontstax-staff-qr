# ============================================================
# FRONTSTAX STAFF QR - CREATE ALL 7 STAFF CARDS
# ============================================================

$base = "$env:USERPROFILE\Desktop\frontstax-staff-qr"

# Create main folders
New-Item -ItemType Directory -Force "$base\staff" | Out-Null
New-Item -ItemType Directory -Force "$base\staff\deepak-raina" | Out-Null
New-Item -ItemType Directory -Force "$base\staff\bindiya-sharma" | Out-Null
New-Item -ItemType Directory -Force "$base\staff\parth-kaul" | Out-Null
New-Item -ItemType Directory -Force "$base\staff\prerna-bhatnagar" | Out-Null
New-Item -ItemType Directory -Force "$base\staff\sagar-bhatnagar" | Out-Null
New-Item -ItemType Directory -Force "$base\staff\mohammad-edrees" | Out-Null
New-Item -ItemType Directory -Force "$base\staff\aarti-kaul" | Out-Null


# ============================================================
# MASTER HTML TEMPLATE
# ============================================================

$template = @'
<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="UTF-8">

<meta name="viewport"
      content="width=device-width, initial-scale=1.0">

<title>{{NAME}} | Frontstax Solutions</title>

<meta name="description"
      content="{{NAME}} - {{TITLE}} | Frontstax Solutions">

<style>

* {
    box-sizing: border-box;
}

html,
body {
    margin: 0;
    padding: 0;
}

body {
    background: #eef2f7;
    font-family: Arial, Helvetica, sans-serif;
    color: #071f3b;
}

.card {
    width: calc(100% - 18px);
    max-width: 450px;
    margin: 3px auto;

    background: #ffffff;

    border-radius: 22px;

    overflow: hidden;

    box-shadow: 0 8px 25px rgba(0,0,0,0.12);

    min-height: calc(100vh - 6px);
}


/* ================= HEADER ================= */

.header {

    background:
        linear-gradient(
            135deg,
            #071f3b 0%,
            #123e68 100%
        );

    color: #ffffff;

    text-align: center;

    padding: 20px 15px 19px;
}


.logo-box {

    width: 110px;
    height: 80px;

    margin: 0 auto 20px;

    background: #ffffff;

    border-radius: 18px;

    display: flex;

    align-items: center;

    justify-content: center;
}


.logo-box img {

    width: 90px;

    max-height: 65px;

    object-fit: contain;
}


.company {

    font-size: 29px;

    font-weight: 700;

    line-height: 1.15;
}


.tagline {

    margin-top: 7px;

    font-size: 14px;

    color: #e6edf5;
}


/* ================= PROFILE ================= */

.profile {

    text-align: center;

    padding: 28px 20px 10px;
}


.name {

    margin: 0;

    font-size: 29px;

    font-weight: 700;

    color: #071f3b;
}


.designation {

    margin-top: 5px;

    font-size: 18px;

    font-weight: 700;

    color: #2868a1;
}


.phone {

    margin-top: 25px;

    font-size: 16px;

    color: #071f3b;
}


.phone-icon {

    color: #e83e8c;

    font-size: 21px;

    margin-right: 8px;
}


.additional {

    margin-top: 8px;

    font-size: 14px;

    color: #667085;
}


/* ================= BUTTONS ================= */

.buttons {

    padding: 10px 25px 25px;
}


.button {

    width: 100%;

    min-height: 46px;

    margin-top: 12px;

    border: 0;

    border-radius: 10px;

    display: flex;

    align-items: center;

    justify-content: center;

    gap: 9px;

    text-decoration: none;

    font-size: 16px;

    font-weight: 700;

    font-family: Arial, Helvetica, sans-serif;

    cursor: pointer;
}


.call {

    background: #0b355d;

    color: #ffffff;

    box-shadow:
        0 4px 10px rgba(11,53,93,0.18);
}


.secondary {

    background: #edf2f7;

    color: #071f3b;
}


.linkedin {

    background: #edf2f7;

    color: #071f3b;
}


/* ================= FOOTER ================= */

.footer {

    border-top: 1px solid #e5e7eb;

    text-align: center;

    padding: 20px 10px 16px;

    color: #667085;

    font-size: 12px;
}


/* ================= MOBILE ================= */

@media (max-width: 380px) {

    .company {
        font-size: 25px;
    }

    .name {
        font-size: 26px;
    }

    .buttons {
        padding-left: 18px;
        padding-right: 18px;
    }

}

</style>

</head>


<body>

<div class="card">


    <!-- HEADER -->

    <div class="header">

        <div class="logo-box">

            <img
                src="../../assets/logo.png"
                alt="Frontstax Solutions">

        </div>


        <div class="company">

            Frontstax Solutions

        </div>


        <div class="tagline">

            Your Partner In Digital Innovation

        </div>

    </div>


    <!-- PROFILE -->

    <div class="profile">

        <h1 class="name">

            {{NAME}}

        </h1>


        <div class="designation">

            {{TITLE}}

        </div>


        <div class="phone">

            <span class="phone-icon">
                ☎
            </span>

            {{PHONE}}

        </div>


        {{ADDITIONAL}}


    </div>


    <!-- BUTTONS -->

    <div class="buttons">


        <!-- CALL -->

        <a
            class="button call"
            href="tel:{{PHONE_RAW}}">

            ☎ &nbsp; Call Now

        </a>


        <!-- WHATSAPP -->

        <a
            class="button secondary"
            href="https://wa.me/{{WHATSAPP_RAW}}"
            target="_blank"
            rel="noopener">

            💬 &nbsp; WhatsApp

        </a>


        <!-- SAVE CONTACT -->

        <a
            class="button secondary"
            href="vcard.vcf">

            💾 &nbsp; Save Contact

        </a>


        <!-- EMAIL -->

        <a
            class="button secondary"
            href="mailto:{{EMAIL}}">

            ✉ &nbsp; Email

        </a>


        <!-- LINKEDIN - INTENTIONALLY INACTIVE -->

        <a
            class="button linkedin"
            href="#"
            onclick="event.preventDefault();">

            in &nbsp; LinkedIn

        </a>


    </div>


    <!-- FOOTER -->

    <div class="footer">

        © Frontstax Solutions

    </div>


</div>

</body>

</html>
'@


# ============================================================
# FUNCTION TO CREATE STAFF CARD
# ============================================================

function Create-StaffCard {

    param (

        [string]$Folder,

        [string]$Name,

        [string]$Title,

        [string]$Phone,

        [string]$PhoneRaw,

        [string]$WhatsAppRaw,

        [string]$Email,

        [string]$Location,

        [string]$Additional,

        [string]$VCardPhone2 = ""

    )


    # ---------------- HTML ----------------

    $html = $template

    $html = $html.Replace("{{NAME}}", $Name)
    $html = $html.Replace("{{TITLE}}", $Title)
    $html = $html.Replace("{{PHONE}}", $Phone)
    $html = $html.Replace("{{PHONE_RAW}}", $PhoneRaw)
    $html = $html.Replace("{{WHATSAPP_RAW}}", $WhatsAppRaw)
    $html = $html.Replace("{{EMAIL}}", $Email)
    $html = $html.Replace("{{ADDITIONAL}}", $Additional)


    Set-Content `
        -Path "$base\staff\$Folder\index.html" `
        -Value $html `
        -Encoding UTF8


    # ---------------- VCARD ----------------

    $vcard = @"
BEGIN:VCARD
VERSION:3.0
FN:$Name
ORG:Frontstax Solutions
TITLE:$Title
TEL;TYPE=CELL,VOICE:$PhoneRaw
"@


    if ($VCardPhone2 -ne "") {

        $vcard += @"
TEL;TYPE=CELL,VOICE:$VCardPhone2
"@

    }


    $vcard += @"
EMAIL;TYPE=INTERNET:$Email
ADR;TYPE=WORK:;;;$Location;;;
NOTE:$Title | Frontstax Solutions
END:VCARD
"@


    Set-Content `
        -Path "$base\staff\$Folder\vcard.vcf" `
        -Value $vcard `
        -Encoding UTF8
}


# ============================================================
# DEEPAK RAINA
# ============================================================

Create-StaffCard `
    -Folder "deepak-raina" `
    -Name "Deepak Raina" `
    -Title "Founder & CEO" `
    -Phone "+971 55 380 5362" `
    -PhoneRaw "+971553805362" `
    -WhatsAppRaw "971553805362" `
    -Email "deepak.raina@frontstaxsolutions.com" `
    -Location "UAE" `
    -Additional '<div class="additional">Additional: +91 98936 64400</div>' `
    -VCardPhone2 "+919893664400"


# ============================================================
# BINDIYA SHARMA
# ============================================================

Create-StaffCard `
    -Folder "bindiya-sharma" `
    -Name "Bindiya Sharma" `
    -Title "Financial Controller" `
    -Phone "+91 98930 26422" `
    -PhoneRaw "+919893026422" `
    -WhatsAppRaw "919893026422" `
    -Email "bindiya.sharma@frontstaxsolutions.com" `
    -Location "India" `
    -Additional ""


# ============================================================
# PARTH KAUL
# ============================================================

Create-StaffCard `
    -Folder "parth-kaul" `
    -Name "Parth Kaul" `
    -Title "Inside Sales Representative" `
    -Phone "+44 7555 218900" `
    -PhoneRaw "+447555218900" `
    -WhatsAppRaw "447555218900" `
    -Email "parth.kaul@frontstaxsolutions.com" `
    -Location "UAE" `
    -Additional ""


# ============================================================
# PRERNA BHATNAGAR
# ============================================================

Create-StaffCard `
    -Folder "prerna-bhatnagar" `
    -Name "Prerna Bhatnagar" `
    -Title "HR & Admin Manager" `
    -Phone "+91 78959 34133" `
    -PhoneRaw "+917895934133" `
    -WhatsAppRaw "917895934133" `
    -Email "hr@frontstaxsolutions.com" `
    -Location "India" `
    -Additional ""


# ============================================================
# SAGAR BHATNAGAR
# ============================================================

Create-StaffCard `
    -Folder "sagar-bhatnagar" `
    -Name "Sagar Bhatnagar" `
    -Title "Technical Lead - Development" `
    -Phone "+91 80772 03005" `
    -PhoneRaw "+918077203005" `
    -WhatsAppRaw "918077203005" `
    -Email "sagar.bhatnagar@frontstaxsolutions.com" `
    -Location "India" `
    -Additional ""


# ============================================================
# MOHAMMAD EDREES
# ============================================================

Create-StaffCard `
    -Folder "mohammad-edrees" `
    -Name "Mohammad Edrees" `
    -Title "Head of Engineering" `
    -Phone "+93 77 606 3655" `
    -PhoneRaw "+93776063655" `
    -WhatsAppRaw "93776063655" `
    -Email "mohammad.edrees@frontstaxsolutions.com" `
    -Location "India" `
    -Additional ""


# ============================================================
# AARTI KAUL
# ============================================================

Create-StaffCard `
    -Folder "aarti-kaul" `
    -Name "Aarti Kaul" `
    -Title "Manager, Marketing" `
    -Phone "+91 95400 22286" `
    -PhoneRaw "+919540022286" `
    -WhatsAppRaw "919540022286" `
    -Email "aarti.k@frontstaxsolutions.com" `
    -Location "UAE" `
    -Additional ""


Write-Host ""
Write-Host "==============================================="
Write-Host " ALL 7 FRONTSTAX STAFF CARDS CREATED"
Write-Host "==============================================="
Write-Host ""
Write-Host "Location:"
Write-Host $base
Write-Host ""
Write-Host "Folders created:"
Write-Host "  deepak-raina"
Write-Host "  bindiya-sharma"
Write-Host "  parth-kaul"
Write-Host "  prerna-bhatnagar"
Write-Host "  sagar-bhatnagar"
Write-Host "  mohammad-edrees"
Write-Host "  aarti-kaul"
Write-Host ""
Write-Host "Each folder contains:"
Write-Host "  index.html"
Write-Host "  vcard.vcf"
Write-Host ""
Write-Host "IMPORTANT:"
Write-Host "Copy your existing assets folder/logo.png into:"
Write-Host "$base\assets\logo.png"
Write-Host ""
Read-Host "Press ENTER to finish"