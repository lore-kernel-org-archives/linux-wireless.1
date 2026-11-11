Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=211.75.126.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794365165;
	b=bHS3G0J8CQBXQZu66ub+EU+ONj6KSPq2rl0fcytuO66ye+jfZBNK39yDQyG2PtMblpLj
	 hlKMI8nxHYQG3AJTazsWH9zHOAK9YS9QBNKzD/RtUADNv8YW+6d6fvr6anhEL2628JOdW
	 +1kJlgcPDkeybliEuCeYExxxAFQVw6/YAQ/wxNL0nczYJC3Zi1I3oagW1xvPP4QCDgpaE
	 aB/kfTc8ibPkbWQHxY0zjOGHWU6SveWa1QzJUEYfEuiTgBFDJg3iIOleiuqW/byFNAtDB
	 kqSKstYNRTan5Pb39UumiffF+PBr3PA3nLksLC+iK/ih+PFrh7XrcjxphSb8ItVP31g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794365165;
	h=DMARC-Filter:X-SpamFilter-By:DKIM-Signature:Received:Received:
	 Received:Received:From:To:CC:Subject:Thread-Topic:Thread-Index:Date:
	 Message-ID:References:In-Reply-To:Accept-Language:Content-Language:
	 x-originating-ip:Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=zCUroM9D2tvUZPhx9epSpgsqDcnvTXr3FBsl6744avI=;
	b=JedzVRLK7USLfPhX/NY0G8DVYObUFenQssxT8WowwzAikzePEJPUwCpz7gpdPoWVD+Nb
	 Hmb5L8qy2irHf0n1ONCER85dBl+2rxDC3/5L2NHdf4lfLzLLNV32EGCiW5n0Tg0O3xvrI
	 +2mLBiNAcRCtzCC/1Cgyne/ng5Wz4PhTrzgt1fYQr7uNroIcxTXr7rHVdwPtP8qRAvguP
	 p4Pzbrt0OBKzM2GRTz3P4REtnaGEgqGDXoDm/KmD3pix7QMdsuR9gChMvM3XygCEJM0+m
	 wDLa/0MnwbEEBVrOrE+8SankzHZtL8HSf9oMkTLxKrcnEullpDTNOOCshQYKEGjGCwg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=realtek.com;
	spf=pass smtp.mailfrom=realtek.com;
	dkim=pass header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=aFx5d+vY;
	arc=none smtp.remote-ip=211.75.126.72
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E18BA606A320
	for <linux-wireless@vger.kernel.org>; Wed, 11 Nov 2026 02:46:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E18BA606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=aFx5d+vY
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6AB2k05011970095, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1794365160; bh=zCUroM9D2tvUZPhx9epSpgsqDcnvTXr3FBsl6744avI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=aFx5d+vY1af/Ox7mfRnIxVVnwv+7FnP0ylwE696iR+dEdMcxLrfeogYXVlYXv4vui
	 RFE5n19t3A5hyeSoXp3l+SkueCsqkNhBK4bOgIiZERifehW9X4voRz9GL70dIHEn2c
	 GyjbXg+o4Y9RmgLOrY7fcAKKs5BF8kBxKNL1HKgxaJpHICZjFEP78RlZ3DVWvk3WQc
	 btihXvVV5MGG7zidkTMYdV0kcahVK598sgIj1k/4xb3kh2L71axlBL4mVBZCsyiYhH
	 xD0VvFomrT3UUpGt6ME99c+y7Rc0PJC55dlqfoWLnmTlvFsH9v4RrFc5ztMDl4+Q9b
	 fnYC5Zccdfwvg==
Received: from mail.realtek.com (rtkexhmbs03.realtek.com.tw[10.21.1.53])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 6AB2k05011970095
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 11 Nov 2026 10:46:00 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS03.realtek.com.tw (10.21.1.53) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 11 Nov 2026 10:46:00 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS06.realtek.com.tw (10.21.1.56) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 11 Nov 2026 10:46:00 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::eeeb:c765:ca73:5eef%10]) with mapi id
 15.02.2562.056; Wed, 11 Nov 2026 10:46:00 +0800
From: Ping-Ke Shih <pkshih@realtek.com>
To: Kadir Yavuz Kurt <k.yavuzkurt1@gmail.com>
CC: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>
Subject: RE: [BUG] wifi: rtw89: 8922ae: no association until module reload
Thread-Topic: [BUG] wifi: rtw89: 8922ae: no association until module reload
Thread-Index: AQHda8vVqJMtgEcxU0WMB2uaHjTO6bcoM+AQ
Date: Wed, 11 Nov 2026 02:46:00 +0000
Message-ID: <c35e169db9404f70b806531180f7ca9d@realtek.com>
References: <20261103194454.14002-1-k.yavuzkurt1@gmail.com>
In-Reply-To: <20261103194454.14002-1-k.yavuzkurt1@gmail.com>
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

Kadir Yavuz Kurt <k.yavuzkurt1@gmail.com> wrote:
> Timing observation (hypothesis, not established)
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>=20
> The only systematic difference I can see between the failing probe and
> the working one is when it runs relative to Bluetooth initialisation.
> The RTL8922AE is a combo part; the BT function enumerates as USB
> 0bda:8922 and is driven by btusb/btrtl.
>=20
> At boot (monotonic timestamps, failing probe):
>=20
>     [ 3.018707] Bluetooth: hci0: RTL: rom_version status=3D0 version=3D1
>     [ 3.018809] rtw89_8922ae 0000:07:00.0: loaded firmware
>                                            rtw89/rtw8922a_fw-4.bin
>     [ 3.018864] rtw89_8922ae 0000:07:00.0: enabling device (0000 -> 0003)
>     [ 3.019712] Bluetooth: hci0: RTL: loading rtl_bt/rtl8922au_fw.bin
>     [ 3.052054] rtw89_8922ae 0000:07:00.0: chip info CID: 71, CV: 2, ...
>     [ 3.097814] rtw89_8922ae 0000:07:00.0 wlp7s0: renamed from wlan0
>     [ 3.638714] Bluetooth: hci0: RTL: fw version 0x41c0c905
>=20
> The entire rtw89 probe (3.018 - 3.098) runs inside the BT firmware
> download (3.019 - 3.639), starting 1 ms after it.

This is a good point. I think you can add rtw89 into blacklist, and
manually load the modules after booting.=20

If this works, add a udev rule to delay loading rtw89.

>=20
> The working reload, same boot:
>=20
>     [53.643379] rtw89_8922ae 0000:07:00.0: loaded firmware
>                                            rtw89/rtw8922a_fw-4.bin
>     [53.675553] rtw89_8922ae 0000:07:00.0: chip info CID: 71, CV: 2, ...
>=20
> i.e. 50 s after BT finished initialising.
>=20
> I want to be clear that this is only a timing correlation. I have not
> yet tested booting with btusb blacklisted, and I am not claiming the
> two are causally related. It is simply the one difference I could find
> that is present in every failing case and absent in every working one.

RTL8922AE is a WiFi/BT combo card. I think they have interference with
each other when initializing, because they share hardware resource and
race can happen at that time.=20

Ping-Ke

