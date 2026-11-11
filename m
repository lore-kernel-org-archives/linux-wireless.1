Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=60.244.123.138
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794384361;
	b=oN58Vr3bR5qrNcE2MgRYwTcJKHqCUZtcngU0SuXAfse6Iq2+JoLv1Hp6CNgTjdS9WnE9
	 tiYSiZoNUYZmDjabOBkj5vYQrSojVvBcKFiM7CJ/a24FgWrcjdUbVdggwHh90MsP+Lie5
	 BelRHWmMw3DjzVmESuOt+x3CNnXZBLydDuUQZs4DNyMmpl+I43q0KGERm1BWZ1aldYW79
	 ZHtH0hWBxK3JdNbUJG5aZWl+dOQM29Nvcqx/AHzLJvMUvwHMnETHEWJcSEImlh5l/AQEZ
	 je/dxcbcm0M+Fou37Z+Xf+aIGpsLJ9+XdMIE+e+lx6B6eX5pOIE1O8cyHmizUrlfZIw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794384361;
	h=DMARC-Filter:X-UUID:DKIM-Signature:X-CID-P-RULE:X-CID-O-INFO:
	 X-CID-META:X-CID-BVR:X-CID-BAS:X-CID-FACTOR:X-CID-RHF:X-UUID:Received:
	 Received:Received:DKIM-Signature:Received:Received:From:To:CC:Subject:
	 Thread-Topic:Thread-Index:Importance:X-Priority:Date:Message-ID:
	 References:In-Reply-To:Accept-Language:Content-Language:
	 X-MS-Has-Attach:X-MS-TNEF-Correlator:x-ms-publictraffictype:
	 x-ms-traffictypediagnostic:x-ms-office365-filtering-correlation-id:
	 x-ms-exchange-senderadcheck:x-ms-exchange-antispam-relay:
	 x-microsoft-antispam:x-microsoft-antispam-message-info:
	 x-forefront-antispam-report:
	 x-ms-exchange-antispam-messagedata-chunkcount:
	 x-ms-exchange-antispam-messagedata-0:Content-Type:Content-ID:
	 Content-Transfer-Encoding:MIME-Version:
	 X-Exchange-RoutingPolicyChecked:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-originalarrivaltime:
	 X-MS-Exchange-CrossTenant-fromentityheader:
	 X-MS-Exchange-CrossTenant-id:X-MS-Exchange-CrossTenant-mailboxtype:
	 X-MS-Exchange-CrossTenant-userprincipalname:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:X-MTK;
	bh=8MgpQIzMwDCej0NjBmLQEVsbCyRJHsG0REnzJf/tmzo=;
	b=I+dvrCiBQ1zv1zUi+UMOvJW4XWxNv+8+EQIqrJqB317/m3QPjHVGDvo+iGHOuZOa+odc
	 XkuheNNarcJL7NVQrkwoeZwFMHgnAWQ2eilmWwp3Nkwf7T62ZrBgSs+uJVQnlRi14Al1N
	 sEAo5adrcntya38FTUyueX0u9GVQt+0tQuHIxMnYHPpRWUvSi8TAPIpo3DK2HkOELUmMM
	 zcXqKqDDefwKDy+SI6k7a7zL6qh3JS3BFuILcXBPAFY5hqs52XRv28wsrZCkv0to6ndmU
	 t++P0TjoV22qQ+54Z4m8xHKfzRcXJ0yiumf6X6RwURG50OdI9VFMak6kFzCdXmNDRtQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mediatek.com;
	spf=pass smtp.mailfrom=mediatek.com;
	dkim=pass header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=U+L0V6XD;
	dkim=pass header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-mediateko365-onmicrosoft-com header.b=FUzfwfOV;
	arc=pass header.oldest-pass=0 smtp.remote-ip=60.244.123.138
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16606606A32D
	for <linux-wireless@vger.kernel.org>; Wed, 11 Nov 2026 08:06:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 16606606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=U+L0V6XD;
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-mediateko365-onmicrosoft-com header.b=FUzfwfOV
X-UUID: b7e652ecdda611f1b1788b6acf885367-20261111
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=8MgpQIzMwDCej0NjBmLQEVsbCyRJHsG0REnzJf/tmzo=;
	b=U+L0V6XDPj/h/J2DJZ01CIHW06/Ygbe0GTV38vd8+8Jdb5vC7JXRG1kY3tQqUTCqqKXjXG6dZhWelzlpQ1e6BPJGKjSul5riMn2LEgBw/mn7z8nnC8PnMLaqsMbU+V3J2iu+Y/3o8wwAZ0JUZ7sFuDhVdCj5TruQWB7PtO39gIk=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.21,REQID:5046fe30-3943-43b5-a7a1-673f1b713583,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:b0318ac,CLOUDID:9600988d-b3e7-4795-ae33-b1b4d51e21d7,B
	ulkID:nil,BulkQuantity:0,SF:81|82|83|102|110|111|836|865|888|898,TC:-5,Con
	tent:0|15|50|99,EDM:-3,IP:nil,URL:99|1,File:130,RT:0,Bulk:nil,QS:nil,BEC:n
	il,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: b7e652ecdda611f1b1788b6acf885367-20261111
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <michael.shih@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 429486940; Wed, 11 Nov 2026 16:05:54 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 11 Nov 2026 16:05:53 +0800
Received: from SG2PR04CU009.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Wed, 11 Nov 2026 16:05:52 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rCptyCgtz2e0TJK+Be96pE123HY7aReEQkR6ZAvH3hpceX+cSzzFy1dSbUuCKfNnSsf7ewCYLN0nJJqDgpOzi5CVhceEVlCgayj3n4wjwumCau0VnPoYaDOpsDzVZ85DSd0A92LK5aAfpyeWsNNeuIA5fxeZIO5bRvVr45xDAfw8wBq9pFKTBY3YvRtXrekX9kGHRdEtgCRrRIMv6MH4MryEp9K1N4u1TtaVvV0zWxxFOP7BC9TtrkBsB4+9Z2fKIPg/AeqnVs68btkY0QsahJ8Zr+MzwGRoBWYyg4SX7OoJmCnMHtlkKmwajnH9huc3FMEQbkoa24TL9neDorLfog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8MgpQIzMwDCej0NjBmLQEVsbCyRJHsG0REnzJf/tmzo=;
 b=Zk+j6liiRLBiW4DrmWiXsOVfcI7LhLuikFe9ZaJ+rpkWG9im4AvSHlJrgTz3rJ2ms42BVws9GWzsHok8JpuLCIGY/9a3Ea9O6Xk0b0Pgyiy+avUIZCCzz71OaFC/fHcY8QRJdM952bANrsWgnatRStvltj0NXVBliXY+nz2Eumln4kVKyHOEGtatqBZDKq10KZR7Pg8CZPfmNJsYTYPJ89xneliUzej+pedWpKm+VVUH8vBJocnk5Xa6eWeEChqarg0dfIoZU5DXIjVk6Ebdo6ejgER3IKI1kLEM68pRzYWEm1D6Hk+Aoh2Iz7E3spS/D5mbBZkJJCoApS7rGqkuDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8MgpQIzMwDCej0NjBmLQEVsbCyRJHsG0REnzJf/tmzo=;
 b=FUzfwfOVS4dABuGULiKvsj+CCrvEnkZALpn3Nby1KxcN3SUw8aYKNg1n1Qp28rqFmSKLZasSmTrNalOGMoUs8lUf6MW/mBYvoiBpTGSTvfjufNPz0g3Um6nlx6Tm454N5k8h3M4d9DbFyDBhga8dVQQzgf2mWc/cgGMw4x+Z04Y=
