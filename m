Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=211.75.126.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795751236;
	b=WD0p+RlG+Xz8bCPnO79oxvyQifmCC6OGal4y6l42P1HM+l2Mk/zRpBESMoZMxmxCEIpf
	 363eppFSZGu+65Wiv38favd6Tc3G0qBY6s5i0tl586f6YFwgTfXY7KGhaI0VB2vIj7Nyz
	 c5ORujMl1FFFbzmV1NwcnW43V9I5lcF0WRe5G4DhGIl4QffNfAPOIBd3yzqC088vFlx2D
	 jfQUf0xSH9P3cALpf88y7ruZ5JjijIbPwl/2yE+ri6z3Fgomw4UQaMOh0BmgOI29gWonU
	 Sa6/tqq1R0FEvrmasi0ITl5IY0+hVPiwJgYSSR937OKKGpHTDVlI+YhCyS4ooKOUwkw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795751236;
	h=DMARC-Filter:X-SpamFilter-By:DKIM-Signature:Received:Received:
	 Received:Received:From:To:CC:Subject:Thread-Topic:Thread-Index:Date:
	 Message-ID:References:In-Reply-To:Accept-Language:Content-Language:
	 x-originating-ip:Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=Vrb21qqqvgEiiOnS2XhmnT6VrN2PTt3s/6GL8SgQjYU=;
	b=ihX9CSANQh6a9WYA5uC+iReZde+le1Q1GqXnCR02oUDjSuIPSLexDAcC9httbhq4stKQ
	 bisBRR2c3xR+FMb+f3aK2cS+peeVgTGLd7EZz+z1DxGCuG3zHH11wU/0HQ8PtiCFSL1oY
	 VuFWDaUYC9EYD5vHeL0rQYT8MzoOM7lDpRg0qhwdUhE4tjaDAgiL2Sw8snvDkhsWqvJrb
	 LlSUCf1b16tKTL9y7ysQ0Za2wnaXIGRk/vXmKGT6PcJrpfwTP+3/E6UPwyFsZzCsSBU/0
	 NEfiAY6free800boqSEciWlKI07tn4D0tBYDiV83frsB2ULcKdHEz6a1S/4O5Vokf6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=realtek.com;
	spf=pass smtp.mailfrom=realtek.com;
	dkim=pass header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=D3SyRjVL;
	arc=none smtp.remote-ip=211.75.126.72
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA339606A31E;
	Fri, 27 Nov 2026 03:47:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DA339606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=D3SyRjVL
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6AR3l4oT5600676, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1795751225; bh=Vrb21qqqvgEiiOnS2XhmnT6VrN2PTt3s/6GL8SgQjYU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=D3SyRjVLRCLjDwM0EQE2MEJMTT1f5U1vL6BTT2hA++501ftVxKCw21N2EcxBN4XQq
	 cVkuGE/h5U88zTMScXHQaV+IINyD4saGjpgeg9Q4HxBPqf4CB2xKluCQLTlovQNujb
	 pX6CDZfmC1BHagsl6x1Gd0wLiBEu2YLEXBdkaQ9axvfnwZSdXIQ7I285ptIF/UM0Fc
	 oPSnFq6/dvJY5nnIbsuV8J2HpstNGq3YBTL6AfD+Bwj0jeWQT1fwGFaWUBCXwNpbkX
	 Q1NRKEddj3YsoYS5tPG3JG5b+TgCDG2gFRxT5jI9NzZjiGCO5jNRal8xFa615nhzet
	 OovsrvxZ5g8NQ==
Received: from mail.realtek.com (rtkexhmbs04.realtek.com.tw[10.21.1.54])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 6AR3l4oT5600676
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 27 Nov 2026 11:47:04 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS04.realtek.com.tw (10.21.1.54) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 27 Nov 2026 11:47:05 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS06.realtek.com.tw (10.21.1.56) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 27 Nov 2026 11:47:05 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef%10]) with mapi id
 15.02.2562.056; Fri, 27 Nov 2026 11:47:05 +0800
