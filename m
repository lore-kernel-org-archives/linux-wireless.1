Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.130.24
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795687085;
	b=PYAvaCwZPjX9lkaw8ONpPbrEgcNjj7sHgjJ2DcF3mR0cENzKjGc6wfDxk44fN2QFZCMz
	 uy9q8qXoXDXvo18VCUOQvQ0HSlr44t0dyRoA0xmW00zljCIAeLluPiV9zfNOu9N0LFIyj
	 fAGeJUtt1SNIQ2zEtcoNtjF5eDIXZNGq1KKXL5+svtWwHcngxtYnP8XRCpBmq8Kt5JuvG
	 2QAuQTkVRMFSsXs/w8eUlOLqke5ST/YZy3yE5c0xLUwKT+TyREyk55lR51cO31oj7J5DH
	 YIRfn6oVn9GD5UhynKD7UbBATbfEByFAEFOHRor+KoHVTdqWmbEVembCfJdoONOxSVQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795687085;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Subject:
	 Thread-Topic:Thread-Index:Date:Message-ID:Accept-Language:
	 Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:msip_labels:
	 x-ms-publictraffictype:x-ms-traffictypediagnostic:
	 x-ms-office365-filtering-correlation-id:x-ms-exchange-senderadcheck:
	 x-ms-exchange-antispam-relay:x-microsoft-antispam:
	 x-microsoft-antispam-message-info:x-forefront-antispam-report:
	 x-ms-exchange-antispam-messagedata-chunkcount:
	 x-ms-exchange-antispam-messagedata-0:Content-Type:
	 Content-Transfer-Encoding:MIME-Version:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-AuthAs:X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-originalarrivaltime:
	 X-MS-Exchange-CrossTenant-fromentityheader:
	 X-MS-Exchange-CrossTenant-id:X-MS-Exchange-CrossTenant-mailboxtype:
	 X-MS-Exchange-CrossTenant-userprincipalname:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=dHXeh+M5xiCg18EKlVZSONcxHoO1AkX4tpOc5fJQLXE=;
	b=DS7EHIuUFXUrsEJ9m2VDjNwn+iJaiokYFFZHVPFKUlE/gBZ96OlWXxbK1g8TF2RqIFfI
	 s71SNlwrGlYdSaOiJy+FMYTcJ2ADPDG0Z+Ssx5h52xSX6nfSF9Lc0VVNbC22O+jw61PIM
	 b+Dr8fDThS477Mi4Ic9+9u0hsab/TyD/BWsoRW3BWy5C4GZOGP4XsHaqFSaNRl8S6Ztgo
	 S4Q4Jez0iFqi2V5B6yGkeJZZmc+3by4eWvkNgJx4S7xTINErD2M95SXjuF56gwSgXCLu9
	 ykDHHPPjk98LTiJWdrHrq6kFPIvEbmSLfHMgc8c1wWA8wuGeoUtMe1ASWdhvVyUylfA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=philips.com;
	spf=pass smtp.mailfrom=philips.com;
	dkim=pass header.d=philips.com header.i=@philips.com header.a=rsa-sha256 header.s=selector1 header.b=tXbLTjwp;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.130.24
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011024.outbound.protection.outlook.com [40.107.130.24])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CCCD606A31E
	for <linux-wireless@vger.kernel.org>; Thu, 26 Nov 2026 09:58:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0CCCD606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=philips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=philips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=philips.com header.i=@philips.com header.a=rsa-sha256 header.s=selector1 header.b=tXbLTjwp
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LoSVjxdMUB93cpXifp8UToUnwxeK8/kjT7SrM+dmHTcFf1mZkZUSdVxYd9Owwinomzvy632pVb7uxO5OshCw5HQ1dvK1pPntrnNkJAYnJjmUqDobqSMoOz02OLFbBizAx2f846M80ePiC8A/kHVyL3dwC8DgejR3vgob5+zgy6h8b3W27wwdHThgzzAhgy9ExvbY8/0KUalxqZ26SqPPcnVdFso3FA7Qkb3r7e6s9K8danqHPGLpMFdOr4pu2XfDxni0QjrW4wK6HtLPznvB+ZI59SYAqLxic/uyNfoCx5y/HFTDrZZ7tptcmRgjIWV1rnAkSGWaMSi9UCy/JdHqAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dHXeh+M5xiCg18EKlVZSONcxHoO1AkX4tpOc5fJQLXE=;
 b=NhxBzl3HqbimZUD8sb6VAW+cRm63xJqMo5rDxB9JbXliff24ypIVuSHUR172ScCiQ1J/5uWVRro5/Gm8cf9VTynL3wl/FHnDw7/ybYVp9J9ri5q3WIKRIq7JlUh5lbO0Xrit+ydFXe/BYWihHIyBzSm6EUrunGwvv5qK2NkC5LwaOlgTZMdQIHzF5n7p/t8cvECrMcOXvo8LVjI/KIg7xl36zayP0t7jL4jVaLMKxFh4Rgcp0/DaYkvgjj/hbktLh13HvBUzQ2cku7MLr34IRfSwG+l5eJ3mCwuauiQ/mRqMn0VsyUT7VqGMG8eel58mPzc599469NuJgs7FailSKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=philips.com; dmarc=pass action=none header.from=philips.com;
 dkim=pass header.d=philips.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=philips.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dHXeh+M5xiCg18EKlVZSONcxHoO1AkX4tpOc5fJQLXE=;
 b=tXbLTjwplVTP0fGfAjRpbLbRXDzszW+yGoTh/wj7pu3vy1fuqQTOLpSb5zNkQMsKae1jnm2C5uFLcOAJZhwcgwpg1ZAnDZvGHW0p5diFCDXevZTDASvjw36BXBC2wRfcTw4BKvaT67tP1Y8gA5o5Y4hJUUEPc9UnWENKgpnq58I=