Received: from TYZPR03MB5742.apcprd03.prod.outlook.com (2603:1096:400:8f::9)
 by SETPR03MB10467.apcprd03.prod.outlook.com (2603:1096:101:31d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Wed, 11 Nov
 2026 08:05:34 +0000
Received: from TYZPR03MB5742.apcprd03.prod.outlook.com
 ([fe80::ffd:f333:4ece:dfbc]) by TYZPR03MB5742.apcprd03.prod.outlook.com
 ([fe80::ffd:f333:4ece:dfbc%5]) with mapi id 15.21.0615.007; Wed, 11 Nov 2026
 08:05:34 +0000
From: =?utf-8?B?TWljaGFlbCBTaGloICjlj7LlkJvku7Ip?= <Michael.Shih@mediatek.com>
To: "nbd@nbd.name" <nbd@nbd.name>, "lorenzo@kernel.org" <lorenzo@kernel.org>
CC: =?utf-8?B?S3VuIFd1ICjlkLPorLnoh7Mp?= <kun.wu@mediatek.com>, Ryder Lee
	<Ryder.Lee@mediatek.com>, =?utf-8?B?UXVhbiBaaG91ICjlkajlhagp?=
	<Quan.Zhou@mediatek.com>, =?utf-8?B?RGVyZW4gV3UgKOatpuW+t+S7gSk=?=
	<Deren.Wu@mediatek.com>, =?utf-8?B?TGl0aWVuIENoYW5nICjlvLXnq4vlhbgp?=
	<Litien.Chang@mediatek.com>, "linux-wireless@vger.kernel.org"
	<linux-wireless@vger.kernel.org>, Sean Wang <Sean.Wang@mediatek.com>,
	=?utf-8?B?TGVvbiBZZW4gKOmhj+iJr+WEkik=?= <Leon.Yen@mediatek.com>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	=?utf-8?B?SkIgVHNhaSAo6JSh5b+X5b2sKQ==?= <Jb.Tsai@mediatek.com>
Subject: Re: [PATCH v1] wifi: mt76: mt7925: support per-channel survey dump
 during scan
Thread-Topic: [PATCH v1] wifi: mt76: mt7925: support per-channel survey dump
 during scan
Thread-Index: AQHdcaxEhlK3JmZw7ESK+OkMpnrN97cog4GA
Importance: high
X-Priority: 1
Date: Wed, 11 Nov 2026 08:05:34 +0000
Message-ID: <daeb5807d7121c4be27a3074fa4c2f570c9b2b42.camel@mediatek.com>
References: <20261111071358.875331-1-michael.shih@mediatek.com>
In-Reply-To: <20261111071358.875331-1-michael.shih@mediatek.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB5742:EE_|SETPR03MB10467:EE_
x-ms-office365-filtering-correlation-id: 83ede701-f7f7-4cba-6ce8-08df3fca905f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|261009223027099003|10067099003|261022075727099003|11063799006|38070700021|56012099006|22082099003|18002099003;
x-microsoft-antispam-message-info: gEbsKd0UVJXCzzEf5Bbp/RiE6CTTwP7/mhSRpvKi4HFnrTs/oHtx4jPbQucNbOhN9g9tOTjmpJjLaLb2arfmhhSGMup9v9q4eUEYwnWQQjgkh+CjMLrkBT78gSBYZG2CVo8m+xBQpzsoH4C8tdcMxO5wnqBZ+LxV3HuftoTdj85v7NYCl6Pf7BxDYwJjhnDs8gPDW3GcJRHQ53lLKlyf8IyYPaeinKb/sl3nqIsLwmfP0z6TyqyK2CO/oXUTISuaD1AAHe3Ok0h4cnhJLLnBfpJcL+AFQLhT5Efi5BmfmOIeCsr1pPlLSo26LDgPT3t7Zb0SLYu3+YtK5cvZvW4ZMQKZ7R2cbrobJXym6WDcQOLYn13R1UCsv6tIklaN4S3RF0LlERw4ZYMVCsTWHwvrz24bqzu5xC37QbvpyyOlEUJKVMuy8lt7Qw3rKKH4X8UkIapDNVtXiGTh+DkDcvucbLPsRGaufqJ+Xo3MLLrtJCpp9KEXd0K4IJrouhbkuwRidar5v1voHoDFKRSy3lGJh06T0z+1gip05TRTSCDtM0z407eIrcJx1m0oIlCkpdfiK7rX8btD86jRvkiAVRV3YZ420fdJX77LqF8nekc3nNRkI5ahqdkhMVyklw4+ZCf91qMCtk5n07W3UDpiWnfHqamM8ZfisJKaDWins4yDa3U=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB5742.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(261009223027099003)(10067099003)(261022075727099003)(11063799006)(38070700021)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RVY1TC9PWTYxcERac2grS1gybzhqangxYnVPS2pUT1cwakQwRytaVFZtSGJa?=
 =?utf-8?B?VWN2dTZLMkFocjhmcWZqdUVkWVllVjNKREduamkrSXJCQ2ZReXhScnhPa1A5?=
 =?utf-8?B?bFlVMGRqeFpGZVBoT1d5cXA5L0xGdkJFbHQ1S0FWU25Qejd2czFQeFRyVVNn?=
 =?utf-8?B?cVQ3dGlBOThFeEhZejl0dUtqaG5KdmM3ZHh4azBuWW5hekcxT1p4eTVwMzZO?=
 =?utf-8?B?T2pRRG5McGFUZHIzUXltRWoxSWljanpySHNXMnJiL0R1MmxmL2RYbFV1Tkxo?=
 =?utf-8?B?QURtbkFsMXl5NXJxenE4Tmlld0I1THp2Unk3NXErNHRJYkExaWRQNkRxMVRz?=
 =?utf-8?B?Z0dmckhjd1QwSjErbDIxdUZ6aG1jL0p0SGdzaERsdjRQWXg3TFU0VUw5bnpO?=
 =?utf-8?B?Q0RmaFVpT0JpRTN4WUtvZjhQYkZpWGxDZW1yYkNLeWRXTkhXZjIzQjN6TU5i?=
 =?utf-8?B?WVFvN01DSXo2UXpNWXRIYzlHQmc0aGxFaStGcVVlNVJKSUhRR2I2ZDNuSjh6?=
 =?utf-8?B?TFdWZU5nb3hlM1NEVEt3THVpUEhPMSt2Q3ZBYUZYTTNjTTQ0NWRNVUdWQTFD?=
 =?utf-8?B?WmxjbVBoVEYxaTdCQ0Q0NkdGbW1Za2FVRkdWYVVTZjUvakkrMU0vUm50U2hh?=
 =?utf-8?B?MVYwc0N5MXlaV1NFaXMrc1Y0OTl2NXZMNWdlK1kwNFJmVlRRVFVyVVFkblRx?=
 =?utf-8?B?L01keHhYa3g2M1V5U2x6Z3k4WXdCY29CTVUxejFzS1ZoMU90QlNhNFM5ZDNG?=
 =?utf-8?B?QkN4UzZFTk15NGZOSFVQZEh5QXltbmU4dEtXcGlZOW91MURGa0p0MEpQdHdz?=
 =?utf-8?B?VlY4bnBpRTYvRWx5N3Z3WXJ0Z083MEFQbnMzZUJ0L0JCTm5kVlZrQy8rd0dB?=
 =?utf-8?B?b1czRWxFWE84SlhHZ3EwRFIwV1BxS3Y1L0o1Qm42UDlUam1tblQrem9WZ3Zy?=
 =?utf-8?B?UDRXc1JiMHFOdjYvc0ozQzczWUpnNkI3SFRLbHMyMFEyV0NCVVcyZ1V4N2Nl?=
 =?utf-8?B?MFh0VWRMeUwyR0VoVURqZ2RCTGpWM3d5RU43K29ORitESGlESVlyb0d5TmZP?=
 =?utf-8?B?eG9hbkx5b2p1OTV4NlpkUkNxdWJMUlRSUnhBNXdXQjJ2SmVsUXgvc0c1ZW15?=
 =?utf-8?B?ZXUxbWZXUWVKeDl2Vlg2NVlHSldEUzBENFUvQWdUNy9xUlcxUDEveGFrVmFY?=
 =?utf-8?B?N3RWM1QxTWwrMktwb2ltMkNEcjFzSUVCTjhYL3lCVHBjeTNrakpicjVUcGxn?=
 =?utf-8?B?eDUrRkdkdnI3YndSL096Sy9QT1Zxek9GdElKc1NLSnFrZVFTd0NYUmgveUpj?=
 =?utf-8?B?Z3RGL2ZUUlNDSG5pbXdUNHZlSXZVdXBLSU8zWGJ5T2M1WDhUdjJFM1dKSmVG?=
 =?utf-8?B?cUNaWFNhck5EV3dBSXVzUmhldjVUMUNLWDZTZis2cTJrdzBNVHpKc1JBQVE0?=
 =?utf-8?B?bVo4UnhUcUFIL3g5MUZ3VTJmejkrTS9PYkZhZUgwdUtsK2VCQWRiSUt2V1gv?=
 =?utf-8?B?bHJYeWxYN21MVC9xQnhKZStPUHhhaEM4QlFrZVRPV1hPQzdVSGdRakwrM1ZU?=
 =?utf-8?B?RjMyYTNoRzF3WWI3Q2ZXWi9mdGtjcGJoYi9GN0xTdzlmMUNwSklOdGQySGlw?=
 =?utf-8?B?S094OVpJWnN2TnlLMHZlR2N3d3pyZXpaTHF6Sml4S3RieTVnc0FBSnRhNTEx?=
 =?utf-8?B?U01Ddkp1eHBaSVlGcnBiTi94RkJCODNNK0NLcTlpaEsvR1plNUhpSkNPMTl3?=
 =?utf-8?B?VjYyMzVGQjh1SjVhU0pvS2pheDJ3bFJJSjlNZUNNMlprYjR1T2VBUHVmWWgv?=
 =?utf-8?B?QzFxNlgvNmZuUGtLblIraytlamVCNXk1Y0tTeGJuMW4ycjAvMXEzYnJ4K0Z1?=
 =?utf-8?B?NzdidHkwdVBBMlNaT3JMYXRlZkpocXhBc0NnZ2Exajh4dTNGaWFxekJCR3VU?=
 =?utf-8?B?NTJIN0kvR3dkNUdLdGJPczlXMDM0WCtIWE5FYUZkZDVYTkNCNEs2OW90aW1k?=
 =?utf-8?B?NnVsdDRCL3ZxRUM1T3NucGc3ZXg0cm1PKytqT0lRNENkdnB5dHFQRXVBSXVQ?=
 =?utf-8?B?bzZRRjZheTdOQm0wSTd4MndXelpjRDRSdytVQU5SczNCSHpCYXhYQXI3V0F5?=
 =?utf-8?B?Vi9pTnNvdUpsWHVOT1J5ZGppbW5oR0NkcmpOUGE2dnVZYXJkR0RTVG52bW1h?=
 =?utf-8?B?bEFDVzA5YWtrUlhrTTN1Y2F2QThyd0QrQlBOa1QvNnkzVzkxQkN4R3UxNzZi?=
 =?utf-8?B?OHIxY0JiU1U5dTdGV090UzhEeTRLZlpoWmx2N0ZFNmdmd0lPMXhSWkdmVkJp?=
 =?utf-8?B?cFpoQ3ZhWnI2K1hFU2xtRDJibjNJSTlSQnU1c2NwNG5mWXQ0b3Vlbms1c0dq?=
 =?utf-8?Q?0YPgu1Kgjd3NYpZ8=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <2509AFA6F7810F47938538E7AF6E849F@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: ficGKFinExXNCyCNu3s9vOczflUnYdBW2Abf/sdnjZqro7nPHmUNq4DeEWW1nipEVO01jlchYf5QqOcpgy8mL7TLVglHlBMD6r4jryCLuje/ksiJhxmz9KYWZtbjWPVKmMVhDiW5YM2m7WG76eqe8kfNUhotVcywj6IobwzcSaBuVH/Xg1aGxXq/xQxhjLW1KQ+VP4LhgiPXR4Cpb1YTARWQgnNkPefXjvHLNA395/E8CxkWneh4pBKqC5yPTMasBdc/yWlBAX6D/EM9mTylgDKD2n9g+qX5lEeFUowqH0DksQ7o/ikf3b0nVEd+nMvW0fNwX2P5+eB9oPrctFI/bA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB5742.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 83ede701-f7f7-4cba-6ce8-08df3fca905f
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Nov 2026 08:05:34.7861
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ObVaKzHN6IXVZ6CkV2OSeYh3s30bx4wFKlYG2lMcCZD5gY3LtkVk1xTT9ZIEKgKiWHP1NTypFnjuVF4gFl7Zf1/dGLfgfw5zbB6RR5ZUUwg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SETPR03MB10467
X-MTK: N

VGhpcyBpcyBhIGR1cGxpY2F0ZSBjaGFuZ2UgdG8NCmh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5v
cmcvcHJvamVjdC9saW51eC13aXJlbGVzcy9wYXRjaC8yMDI2MTExMTA3MTM0Ny44NzUyNjYtMS1t
aWNoYWVsLnNoaWhAbWVkaWF0ZWsuY29tLw0K