From: Ping-Ke Shih <pkshih@realtek.com>
To: Swapnil Shinde <shindeswapnil028@gmail.com>, "kvalo@kernel.org"
	<kvalo@kernel.org>
CC: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] wifi: rtw88: pci: Power off MAC and disable interrupts on
 shutdown
Thread-Topic: [PATCH] wifi: rtw88: pci: Power off MAC and disable interrupts
 on shutdown
Thread-Index: AQHdfgkcjP7Pr8ogOkmROGqrlIhcubdBRICA
Date: Fri, 27 Nov 2026 03:47:05 +0000
Message-ID: <24cb6dca77d3456fb5893ce37b0bd1c7@realtek.com>
References: <20261127004822.8536-1-shindeswapnil028@gmail.com>
In-Reply-To: <20261127004822.8536-1-shindeswapnil028@gmail.com>
Accept-Language: en-US, zh-TW
Content-Language: zh-TW
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0


Swapnil Shinde <shindeswapnil028@gmail.com> wrote:
> Currently rtw_pci_shutdown() invokes chip->ops->shutdown() and
> immediately transitions the device to PCI_D3hot without powering off
> the MAC or disabling PCI interrupts when RTW_FLAG_POWERON is active.
>=20
> On RTL8723DE combo cards, leaving the MAC powered across a warm reset
> causes REG_APS_FSMCO polling (offset 0x5, mask 0x1) to time out with
> -EBUSY (-16) on the next boot. Power off the MAC under rtwdev->mutex
> and disable PCI interrupts before entering PCI_D3hot.

IIRC the commit 05202746ed70 ("rtw88: 8723d: Add shutdown callback to disab=
le BT USB suspend")
is to fix the problem your encountered.=20

The later another commit 44492e70adc8 ("rtw88: pci: Power cycle device duri=
ng shutdown")
is to let PCI enters PCI_D3hot.

Can you revert both or either one to see if anything different?

>=20
> Signed-off-by: Swapnil Shinde <shindeswapnil028@gmail.com>
> ---
>  drivers/net/wireless/realtek/rtw88/pci.c | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
>=20
> diff --git a/drivers/net/wireless/realtek/rtw88/pci.c b/drivers/net/wirel=
ess/realtek/rtw88/pci.c
> index 66d2e5f51..b0bbb9397 100644
> --- a/drivers/net/wireless/realtek/rtw88/pci.c
> +++ b/drivers/net/wireless/realtek/rtw88/pci.c
> @@ -1949,14 +1949,29 @@ void rtw_pci_shutdown(struct pci_dev *pdev)
>  {
>         struct ieee80211_hw *hw =3D pci_get_drvdata(pdev);
>         struct rtw_dev *rtwdev;
> +       struct rtw_pci *rtwpci;
>         const struct rtw_chip_info *chip;
>=20
>         if (!hw)
>                 return;
>=20
>         rtwdev =3D hw->priv;
> +       rtwpci =3D (struct rtw_pci *)rtwdev->priv;
>         chip =3D rtwdev->chip;
>=20

Can it just call rtw_enter_ips()?

> +       mutex_lock(&rtwdev->mutex);
> +       if (test_bit(RTW_FLAG_POWERON, rtwdev->flags)) {
> +               clear_bit(RTW_FLAG_RUNNING, rtwdev->flags);
> +               clear_bit(RTW_FLAG_FW_RUNNING, rtwdev->flags);
> +               rtw_power_off(rtwdev);
> +               clear_bit(RTW_FLAG_POWERON, rtwdev->flags);
> +       } else {
> +               rtw_hci_link_ps(rtwdev, false);
> +       }
> +       mutex_unlock(&rtwdev->mutex);
> +
> +       rtw_pci_disable_interrupt(rtwdev, rtwpci);
> +
>         if (chip->ops->shutdown)
>                 chip->ops->shutdown(rtwdev);
>=20
> --
> 2.56.0