Received: from BESPR10MB992227.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:b10:146::23) by AS2PR10MB6352.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:553::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.688.4; Thu, 26 Nov
 2026 09:58:01 +0000
Received: from BESPR10MB992227.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::ceeb:beaf:7ed2:e241]) by BESPR10MB992227.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::ceeb:beaf:7ed2:e241%5]) with mapi id 15.21.0662.004; Thu, 26 Nov 2026
 09:58:01 +0000
From: "Schnick, Uwe" <uwe.schnick@philips.com>
To: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>
Subject: subscribe
Thread-Topic: subscribe
Thread-Index: AQHdfYx6C8HfUAYDfUOshhKSZzzH1w==
Date: Thu, 26 Nov 2026 09:58:00 +0000
Message-ID:
 <BESPR10MB99222755B5887F9FBEE57EBF03FC422@BESPR10MB992227.EURPRD10.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=philips.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BESPR10MB992227:EE_|AS2PR10MB6352:EE_
x-ms-office365-filtering-correlation-id: 80f3b6bc-b83e-4735-aa73-08df4ba3c1a1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|23010399003|366016|376014|38070700021|261022105027099003|10067099003|56012099006|261026140227099003|261028144727099003|261022075727099003|261009223027099003|18002099003|11063799006;
x-microsoft-antispam-message-info:
 DvZI88NyYVmzdPV/e2D+KGTVr9zECt+v/vvFdctu1jw5v6ZVPbmu5jFx8sQ8/yt8mmdfGCFI+vw6DxdaMWG+P5ng91V5KWm8F/hrEGtYqpQIQu2i9wWHHowWFiIb7+2S4LgbHa2OmmlIg7wjFjCleORB8e0Ku1vq636InUmZE1AOtBaCWXEmu7Hhw5tt2T7eS/s92sTbAxt/GYwIZPjq7mAd0TvCATeN6xnYTHXACqFtk7/mjjC67oFIjWwW8Q/j67wEzeP3F7yoO/luwpOyysWN0fCmkpnhVH5VnawWEIC+N6naKTxIzGt2a34vIAR4GdXd2QlNXC5HKAZiZwuv7hy0rRmfHhZf0IxakWAmxtZ825mtMyyeaq/7ux0W075S2cMDUhWNWy9b8FeifRs2mTAdJX+laoW0OjPyecoKRl6ODXNOSte7+H5liv426drwJSTATM+zJ8qqlaZG2ThLVQ==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:de;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BESPR10MB992227.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(376014)(38070700021)(261022105027099003)(10067099003)(56012099006)(261026140227099003)(261028144727099003)(261022075727099003)(261009223027099003)(18002099003)(11063799006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?5Z5ZCwemRJIVSstAqV7C5/5fO+JnEqE/mgP2S9E03znkQYkikNGRizhaGi?=
 =?iso-8859-1?Q?7WsvbHGnvPAkQz49yupGooFrasKyuwdNj4zgKDvv9YzheEqO0iArkMzTP5?=
 =?iso-8859-1?Q?qsatFyLRRpP1YIxNWihWk/U+DmnMuqvg+PRePBgGxUaNHot/Cubjlw1+1/?=
 =?iso-8859-1?Q?7UHAy+m3JoGVCB/v9jpa0akO4anNUqgUfRVWGdpvt11fL8zj1K40swpIxW?=
 =?iso-8859-1?Q?o3FmHcgqmmRzm9WUyxBuukBsWKDmeaxXlIcznmEqfNvnlUlCbe/TmdeKVO?=
 =?iso-8859-1?Q?GqXp/8naxkd6zQI9F3PgsAwDmgxUdzpljydvgXlqyK7S/3IWOO0O2nZ9Ym?=
 =?iso-8859-1?Q?7DXbrpQvqs1PN3LcrWxMrVK6Z72xYn9ZNbL/+6/YjZCQTGr20nXOlbMwO4?=
 =?iso-8859-1?Q?2W9rQGY/TtJj5yOxjGRvd6xuY3MY00jHxRLyhG1sopfrvT/rwSCO7s3hVK?=
 =?iso-8859-1?Q?jbvy2PeZFPxTqLPt2u2xs7yrXFOOB9xvKiaKPdmiDNEN0vIBOr6JrGDyHQ?=
 =?iso-8859-1?Q?nJnRvBYvbQCpz/jcQHvdyiAOCrMJI4Gf6FQoN837nxwGnRsG0ANMoz5+IK?=
 =?iso-8859-1?Q?H8rlM9Y6qMvQKqgIL5ah0fcWmUULxvpMcdGZhIKKNI3iPAX3YJRsFb9DUC?=
 =?iso-8859-1?Q?tNEbEeKr4OQ08rRX24DI2YtiR3tOKTct2iJt7gbvlavimVa609qJlaxL86?=
 =?iso-8859-1?Q?KlY5+oKm3Re1O6pXICaXkxe6CbTkYEzc47M7tEtnJYw8yCBk9QrbyBHZ5l?=
 =?iso-8859-1?Q?c6wtgpWOnk3u0ISsivPZrWW/nBlOm/5ym2VJUqtEy8OOgy6HCjJds2rwhB?=
 =?iso-8859-1?Q?+Qk5x4NK2VcE/hJCXBI8Cpmw5WpAOmvENGeh+QH5bisq+hOGJgfDBQ43yE?=
 =?iso-8859-1?Q?ZRrj5P3ncdOaUVaU7rIqbkXZwTb1rm5/lTE9QSLYUFtNlZKOMlCHKaAZ8Q?=
 =?iso-8859-1?Q?lFgS+TxPfvwGmHUt1v256nsCNAotvb5nM4e1F2vflyVW3RVRzr/thCr3e/?=
 =?iso-8859-1?Q?XPZ8P86Us02++c00NUBg/5Adw+b7QGFzJGImlFnpKhhr4jsoXaepNtmsbP?=
 =?iso-8859-1?Q?suOz2NJIGRvuAk1+1DSgdvL71jQ285KP6DldsWFuRd3+bBlvIy0qpm1bcB?=
 =?iso-8859-1?Q?LjtS4Vb6iZE6kC4t+3JTiXq1f7AR+GQ2jJFsbJp0XN6jyh/iMX4pPy2UQV?=
 =?iso-8859-1?Q?/6Uifs7oL7shSXWrvPcoqnvS32uQWbr5yQcO/5XV/qG6A/ox3u13W0xvmI?=
 =?iso-8859-1?Q?o3PA1nz1pCWW7TPg3pT9abK5OR6XuX9a8bx2Kghr/Pj2w6P1g2TlxFqP5H?=
 =?iso-8859-1?Q?uEEe48LObMgUf6kukZt44Ty30TyC1tl9qaigSLxCEzY2Ac9U2HheQKWf77?=
 =?iso-8859-1?Q?Ax8fqfRAL6FtxfZhIc8BAmQwEAsBCXi35ZvgWBa4hepmzLF/3iI/FmHG3P?=
 =?iso-8859-1?Q?5rVTo5sKft/TpKN6Tzmc3zpGCCmSCjgUOkQ2oT3ho6yKPGlKi89j/aimzh?=
 =?iso-8859-1?Q?VXGt9rwJpRSWEtv3HvhGZcrnYhFkUd6qlQG9gJWVPGsWnTsTfItSHJI+52?=
 =?iso-8859-1?Q?UrdQMU106ybMQpjTNcMaijX8eDHKfOoOw2+mu6cAkDFr/+r/sH1s+MFGso?=
 =?iso-8859-1?Q?CKr0yZZt017tkk4ixBVeo5KsrqahdRcj5psAAtTMph+dJC6hR0EngQBayr?=
 =?iso-8859-1?Q?OuJK+JfGO+9Hy/xGa6G3QprJV3OSzlEur+ZWV0cSP4SxBS11JBF6yUUiwZ?=
 =?iso-8859-1?Q?cZnTckM8xWEjkHYrLpMMKRiv9mW5Q40uYipADyCsGRe+rQTTeszZkEZYc2?=
 =?iso-8859-1?Q?PpEPp0AhGQ=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
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
X-OriginatorOrg: philips.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BESPR10MB992227.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 80f3b6bc-b83e-4735-aa73-08df4ba3c1a1
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Nov 2026 09:58:00.9729
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 1a407a2d-7675-4d17-8692-b3ac285306e4
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: G7+x/yKIVgLraHRV8va44NqMKau4IHxsktyN/qRfv4D5GKOuCWYYY0n5KoNHm3CUXXt7sTBUDgTOs6cvnQDUjg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR10MB6352


________________________________
The information contained in this message may be confidential and legally p=
rotected under applicable law. The message is intended solely for the addre=
ssee(s). If you are not the intended recipient, you are hereby notified tha=
t any use, forwarding, dissemination, or reproduction of this message is st=
rictly prohibited and may be unlawful. If you are not the intended recipien=
t, please contact the sender by return e-mail and destroy all copies of the=
 original message.
