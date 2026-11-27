Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=60.244.123.138
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795769275;
	b=5iLzl2tI2M2jpxQCAVXiQnmDeZ+xG6bZqx0n1Jh8XCVCNEUFki67HEiVM0RQ0HUlI40g
	 J0iWjgbo+urBy0+QgkNiUfkhMv7062OpPyxcMbgH10WxCfAJqjsJ9jljsIiXgptPN61nk
	 LbXPqS/pEhyBsI6Le+mLQAzT2sppp4n8ATwKLsfAU3pBvLUqiQmOOlcZoLL07acxMta5M
	 972io8YVjGVSx0wgiWti2H1q01fPw7zbb9Gv0J0uRNvgBaPMlZnIPt1j/B5BrhZEbtVeD
	 qJuS6zjudWd99G2tsswHvFbBSz7ZKHXBmkGYEIf/yib1gzW27VX5I6Ootx/yGbcd7pA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795769275;
	h=DMARC-Filter:X-UUID:DKIM-Signature:X-CID-P-RULE:X-CID-O-INFO:
	 X-CID-META:X-CID-BVR:X-CID-BAS:X-CID-FACTOR:X-CID-RHF:X-UUID:Received:
	 Received:Received:DKIM-Signature:Received:Received:From:To:CC:Subject:
	 Thread-Topic:Thread-Index:Date:Message-ID:References:In-Reply-To:
	 Accept-Language:Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:
	 x-ms-traffictypediagnostic:x-ms-publictraffictype:client-request-id:
	 request-id:x-ms-exchange-senderadcheck:x-ms-exchange-antispam-relay:
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
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=139SDlH+Wi6dgq36yGrSJR5OHVCkz8OByr/5RFktOBM=;
	b=4/5qUueDRzNqtv2ViD9qYxnyRrWRCaPNlBArmte51cDB1S2Pm72h2LKjVRH62CP/pZQX
	 MCSRtpdMnxrfwyFa4YFkayT6pqj12AsAAFtxmH/qki31lLQQOa5VeZB7VKa6mkYjvvCl7
	 PJF7ut/pmFDxPOg2YBgGXlGQfnk0MYaK9+9DCnx/LM9DNS9m91kRIcxv3VDFVF5n3uDdy
	 a1espyLpBWN+9GGRDGMjMwSHMDuvHRNCjgNKMdgSw2gQOR/Wl73wai3+kpdLJ+w9Pv/De
	 bLs37eG/kayUsdtRWKYSp+JrIuB1d+2nxtr6O580EuKtq2uuuE7veY0JopvDSP4jmlg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mediatek.com;
	spf=pass smtp.mailfrom=mediatek.com;
	dkim=pass header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=Yw4cwmJ3;
	dkim=pass header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-mediateko365-onmicrosoft-com header.b=NehWkqBF;
	arc=pass header.oldest-pass=0 smtp.remote-ip=60.244.123.138
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0AAD606A31C
	for <linux-wireless@vger.kernel.org>; Fri, 27 Nov 2026 08:47:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D0AAD606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=Yw4cwmJ3;
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-mediateko365-onmicrosoft-com header.b=NehWkqBF
X-UUID: 37145d76ea3f11f1b9cf3d4034dccee2-20261127
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=139SDlH+Wi6dgq36yGrSJR5OHVCkz8OByr/5RFktOBM=;
	b=Yw4cwmJ3KmtLaYaPYpg/VZrz2s0pxBkSTyFiq3gKxp8vq+VcFRW39d2IMbJRe1cVGE7I+zTqGyLSSiDKJa54lpiimfp99EHphl2eRzSKDROwBuTXJXxR9RW/5YASBBx79SFOCXX9PV8SPinGEiCLXU574F7hLWNq8KZLt+c3zqk=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.21,REQID:dd1131dd-e168-4085-a85e-37b9f36cbf89,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:b0318ac,CLOUDID:85fcdc66-4b51-4c95-bb1b-80ac6aad9c96,B
	ulkID:nil,BulkQuantity:0,SF:80|81|82|83|102|110|111|836|865|888|898,TC:-5,
	Content:0|15|50|99,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:n
	il,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 37145d76ea3f11f1b9cf3d4034dccee2-20261127
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw01.mediatek.com
	(envelope-from <eason.lai@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 673295429; Fri, 27 Nov 2026 16:47:45 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 27 Nov 2026 16:47:44 +0800
Received: from SG2PR04CU010.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.2562.56 via Frontend Transport; Fri, 27 Nov 2026 16:47:43 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o+Qs8IALN/31c+gktipqPlI+Qjr6PxkrwYFsbtat1rVqdZhnoKETxhzY5PskDYHOeC69AQv0ePZ8GYS8q6lO8KGICYffZyxzsPt1T60w+B4BNBqQbDZdBj9EvPBGKokhfACCQ/G/PupK3lQ1lcpTvS597sohQmQYdzD0UQVTyW5sviRYTtg9gp1rrkUB7w09h9Ym3ci6+LRwjeLz25JoCyV29tYmLuG3mrlNR2BetFzoEIddTdlJwpKeGn0eMX81aUM7hd6gYaLx1cBLYzhs+Al0M3qa4vZn3gKI2znK0Na3k5gbbtifzKj1yXl4eutvll1DuASaVsaJaGUWnBMu9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=139SDlH+Wi6dgq36yGrSJR5OHVCkz8OByr/5RFktOBM=;
 b=FRNHxNELd3iwOVHKGjLkzPTnCOfeiu6Rd+p6eYYip2xQYw4//9QEZrm/nfwGrfD1qgvSVMRKUa1seYZUM/FW7OkkpBvKLoq90lxtU0FTe68kThf8fuLuwmaXlf2U2nfuFCsaJvSg/0RoKTe5qzgfGU4B9+HZnUEQ03mYKZw2Cds+dfTd9qAxFxoVRrk6hOPKyeRnWPt93eDCDP4NtaC67MF75HqAHc/YtzSm5wudUfqdY2DWCkMSy3MXKKLGdLTbAnQV5/B8mfK5ks095Ro1wIILdFKjKRZvFwCwJSIwOSq4K6E64v1PRIfYx+9fZSdbYNwNnyMtUu7bJja4C6yanA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=139SDlH+Wi6dgq36yGrSJR5OHVCkz8OByr/5RFktOBM=;
 b=NehWkqBF5d256NWe5KIR70HkZH7GFXAaLbygfmNelB9vYUygQigE+6DY7JEV2Xwvr/WT1hCMnYL1Tcgb5hM9I4DKonYt3hkWuVaaEXhz01DTpu0oQFTKuoJSrQEXAa3q7bjiNZhoAd5I8sg37MhXRiUkAUn7CTHhDAnu6kSZFoQ=
Received: from KL1PR03MB7079.apcprd03.prod.outlook.com (2603:1096:820:d5::5)
 by TYUPR03MB7085.apcprd03.prod.outlook.com with HTTP via P2P; Fri, 27 Nov
 2026 08:47:39 +0000
Received: from KL1PR03MB7079.apcprd03.prod.outlook.com
 ([fe80::9bd3:f66a:efd4:f6af]) by KL1PR03MB7079.apcprd03.prod.outlook.com
 ([fe80::9bd3:f66a:efd4:f6af%3]) with mapi id 15.21.0662.004; Fri, 27 Nov 2026
 08:47:39 +0000
From: =?utf-8?B?RWFzb24gTGFpICjos7TmmJPogZYp?= <Eason.Lai@mediatek.com>
To: "greearb@candelatech.com" <greearb@candelatech.com>, "nbd@nbd.name"
	<nbd@nbd.name>, "lorenzo@kernel.org" <lorenzo@kernel.org>
CC: =?utf-8?B?S3VuIFd1ICjlkLPorLnoh7Mp?= <kun.wu@mediatek.com>, Ryder Lee
	<Ryder.Lee@mediatek.com>, =?utf-8?B?UXVhbiBaaG91ICjlkajlhagp?=
	<Quan.Zhou@mediatek.com>, =?utf-8?B?RGVyZW4gV3UgKOatpuW+t+S7gSk=?=
	<Deren.Wu@mediatek.com>, =?utf-8?B?TGl0aWVuIENoYW5nICjlvLXnq4vlhbgp?=
	<Litien.Chang@mediatek.com>, "linux-wireless@vger.kernel.org"
	<linux-wireless@vger.kernel.org>, Sean Wang <Sean.Wang@mediatek.com>,
	=?utf-8?B?TGVvbiBZZW4gKOmhj+iJr+WEkik=?= <Leon.Yen@mediatek.com>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	=?utf-8?B?QW50aG9ueSBMaXUgKOWKieiJr+ajnyk=?= <Anthony.Liu@mediatek.com>,
	=?utf-8?B?SkIgVHNhaSAo6JSh5b+X5b2sKQ==?= <Jb.Tsai@mediatek.com>
Subject: Re: [PATCH v1] wifi: mt76: fix possible NULL access in mt76_tx
Thread-Topic: [PATCH v1] wifi: mt76: fix possible NULL access in mt76_tx
Thread-Index: AQHdfX9spZ/Tp3tcoEmMBFCHwBRLcbdAWoiAgAFCVgA=
Date: Fri, 27 Nov 2026 08:47:39 +0000
Message-ID: <545cca17d60627d0fdd9da8c967e23172b9d060e.camel@mediatek.com>
References: <20261126082228.3226934-1-eason.lai@mediatek.com>
	 <a7776ad1-063b-46be-abb6-f4feaa22e12e@candelatech.com>
In-Reply-To: <a7776ad1-063b-46be-abb6-f4feaa22e12e@candelatech.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-traffictypediagnostic: KL1PR03MB7079:EE_|TYUPR03MB7085:EE_
x-ms-publictraffictype: Email
client-request-id: 8c081599-d315-483b-8152-73c55a5c1409
request-id: 9a554c1e-a086-42c1-92de-08df4c6317aa
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|18002099003|22082099003|4143699003|56012099006|11063799006|261026140227099003|261028144727099003|261022075727099003|261026121527099003|261022105027099003|10067099003;
x-microsoft-antispam-message-info: c2J4YmV5deFS/5jrl/iu6iq3eNyxcBkL3DxuP01b5jyeuZVxBYz16Z9fa+Qmu3Fj3SL/A2aoZOMLQu2G8dvF0HL1otrvyfgkcVzz4LcnmzNemWO/qsrKCgkeHaCaaKxq5+arPlyLRq7/9dT4S6rNw1y43QfBnF6l1zbQOJ2N5kmrTn87/wnKuNukIJV+c9fSF4OLjq2lIbmMUa09t2cEuFhsWmzFixZlT19T8Yzq51DhJPUaCoL4HsBIrNwSiQNQfRvDzY5x7jB/4Ta/NFaA4HXbFrShJQzwPZMx1vZw0WfuZCsaUr+r/62aK8PzfQl47ssWPurevRCOODKxA4LDZoQpwwDU/Lh4hDHTgOHd1MngQnv0rLRyJRD/KmDTsShXA396D3UpU+LfTkVhrBo+bzGhMHmU3vs25UQUA0z7dZWpYrMV5fD/wIlAz0Q1+QzpSZ76airvIWvJMqttsRc9CNxEH8ep4J1ahDQwTx2XpTvJ8Fb3vM7A7kQp2Leztx8TNMWcGVufKM/6eadQ5vur7mbPA1RH9Ms3JY08rxUn/BIM0F2sN0YVxO+fOEBYQQC1wvJJ/48lWOXejlV0auOrTIDrNmJL8LPBsaeNkr3D4l5Rq1nZg9oFgmONyTzISlOJiVwQMzEFs3PPlOMvljgAVOKh7/t/SSNCICXu/QX+ICU=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(18002099003)(22082099003)(4143699003)(56012099006)(11063799006)(261026140227099003)(261028144727099003)(261022075727099003)(261026121527099003)(261022105027099003)(10067099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eVNoUWRVYnpyamhMb1IvL2NCTDRMQWV3T2FEdnVWRmlqQytZaW9YSTF5RVly?=
 =?utf-8?B?RG42bEdiYUlOVC8vM2pqclRZVUZvR2F4ODd2NnMvaFdPaVQxcjc1MHcyVzVn?=
 =?utf-8?B?WitKQnRwYVpyS2dHQlpJQUtDOGs1UUhvTzRsWVlkb2JIWlhoYnQzV0JWaE1n?=
 =?utf-8?B?QzNaN0NOdDVOTDJBNHBKditaVkYwSzhrOFZqRHZueGMxVkpRVTZhRUNLWjR0?=
 =?utf-8?B?c29jRzhYR1VwcGNUZEhwc0YzWExuaGhoSmp0a3g3dHB1ZzdYVHgrZW1JSDdC?=
 =?utf-8?B?Z2NmQkVMWU1ZZTQ5d3p0elpIWExQQTB1cFRhL1ptamlPTGlzL3RHcXN4ZzBv?=
 =?utf-8?B?d2RFdy9tdlI0bXBMU2pPeThjWGkxKzg0dWVHN2d6L0JSSU5iL3g4QmF5M3F4?=
 =?utf-8?B?ajdmVTcxQ1hrNml3RXhES3pVOU9aRTdDM1RjcCtOSlVMclpNRXN6NHB3Uklt?=
 =?utf-8?B?R1hacDRKVDR4bThMU0JvaG4xSjlsV3h4SHpDaHk2WUk3OXpLMHp0TXovUHVD?=
 =?utf-8?B?MDFiSysrTzlNN3pzdjAxTld3bXBLMFE5OG5oamdSL2hlR2habjRHUFJ4RzJN?=
 =?utf-8?B?MHh1SFV4QTJGaW1vNXcwK3NZYmVEZnhFa1prdFlPTnVDUDlLY0trNGtnM3ly?=
 =?utf-8?B?YWpsRkdFSWRPNFVkbkxNVURRQkYxdzRER0U4RHVob21FREdmVHhkczA1bjBP?=
 =?utf-8?B?VXd2bHNTWFcwdk9hSkExQUlqZnFIaWF4NHZ6VGExOGFlSGJ0bGtxTVgwZ0gy?=
 =?utf-8?B?NkdHdDdVT0NMQ1BYZUFSc2FmMEx5eTBuSUNHRkNrb25UektaMHl4M3Z5K3J4?=
 =?utf-8?B?STJ2Nm9BNmgrZC9SZkhMMGVQblBqeDNna04wOWtMTzFOOVE1OW9KdGpiZ3pC?=
 =?utf-8?B?QmlOeVJydWV1Mnl5cGV4b25zbFJSNkVVSTFrcm9KUHo0amhxLzczQ1FURGs5?=
 =?utf-8?B?UkJ0RHBUYmpkVjBpR0hQODhkdHpoUHgzNm9mYkUyZlhrSXNnZlRvRTlabnNp?=
 =?utf-8?B?OTg5M0VGUFJNTjFkZXdpZzBjYUZ4RC9JSmNrVG9ocnU1ZHhHdEVRYWZWZk53?=
 =?utf-8?B?QzBTQU9xZmw1dVNOVDVsaTV3SUtlWmtjOUFTZ3pXaE5ETHpxeVpiazdDRUxp?=
 =?utf-8?B?VW9vdnRGUVdhaWRxaGZEc0d3cVpHM0tMRVNrSE90SEVtbVMwd0hWdDdyRVc5?=
 =?utf-8?B?RzZOVzNScHlzQjRKZko2eGR1clRkdGUxUmF4WmRWdjR4RXVpQ0x1MGE3M1ZI?=
 =?utf-8?B?d0QyM1o2Y3JRMDVITUd4bjZhMnRNeWl3bkcwR0I4R3dETS8wZHhscGxUVUVn?=
 =?utf-8?B?OWVubGpTbXBrem5LOW5EdFFCN3BPcmlEVjV5cXlHNm5mRG5zdDJBdnA3dEJk?=
 =?utf-8?B?dTBPWEVLN25ieFRxQklxdUVCZWQ3Z2NVQjRCcGVCM0ZseHAwU3lCWnZlU0xM?=
 =?utf-8?B?dnVYeWdaQlYwWUxGcHQ0YklING41djRyZXYreTMveU1WRnQ1SXZEelZ4N2lQ?=
 =?utf-8?B?VVp5M2ZKcTZQU3FiQzkwbUFMbG9SNnlkYnorYlVvK2MrWjdjSlgzbC9ucUQv?=
 =?utf-8?B?QlRsZmhpWnZHYnREcnl0NmZrN0ZiNDh2N3kzejVGblBZb0JrTWQ4T0tYY2Yy?=
 =?utf-8?B?Wms5OTZiUXlabzVrWHlXZDlsOHk0YnR1MDVxdWcxWDlBanBJWjdEN2dDdDZ1?=
 =?utf-8?B?NktJYkpRdHcvQ3dPeHUwSUlUQ05ZY3Y3WDhQSThYU0xCUTAydUt1WjQwbk0x?=
 =?utf-8?B?dVY0Z0xWNitxeFMyN0xyeUQ5Mnl3dkdtOGYyYnVERHF3REtIc1U0VHlyVTNj?=
 =?utf-8?B?dXF3MzVoRW5DM0oxcFZZUjJjTGxMbE91YTdiR05SMitVbjQ1NS9YZ055MVBp?=
 =?utf-8?B?SmpwMmZ4QmNIbVYxaTRIVVZOaTZIemFiOEcxZFZEdUlDbXJyQlJ4dGhWUHdT?=
 =?utf-8?B?N0VheVBmcHdDbDVTRzYyYnV1clVZNndkdzRVMzA5Yy9LeFp3VWpySlA4dUFN?=
 =?utf-8?B?UDBMWStTVGFYRUtnM3l2bkVybk9SbDkrbUZOaStxNERPSlBhNEJXU1NNMWt3?=
 =?utf-8?B?ZWJQK0c3dzBzR2FNUXlyTHRBSGxWakQzRUh5OUE3OXh3dFVoTkZJK1FCaVJV?=
 =?utf-8?B?RmQySjMyODRRWXJnUkpCUE9LUU12OXV3UnJ2T2tYVy9tVnVHMy9ULzRVOHZU?=
 =?utf-8?B?V0xXOU5NMi8zU1N4ZHVvN0swZ0d5QnBNSFB4dHBkUDBpYXNJeDFsLzJwZHBD?=
 =?utf-8?B?bTN2VDZDcm1ManNWckx1YmQ4NzlFWVdPQnU2aHZUVnl3SXJmREdIK2hOSnov?=
 =?utf-8?B?UFdUcGxMR3ExV1VVVHJFYmpiTDBXckRmVUc0dXA0QXJvdFdQc0N1Zz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <934DE5930FF54B499295DDCFE894A09F@apcprd03.prod.outlook.com>
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
X-Exchange-RoutingPolicyChecked: dv1wNuCaPexkqCkwargY48RA6u9rwhIFg/X6QEKA7w2c17tdzEuf9HuTmNNKyheVxEzG9HOQwY1AdNOu2UuBbh2FgQXGWStRoTCJQ/S/6GfGVKwKX5mBSun6eAFic0Nh8KOgjTAY5ROeY51fAmvGzq9/MtJUNe8qOYPxmuQE9AP5bUneBCSmhypRucD3Yf8bVAdtIyx83yT5bBG/kuT+tAHFwmW/5LhwtnYGpVbvGjM1/CUUeu7Es3xpY0c9HlLOVGPxM8LOOITM5O47mdihl7gqUoUsk9vmuFXIGXAbp8/x+vhB1xeQgh4+YNVtuNSFv8YuyritOZlYGHuYKG8UlA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB7079.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a554c1e-a086-42c1-92de-08df4c6317aa
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Nov 2026 08:47:39.2130
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jO8MPelpZibycob8e7CPBbqrMJjW2U5uwnNZ3UB6qhmQm+6Nu2v2/5zjf0IunK2ti1KvIILCdGFywdqaKoBbCQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYUPR03MB7085

T24gVGh1LCAyMDI2LTExLTI2IGF0IDA1OjMzIC0wODAwLCBCZW4gR3JlZWFyIHdyb3RlOg0KPiAN
Cj4gRXh0ZXJuYWwgZW1haWwgOiBQbGVhc2UgZG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0
YWNobWVudHMgdW50aWwNCj4geW91IGhhdmUgdmVyaWZpZWQgdGhlIHNlbmRlciBvciB0aGUgY29u
dGVudC4NCj4gDQo+IA0KPiBPbiAxMS8yNi8yNiAxMjoyMiBBTSwgRWFzb24gTGFpIHdyb3RlOg0K
PiA+IEFkZCBXQVJOX09OKCF3Y2lkKSBlYXJseSByZXR1cm4gYW5kIGRyb3AgcmVkdW5kYW50IHdj
aWQgTlVMTCBjaGVjaw0KPiANCj4gTWF5YmUgV0FSTl9PTl9PTkNFIGlzIGJldHRlciwgdG8gZGVj
cmVhc2UgcG90ZW50aWFsIGxvZyBzcGFtIGluDQo+IGNhc2UgdGhpcyBwcm9ibGVtIGNhbiBoYXBw
ZW4gb2Z0ZW4gaW4gc29tZSBjYXNlcz8NCj4gDQoNCk1ha2Ugc2Vuc2UuIEkgd2lsbCB1cGRhdGUg
aXQgdG8gV0FSTl9PTl9PTkNFKCkgaW4gdjIuDQoNClRoYW5rcywNCkVhc29uDQoNCj4gVGhhbmtz
LA0KPiBCZW4NCj4gDQo+IA0K
