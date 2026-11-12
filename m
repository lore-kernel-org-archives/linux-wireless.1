Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=210.61.82.184
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794470672;
	b=FlyhEzXgO0zze+Jr+17aDh2LukyEcEQbWI/Uo8dkyUfbDhtpb37Z8Ol6tCrj9NGtiPFf
	 W67294h7KF50gVoEcFrbMtoXgdXJAC8Y3wFNLJtN25zmq4MGimA94UXnCN0/1vkUDiGvv
	 e1GheG7Gwk7e7t2/e3A8JwLSZsb++fdMCG4GmqdRgsYb5/c9db6foFQhJocTZToHPkutz
	 jUx032hw3gYPRNxoYimTKUYtd393wRfc+CKpPQIGjh+k7004A4M+dCaHEDRnOz+oMNRGq
	 Lna6/aYoubPo7ViIqmGwxeYHCc7pYNDPVyqoT/ZYyRlpz1sHAItXloOvsEGbf3Z8JuQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794470672;
	h=DMARC-Filter:X-UUID:DKIM-Signature:X-CID-P-RULE:X-CID-O-INFO:
	 X-CID-META:X-CID-BVR:X-CID-BAS:X-CID-FACTOR:X-CID-RHF:X-UUID:Received:
	 Received:Received:DKIM-Signature:Received:Received:From:To:CC:Subject:
	 Thread-Topic:Thread-Index:Date:Message-ID:References:In-Reply-To:
	 Accept-Language:Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:
	 x-ms-publictraffictype:x-ms-traffictypediagnostic:
	 x-ms-office365-filtering-correlation-id:x-ms-exchange-senderadcheck:
	 x-ms-exchange-antispam-relay:x-microsoft-antispam:
	 x-microsoft-antispam-message-info:x-forefront-antispam-report:
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
	bh=6UEXVzomVOBinAc29vjmCvzS/+kLV97B4KKUnw6XYoc=;
	b=b5xfeF7ToPiQMMOp0ScFpF53SRRyCK5jhOORk/+PPVKVb+/tbOcvOct8VvPchrWIPnML
	 S3/ThoPpCewiJdwQJEu67RCyHAhPLP9olsCoynSJPHWHOOBsEr2a7iMcpKlzaUmrvw+hg
	 RSWegEgNJSBqmMQ1bpbV30AiteiR5qjyg2ftiMHbW7UyF5vf8DS3Vq4lTp9HPxRVrJCt3
	 KptOjixWe609yhvzNKk6g4aqXfZABgu+dDPukJdrgFKoB6P8u2P3Wcm/KrhFqvm+ROwT+
	 aoNueQixfxu5ATu5xAyI1aSVOr5PAiFCSBTnceSfIHVC6yKfVXBvKiQKqR8Gzm+SGyg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mediatek.com;
	spf=pass smtp.mailfrom=mediatek.com;
	dkim=pass header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=eSs+AYQS;
	dkim=pass header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-mediateko365-onmicrosoft-com header.b=DKaG2ISt;
	arc=pass header.oldest-pass=0 smtp.remote-ip=210.61.82.184
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1643606A880
	for <linux-wireless@vger.kernel.org>; Thu, 12 Nov 2026 08:04:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F1643606A880
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=eSs+AYQS;
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-mediateko365-onmicrosoft-com header.b=DKaG2ISt
X-UUID: acfae676de6f11f18dc8c9802ae25ab1-20261112
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=6UEXVzomVOBinAc29vjmCvzS/+kLV97B4KKUnw6XYoc=;
	b=eSs+AYQSFEEOVuCJE+NzNILjjanQJk6+D//7Box5tnc242kpI8Sp9MOwB6TV+OlZS5mReG6GZy9vgrRlAi4TznRjNjeh88DOrifIq6BySy9pVTuCA07Fw8cPOhWPFLB0pZN81EwLTfifIP4L2fWSQC2Z33AM/P/ZVyzgkA7qOLQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.21,REQID:97f81cec-8c0a-45ba-8136-5fe60cccbe56,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:b0318ac,CLOUDID:7c61a58d-b3e7-4795-ae33-b1b4d51e21d7,B
	ulkID:nil,BulkQuantity:0,SF:81|82|83|102|110|111|836|865|888|898,TC:-5,Con
	tent:0|15|50|99,EDM:-3,IP:nil,URL:99|1,File:130,RT:0,Bulk:nil,QS:nil,BEC:n
	il,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: acfae676de6f11f18dc8c9802ae25ab1-20261112
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw02.mediatek.com
	(envelope-from <michael.shih@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1971474674; Thu, 12 Nov 2026 16:04:25 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS09N1.mediatek.inc (172.21.101.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 12 Nov 2026 16:04:23 +0800
Received: from SG2PR04CU009.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Thu, 12 Nov 2026 16:04:23 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IsXETXRPuKApK4JkjRuc5gywJok/zKoGiwXOEuTgQe64CiOfRdIFyVKPQGHJXjoSkwyhNgs0hc1yG8KBZpWHTsP8hsVPr7S+yC35N6+QCPEnsL/5sdgqJC0kz1Sx/cYPYd5faJqGgnIJ77vt2DdHIZTIibKRIleJAWbpMlj2MSyFUioSco6WoQGEdFanMoFXJHMmw+XzcwbuL6gJJtJy24lZ1xBqqA7vlBZrurex8cvRj96fVzehUbogcOJOvKuGpMZZWdJ24ePLh7SqLEEvfztRCYy5G07cfN8EweaNJcTRxewdIIzQzJgL1WEOT9tOqTy2BbDoRvKfqVfnM5kWBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6UEXVzomVOBinAc29vjmCvzS/+kLV97B4KKUnw6XYoc=;
 b=gIsYH4dZMHYYFMBZUyC4deR0vbXamiHg/4LkkDddf9DFSkAiJx1adheVV3vrjD2cJsCaLc6u6tcCfNCs6AGPDtJXfOw9uf9d+CwGy+12n1PQpoatYzVS4JkpJwpUNsBpq1FoxpyKFo/JABSAnENV9XTvxcWhiz9StsLoGnKmKoCfOnkeDaZYnGRjOJEjBD3G03e136+tIimu9oydWBSkufROC4UuUMFId+CbDzrETNoTtFQ6x8wPlEZf/wu1EFfdPMgRfwumYuulQ+owanzSoxqc4Z6u1iHlyqUfSenDkPbxaTP759eeaBkhaYa1LNtJMY9LF3vnb5hp4wrrIix4Yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6UEXVzomVOBinAc29vjmCvzS/+kLV97B4KKUnw6XYoc=;
 b=DKaG2IStuzRh2lPBRXq0axHll0NTTP95KozQd24LV9FOrKvhFndFxL6mO1VmqlclN4owjTUkKU/GoRphZNImsYE/hgo056pU/OU28M0IiSLWDmtBHh5wdjBR0Y6cfcbNTvFH8h9y7LmYdoGCcOu3VCsHbrGz5Z8mJwDZHoims0s=
Received: from PSAPR03MB5734.apcprd03.prod.outlook.com (2603:1096:301:8e::10)
 by KUXPR03MB9505.apcprd03.prod.outlook.com (2603:1096:d10:51::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.10; Thu, 12 Nov
 2026 08:03:21 +0000
Received: from PSAPR03MB5734.apcprd03.prod.outlook.com
 ([fe80::4673:9c32:aed6:d6a3]) by PSAPR03MB5734.apcprd03.prod.outlook.com
 ([fe80::4673:9c32:aed6:d6a3%4]) with mapi id 15.21.0615.009; Thu, 12 Nov 2026
 08:03:21 +0000
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
Subject: Re: [PATCH v2] wifi: mt76: mt7925: support per-channel survey dump
 during scan
Thread-Topic: [PATCH v2] wifi: mt76: mt7925: support per-channel survey dump
 during scan
Thread-Index: AQHdcbNeAXm8Xm4O1UePLN7d0n8NsLcqFSkA
Date: Thu, 12 Nov 2026 08:03:21 +0000
Message-ID: <d68de32e639c7a61e7cff4d88bc277a538cef7e5.camel@mediatek.com>
References: <20261111071347.875266-1-michael.shih@mediatek.com>
	 <20261111080457.906770-1-michael.shih@mediatek.com>
In-Reply-To: <20261111080457.906770-1-michael.shih@mediatek.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PSAPR03MB5734:EE_|KUXPR03MB9505:EE_
x-ms-office365-filtering-correlation-id: d41e6cc7-95a0-4c4d-561a-08df40936b27
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|23010399003|1800799024|376014|366016|38070700021|10067099003|11063799006|4143699003|56012099006|261022075727099003|261009223027099003|22082099003|18002099003;
x-microsoft-antispam-message-info: FvHSXIQliTeiEytA6XFqvV2ywRQ6pY0kCsiw5TYo/JOpTviyRop3gADbip5xJPZS+lMdXrMeehVxVh+J/SUqlhRQEVvimF+VW+3cwGe0ayd/3YBUF2Ks3wCz/XK/TzpAK3oNfA0yvvTbhxNrOu6mi4tRr4B6976gGy4d9Uo1s2C3Zr1STEzkJTnNHUUlntn+uQgpEpMdkn7zS2eC5kKv+Ef0y0WC7e/as1xEnE7VYxlHn4V8k/DXeCVWCKlX8FAqroaVAyWYOS/v2TulORw2rLF4P6sopvc4ie56GFTdu2LhKK8JRr9q15yyGn0r4zS5quLKiTF+iXEkiCnH7DhHNTj/VLpxig+gHHhRVYNxlUeOCXDkNuQuQeupFL4nPJLWUnm32S20P3pA0jqhiE7frsebDMjtjdzSuMZYB+N94aoMOV6jPRXnpgNiCvMNym2F6/6RuSq8XdJl/HfAodL+NcM7pyexGT41IBXrojK3PHFx6N7hyV64ZJLaVR5zYe6zfuGDNg+OAbl63jCKFbpySAZp/xLu90oQzM+QjPzF59c5Igfd1mpoCLqIRQeS4Mk5IKckXqWtjYOxDLqP4oM3lrHoYuZu6vwATTpn//7hnDXFfQAPJmf8ORgLKJ7AU6eQkWKN2FmiflZ0gIDmvgWOeNIUzQ5ed0drURQ+BgKnvgg=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PSAPR03MB5734.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(38070700021)(10067099003)(11063799006)(4143699003)(56012099006)(261022075727099003)(261009223027099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?L1d2VzduOStVS1pRMk5vcEg5T2ZEMkVVSFRqQ3FIT3cvREIzMkxEQUVhcytS?=
 =?utf-8?B?QWF4VUs4RmJVRzIwRWM0RmVpdDhVZmJhaTBwMmZ5V3hsR01lN3FTS09tTURG?=
 =?utf-8?B?T3A4c2tNT3R5eVhLSVZ4Wmw2UnVsUzJPcFJ6dVJvYlRJUTdSTzFaL09TWG9S?=
 =?utf-8?B?V3BUNXZ3L0lOc0hOaE1rVnIvZkZlUUQ4bktOMWk5cVV0dk1wa2t5MHFyT0Jm?=
 =?utf-8?B?bHR5M1Z4WGdGci96NStmYmwrK3ZYOTAyTlZQODdqUWZNeUUvYWdSRk1VTHRj?=
 =?utf-8?B?ZlF2ZTB0amJuVTJzekZmMUh2YTNYSGh4SWNDNW9WSnFucVpHMEtYNHdyUklC?=
 =?utf-8?B?bVR5U2cwc252VG9ZY0c1STljS0pBNjlVWXo0UkZ0bUlpZkNucDd6WFREdys1?=
 =?utf-8?B?ODdiRW9oNmswK1ZDNCtJcmQrTGE0cTNpbWY2Q3MrK3cvaWpRYWdUT0x1UjR2?=
 =?utf-8?B?bFlTaWNDQnpWc2VzRitnT0lGbUdEVTQyeVdmVzhJNDVjQVZUaERMQ1hNQ0N3?=
 =?utf-8?B?MjQxZ0d4Z2hJSG40ZHFmNU4wa2R3SnhvWHJSTlE4ZVNvQS9tSXd5WXBDUkxF?=
 =?utf-8?B?dkw4ZFBpNFlFRHZvcjRhNEJ0cXI0cDA1OVFneVB5VjRVaUJPdjlmWjZ0bndp?=
 =?utf-8?B?OE1YRUdYWmtqK3VXempOa3VBM284M1BxZzVpTWhmWUpSUTZ5b0VCekJqcVpl?=
 =?utf-8?B?ZS9rdXRhTSs3Y2l4alkxMVlHUmdXVktFQ08yTkNyN2NiTHA2WTZKTWI3WEJn?=
 =?utf-8?B?U1V4NFFQWXpKQ2huUkZveEdxY0NMMTM2aWZmb0NFZTVpdWRtVUlCN0ZyUXFN?=
 =?utf-8?B?aTN5Y3NNQjdWdE1VR1o5UW1XMis5RU5SR0NoUmdjbHVJQ2NHcVFCOEhBbDh4?=
 =?utf-8?B?VDhzNnJHWlRsalphTlZoclFXcEdINFhSTEJRekVhRVZsaXFDbzhpWkZVZHpw?=
 =?utf-8?B?VC9ZWlI5d2ZsajFZSElqVU5VcnlISlVsVVB6Y3VoOTBtWGhHQWc2Tk43MTUz?=
 =?utf-8?B?V01Hck1rYitxNzQ5c1VXcmFqMVRMbnRSQVNUdEg4NGFUSDgxeFlRQ1VwZ3Vt?=
 =?utf-8?B?SlVMbkJDS0xRRkVLbXRLbCtFT1dGcHVZQ2RUMHFsSUVBNExHbmdYRldDZ1B0?=
 =?utf-8?B?N3J5eFVkTmpOTVBjeHUrYkNFZlRKMTBENXp2Y0NwY1VmaExhektNUkVaOG16?=
 =?utf-8?B?S3VZeGVQRVZyWlJIRmxNSXVpMTNYMWhDbzAxemltaC9sQmdnQURKV0huRlZD?=
 =?utf-8?B?blI3VUY5UGhxRVpYb01uaTl1eVpnNVdpNE4vNVd3SE5hNVdSRlhWOG16bGlQ?=
 =?utf-8?B?czBMNHo0VVprWTJHQ3JtT2lSSDQzMkpsb3dGSExNSGw0YXNRVFppVkduSzgv?=
 =?utf-8?B?bUlqamx3SnMrdE1qdjI2OHFGWENOR1Y5NU5uakY1eHk0R2Y3dFNJU1kyS3NM?=
 =?utf-8?B?WHVNN0hyNEk5dXhOWldQemdoRGg1K3RVQityR0ozUnkvcHI4ZlJRZ2E3c0Vh?=
 =?utf-8?B?OTNtTkVqeXBTcnpkVmtpeitlWVhQR1I5elI3dWpocE5BUERKaTlhVkx4Vy9Y?=
 =?utf-8?B?YnhlNXdnOTlQM0s3cVJSc1BENzRqZWRyRHZFNkIrOEFENklFVWhPcnJHdm85?=
 =?utf-8?B?aGVjNDg1YlYyZmFOM3RLajlNaDFXVFNlTkF6Y3VvZzFPSXhnY1NISG1TNERy?=
 =?utf-8?B?aFJyMVdJSGdaVmg4M1hnZ2pvTm9YZGJRODQwMmlGZnd2YzV3OVhmUzRlb2Fq?=
 =?utf-8?B?QWhCZ0lyWkJZbWNvcU5VY2ZpREpJaDAyVVgzcFp6NHhVY3dZRy9xK0t5Y3gv?=
 =?utf-8?B?cXptejVsYVZsSlcwTm9Dbnl5WDZ5d1lYSmM4dUh0b2FDNktmNHQ4Mm5iMDZR?=
 =?utf-8?B?ay9iS0VRMXZScnFubmdHQVI5d0FnNWJwMENRbHJUWlZ1WUZVRjZjcWR5WmlT?=
 =?utf-8?B?VzVmamsxNEVvVXg1dkdKaXl2UUt4OTVZYXJZVytFQkxCWHZxM2J4MTNRYkY1?=
 =?utf-8?B?dHI2QWRveUZZRE9QLzUxTFJsY1VoSFRhRDVTaEtabm5pUGZPbUVNTGxpTlNJ?=
 =?utf-8?B?ejZOTnZpQzBXajRLY0dRTTBMVE1aaW9HY3VOakpYWlU5U1ljSHhKNWJIdkRY?=
 =?utf-8?B?eDBXQ0NRd05yYzFWSFhyaC9uQXpvSnRuWkdocVFNczFmamUwcVRuMkxCVlow?=
 =?utf-8?B?MWVvZGoyZ0REYmorVGFNVmVGZ2o3bWR0NmVyWm10SFl4OTVVdmVaVlIrK0FH?=
 =?utf-8?B?bEVXUlZsNW1FallCOHdpMURveWFWR2U1YkovaGFUSlg0UDNMOTBzeDNHRjJC?=
 =?utf-8?B?YkVpbHM0aitLMzdzS0dpUzVtaGt0L2EwTFAzSVIydXdhM0FCYVd6Y3IxcFVp?=
 =?utf-8?Q?KCYNGTRfOLLvSFDw=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <23AFBCA0A4D7954BA84775BFFDE88D5C@apcprd03.prod.outlook.com>
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
X-Exchange-RoutingPolicyChecked: r4cgbCVBcjON+XVNpWiCHjlcYlY4J50LdhoY2IsLxgNuSrP1JkgElG2esmvk2R3d0EDMPJwRfOGtWgmky+Ff+BoSW4eG+II9r0Db42ZTJwd7oJlcRtFIV41sJIuf/vdNNXFYePPioxKtDZ+XR/DLHtefmnVVWP90LoDDSGy7Ft5GujNNrbALvvkoTjWoYqtffn7WqWUuVrGOvJgttfZDgGAvyyFvUTCmHC3QNHaKgUi+FxgABpg5Gv7L6sjoxNfA4OO92eWH56GZZwTch3AGVogHY3hTy/FDTyGjtBq8ogkPKK+azsyJ8tn0fZ/Dg2Ed+9ptQjPXeAm/7KSo55OvKw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PSAPR03MB5734.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d41e6cc7-95a0-4c4d-561a-08df40936b27
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Nov 2026 08:03:21.1732
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pr/a+aGKs+XRo66tEe59sk45tt3lpzaHa6CMzom0CSA/0jZ8lzO2Yi0ZR54LoUu0YgJOWZI7fuIu+hECmkXnlk1eT8vpNXAF3z+ox9zXX94=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KUXPR03MB9505
X-MTK: N

TmV3IGNoYW5nZXMgYXJlIG1hZGUgaGVyZSAoY2hhbmdlZCBpbnRvIHNlcmllcyk6DQpodHRwczov
L3BhdGNod29yay5rZXJuZWwub3JnL3Byb2plY3QvbGludXgtd2lyZWxlc3MvcGF0Y2gvMjAyNjEx
MTIwNzU1NTguMTgxMzc4NS0zLW1pY2hhZWwuc2hpaEBtZWRpYXRlay5jb20vDQoNCg0KUGxlYXNl
IGlnbm9yZSB0aGUgdjIgKGR1cGxpY2F0ZWQgY2hhbmdlKSwgdGhhbmtzLg0K
