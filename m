Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=210.61.82.184
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795738019;
	b=UjUDcOWjcmb6Zvg4iNO0kYPdGpv5G3hEexSkUHb9A2NcB8u4xP/UD4voMHUvEa1ZFEZQ
	 +tbKY6ZibLaOm3qPH4zO4Mfl+GpOMhjXYPnnyd/TCFTKAx4OdAq2o4tD/Es2RXTgn6xAU
	 gzDvgM5ho/XX2VZWkbXyCx/pf3VF9w9cRzv/C5QSsTpvFgUhtj1bMOAVmbxmtW64ZdfCz
	 jdq6QBnzry5TJ3ThO/WT+O+0Unz69qzHIsuL7kVEIGAECqR/J7jS4OhoMWcCfvCw7vmgx
	 CLfQw73Y0oU5t6BDxR+tTBZiwM9gaw5t+O5WSGL/Za4msD+azUvBBtkIifeiPV8L64A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795738019;
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
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:X-MTK;
	bh=M6G7t75C9om7yZ3s0Cp9MieazeyLPmoODxSGq8PTP5Y=;
	b=00LN7sTIQmFS5nM36EOVyQAvz2Kh1Dd6LG/7m4SGUNEozAL3+T2Oo7sFuakkUVXgbwff
	 B+1X7xwwI37iav1Xon9NmO240LO1kCH1Y8HXpbYzsosDW5nT1GsgCIByJLbonjv5P395D
	 HmtkA97786A4HnCQ9nuTy7cgLipp1gS/w3rsgJmlqzMdzHgMYHeFO2NBAfqGGLrTWM17x
	 2R6+SIdwjBhXSt1yVIWRlmEv/c2oNgBwwzIPlj86bqx81mHv5f4dxgmjQH7ccu5z9AdbA
	 nf6M4n5G9STSh+S+hAoRqFq3ohdcDpHfgws4QkrMQzzHZ+LAOL21yAWal8bJpfbcFsQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mediatek.com;
	spf=pass smtp.mailfrom=mediatek.com;
	dkim=pass header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=s4H0IUBb;
	dkim=pass header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-mediateko365-onmicrosoft-com header.b=qhzOZS6Q;
	arc=pass header.oldest-pass=0 smtp.remote-ip=210.61.82.184
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80D52606A323
	for <linux-wireless@vger.kernel.org>; Fri, 27 Nov 2026 00:06:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 80D52606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=s4H0IUBb;
	dkim=pass (1024-bit key, unprotected) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-mediateko365-onmicrosoft-com header.b=qhzOZS6Q
X-UUID: 725e100ae9f611f1a7aecdb2598be72c-20261127
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=M6G7t75C9om7yZ3s0Cp9MieazeyLPmoODxSGq8PTP5Y=;
	b=s4H0IUBbPbB7ig/p68god5tSZG5ytw6da7kIrhHNpN5FPmLLRYR97eq8ESoRT+gAox4rBQX3uD7N/V3+v3MU8xkCjJNETULYnLss5k68JcNrofxqruavQzLUJjDkVLDOmFBIsCVaDikTQpnExkNnPQF1E4lVJ6K8L+BzcHh9oF8=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.21,REQID:bd538650-14c8-4d69-b88e-9d116e042604,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:b0318ac,CLOUDID:14cd6531-f289-4656-bb36-27baf4489f11,B
	ulkID:nil,BulkQuantity:0,SF:80|81|82|83|102|110|111|836|865|888|898,TC:-5,
	Content:0|15|50|99,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:n
	il,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 725e100ae9f611f1a7aecdb2598be72c-20261127
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw02.mediatek.com
	(envelope-from <michael.shih@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1855596877; Fri, 27 Nov 2026 08:06:51 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 27 Nov 2026 08:06:50 +0800
Received: from SI4PR04CU001.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.2562.56 via Frontend Transport; Fri, 27 Nov 2026 08:06:50 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b0dB7rHjb8ZirQrGvliRYvtBS7r+bOW4EjK4NfHlCB2YkWXyJE7NRJK3dNj3zEvOQ6vcQXHTAf1PsnyY4HnAj83InQxZka1SYJTT0MeF5nYiVRggM/51WmZpqwcBLt6kZ+pyrYqTIz7OOExP87NOzCmKBT1nE7ZzODwX8BlP7BIkrScLq6e8n1VHvqtuQDtz4+9aRoXf4paajNZzPdglz8K4hmjL0rl0qWHtZcgwI3eK65AzlgEviY+5fum2LFxl28Mp8D6veWEtJ9svD7wLINu/Tne6hSYfhhe0pxGPuVY4qfkVyJl8YeaZOtsY1us53F6rFmlH2AwNY8ya9+fstQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M6G7t75C9om7yZ3s0Cp9MieazeyLPmoODxSGq8PTP5Y=;
 b=Bk5bsBKs6NdPvQvZVf6mxvrdaEYNYau+An5mKK+9Qs7j9cikIQFTHsgk3hgBS1XdYOXELlEOHnodtUbYw/VGk5ZsrQ8RRv5QCtEySNHeTublh0XPkBsc+KEgaSG4F2WLN58wBgb4/++O0PUiXmX7J/qiemtdxkkBN3AUOMgvpKkYiFg1u8QWnnAi0j1tsz3bRA30SkpswvNKE+DLSS5MBC66wZxAO96QmSNPTOvDza7m5NGrasILor1RV3FO5Pz7ReENvUyYZu1rdcwaiE3+SCnnd1zUVZvP4z7dlyfzxke5R9XhzbBLmSWqIvnw3Qy8mekPWXYffUyZhjIUh98crQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M6G7t75C9om7yZ3s0Cp9MieazeyLPmoODxSGq8PTP5Y=;
 b=qhzOZS6QwzH0yPR4mLqWfsLQQ4XLB5L3ZbV+ho1+pTPr3nQrLA66iL9MEDQKliO8lRfyaCoPmmrCPTr5D/Gp/D3lsSz5ZMBm4iUuEotdiHUFsCFHYUZu3nVQKgGQ/kcwsGkHlSh1/5h8aQU7QPbf3K1VFQwOOrAy+mT2OjCWnHw=
Received: from TYZPR03MB5742.apcprd03.prod.outlook.com (2603:1096:400:8f::9)
 by SG2PR03MB6684.apcprd03.prod.outlook.com with HTTP via P2P; Fri, 27 Nov
 2026 00:06:45 +0000
Received: from TYZPR03MB5742.apcprd03.prod.outlook.com
 ([fe80::ffd:f333:4ece:dfbc]) by TYZPR03MB5742.apcprd03.prod.outlook.com
 ([fe80::ffd:f333:4ece:dfbc%5]) with mapi id 15.21.0662.007; Fri, 27 Nov 2026
 00:06:45 +0000
From: =?utf-8?B?TWljaGFlbCBTaGloICjlj7LlkJvku7Ip?= <Michael.Shih@mediatek.com>
To: "nbd@nbd.name" <nbd@nbd.name>, "lorenzo@kernel.org" <lorenzo@kernel.org>
CC: =?utf-8?B?RWFzb24gTGFpICjos7TmmJPogZYp?= <Eason.Lai@mediatek.com>,
	=?utf-8?B?S3VuIFd1ICjlkLPorLnoh7Mp?= <kun.wu@mediatek.com>, Ryder Lee
	<Ryder.Lee@mediatek.com>, =?utf-8?B?UXVhbiBaaG91ICjlkajlhagp?=
	<Quan.Zhou@mediatek.com>, =?utf-8?B?RGVyZW4gV3UgKOatpuW+t+S7gSk=?=
	<Deren.Wu@mediatek.com>, =?utf-8?B?TGl0aWVuIENoYW5nICjlvLXnq4vlhbgp?=
	<Litien.Chang@mediatek.com>, "linux-wireless@vger.kernel.org"
	<linux-wireless@vger.kernel.org>, Sean Wang <Sean.Wang@mediatek.com>,
	=?utf-8?B?TGVvbiBZZW4gKOmhj+iJr+WEkik=?= <Leon.Yen@mediatek.com>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	=?utf-8?B?SkIgVHNhaSAo6JSh5b+X5b2sKQ==?= <Jb.Tsai@mediatek.com>
Subject: Re: [PATCH v6 2/2] wifi: mt76: mt7925: support per-channel survey
 dump during scan
Thread-Topic: [PATCH v6 2/2] wifi: mt76: mt7925: support per-channel survey
 dump during scan
Thread-Index: AQHddkNbL6a1le0dXki/MD03jnFH/bc+1DIAgAJFpYA=
Date: Fri, 27 Nov 2026 00:06:44 +0000
Message-ID: <a865eaf5c06a8f8953313e62c074d0a2e1cfd621.camel@mediatek.com>
References: <20261112075558.1813785-2-michael.shih@mediatek.com>
	 <20261117032530.470475-1-michael.shih@mediatek.com>
	 <20261117032530.470475-3-michael.shih@mediatek.com>
	 <2ea4dc91-9235-4b54-ad7e-0fcefcb933e5@nbd.name>
In-Reply-To: <2ea4dc91-9235-4b54-ad7e-0fcefcb933e5@nbd.name>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-traffictypediagnostic: TYZPR03MB5742:EE_|SG2PR03MB6684:EE_
x-ms-publictraffictype: Email
client-request-id: e5de864b-8ee0-4e77-9c58-8afab3c653f4
request-id: 7085ecac-ae15-4bd9-7309-08df4c1a52b0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|11063799006|4143699003|18002099003|22082099003|56012099006|10067099003|261022105027099003|261028144727099003|261026121527099003|261026140227099003;
x-microsoft-antispam-message-info: x4Mdhxs4F6UhRf0W9al6MMweYIF2zXyZ0N4DO3bic05/G/QRqJVdupcaIIdkAxqpzkxACh2fXmxuvZGx4QfVL1LeHrpFQCFXTkTV3rKw/UFDaRMfOtFsj+31QbTZTY0U6K/dqKNC+WMuWCYBtia3Bl1i0xVlejyrqRXgM80hLyh+nt0vm47+wqy91uS9WEd7XMt1OwQTYAb65kKDe+56gliNfWlpQh2F7QDjAShnOAb8k1EQmaFI/3RwZ+32yvqumb6rk/F3KgqERAFzMU1qSacvrWYjR1nnwVxSNthYVQQ0xa8KmNF+ufgIrQAuS0juF6CDUoKNAbPUFxUSpbpagaF3w9Z1qX4EbYm9m6NQ0jZQX6TCUHpRQv/7TKfpLji7N1Z/goHTmHQfC0/Xn1p5NsUxFz9RvA2X3izxK+uOwsroS7Fgwemk+8U8AJjy30TDB9YWW7YnMNQiS324yXcPswFID9Zv2uyacmrYbrQD81ZeN24xTDkCVpoqel7O0kKb2HBiqUp3usVnDO5AJf4+vYeTxyAlv4NOXkoybATyHnOLYlxvJjbjCaLJwN6F10ewQkxkRPVlQOR/ECD8clhoLFu5qi2y87AdyN5iJHkPOekhwvguEAVpNyTPTUwKNkWoqQE07R659OgVvmLzv5+S0qF0zmBNK/kfQueEE9ABXyg=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(11063799006)(4143699003)(18002099003)(22082099003)(56012099006)(10067099003)(261022105027099003)(261028144727099003)(261026121527099003)(261026140227099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VVdQVzFLZXhFQi96MWlkT0RVU0syRFNCMy95b09CeTlCWmhmTEI0REhpQXkr?=
 =?utf-8?B?OTdtTFJUQ1RuRjgwZEV4MElyL3UrcStodUE1L0gvWWFmbzh6dTFtS1l2eVJl?=
 =?utf-8?B?K1Y0enhBQ3dVcWVBSWJPb2Z3VVJUTndsTDMvMWphY3VmRUgyNTlIVS9sMkpF?=
 =?utf-8?B?VVo3c24zWTYxZ0hOb2cxTEQ1VGk2UllGV2YwMjc2REVseUMrVkJaOUdOOGQ2?=
 =?utf-8?B?NTlSVWFGL28wSGV5dmh0eTZwME00czlZSEpVZUUvYXNGZ3VNbERmTWFsMzEw?=
 =?utf-8?B?cEwxNkxFZjU4cng2NFJPUEZPRWtuNUNlQXB3VXB6b3R4cCtEbkRHS0s3a3Jj?=
 =?utf-8?B?bmlqeWJoY1hTbWpZV0lNc0NuWVVtSnZwLzl2bEtVUTljNzZubS8xUzRFTDls?=
 =?utf-8?B?QllzQSs3N09GdHpVTUVWNFNkdTIwSUw5V2NBNk1NUHZVOEkyYSs2QjhFVnhP?=
 =?utf-8?B?Y2R0NlNzbzQvTU9qaGd5dytRWGZzc0R6K2QyMzI1Z3haMGZmZkhFU0tOMFRo?=
 =?utf-8?B?eGhMR256MzNXR0VnT1dZRTFEZWpndnFsZkNKS0EyV1RiZnVUc0dRMXpMUldt?=
 =?utf-8?B?VjNsWEJtRTFML0hmRnNScjRqZzB3UXdIMmxaQWJNZks2L1NUU0VjM3VPQy9W?=
 =?utf-8?B?RThOUTNjWU1rQkNHbzF4ZlIraGRmTHk3QzdFVEgwRDJjRTI3RzkyY01LVytk?=
 =?utf-8?B?Z3NkSlluSmlHL3F4WXlVYnc4YlJxbUhOQUZZaEhHOGZneEhFaGZIdG5BekMx?=
 =?utf-8?B?bkJVL2ZkYTdVaWhNNEJyOExvRDNZaEVVR1RmVGFYQVZ0V2U5U01ZV1BuU0ph?=
 =?utf-8?B?OTFhc0lKait4QTY0VDhzazhyeHVCZlpnY3NvSlZXdDBzcXRWRWwwNEhHZW1Y?=
 =?utf-8?B?VFRxTVhQbHNSTmlmSE90Sk4xNkNFR1AzOG41bWVEbWZPMUUxYlVHN0h5M3ZW?=
 =?utf-8?B?QndGL2pKNGlzZ0NlWjN5bll2VE1Db2lXSzlzZ2k0RUJpRmVoKzUwOUQyWU5W?=
 =?utf-8?B?cXFJRGJOaXhJazgzOGFRUTlPRVM4UjdPVzdCWW5EL3dmS0NJRkJZQm9CaUdV?=
 =?utf-8?B?anVCdEZ1Z0kvb2p6KzhNTEJPL0ZmaStiM1dza2xXZFRQaUhxZGltL2lsZldh?=
 =?utf-8?B?TnFFemwrbFprQi9iTmoycnc1Z2tXYXUrU0Q1Z3I0NDBXdEw5YWFkVGl6UWNB?=
 =?utf-8?B?S0RBV3Y0SXdCRnBOMG1hd2J6dzJjT3Iza3ErRytHVVBzeHNzQ2J0K3JQNFMz?=
 =?utf-8?B?ZWM5RzVLcUl0TWRXbm5zZDhsT1AyOGdkREt4OFF1bDhkbi9lQkk1VnVLTkgy?=
 =?utf-8?B?K3ZDS2xYelE3Yzc0OUhjOU4yZnNjS25kc2V0aVdGbEkrYVJ4b2VTdkFPcDBj?=
 =?utf-8?B?RzBPbTZiaVBVWkVtZmduYTZFK2ZpSEV1amlDQXQ1Snk4L2QrSU1FTmV3ajhM?=
 =?utf-8?B?djNDZjh1TGNjU05GTEJIcUtEUHlhcGdFbmh3U1ZJWWpUUlIwS1lKTGE4b0Fr?=
 =?utf-8?B?SS9odlNMaDJKREdLS3oyaktpZHJQYXNKYzNnbTJXcUFZUStNeDd3NHRRakxv?=
 =?utf-8?B?Zy9mUWtOZ3JyVnA2VUN6a3NKVFBNeEFzT0NJZkRyRzVJV3I0YllqTmtlblhU?=
 =?utf-8?B?KzBWaXZYR0pYcnUwTEZyRXJjY0ZmMU1GdFpZZmtLQ2hkTi80U21zVVM4blpD?=
 =?utf-8?B?QjNYOUhnRkx2RFdHZ2lsNHR5aTIvbnJFeVNQZ0YrZFJUYXdxTERvMlhTTDZQ?=
 =?utf-8?B?UlB2cU8ydG0zQ2Y0MkZCOTRIdHlNSFJ0cEFJUlZaQU43T0NBVFRWaWQ3ckk5?=
 =?utf-8?B?WjYwTTRxVCt2S3MzZEVyNDNxekNBeVp0TmZLajYrYzArQjRUbll4ZFYwRHk1?=
 =?utf-8?B?TEhJUnl3MDhDWURZa0R5a2xhdWMwOXZuWFdORUMxbWZFUWxaTURmR2FLSjFi?=
 =?utf-8?B?WkgwZVZGYWNpY2l6MWpMbHBPendRRE1Qd3lVRFlDTlFKM1Q5VUpjbnRoNFFW?=
 =?utf-8?B?bFVLalhlcExnL2M0R1JwQk9lczM4RzBRVTBCZ1dtWmFKVHFRZ3lBQXZnK1dy?=
 =?utf-8?B?ZUJweUprelVOM0FkNjZIbnQ3T2xva0NtWGJ2U3pwMm16QVdIaTRUc1ZNYmlH?=
 =?utf-8?B?eWVKQjFudDZKeS9sRVhONTM0Z21oTHRDeE04SCtQQWxqRU9tYWd3MlRWQUNN?=
 =?utf-8?B?U004T1M4TUFTK2JERkl5NDNUSTdQSGJBWFVnSFZLbEViYW81Z2NnMzIwTzUw?=
 =?utf-8?B?amFCWkdzTUtPd042QVV0RTNrZmM3MGIvWEQ5SlZvNzkrb2pxN0pMQnNLRGND?=
 =?utf-8?B?Z1lUYnpxTjRoV2tBdXN6WUgwY25nd01POWNDUVZHUy9NYi9qWHBFWm4rc3ZH?=
 =?utf-8?Q?Jm2Im2FY4e87OhrQ=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A53733EABD96EC44AD871F8CDDFF0E18@apcprd03.prod.outlook.com>
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
X-Exchange-RoutingPolicyChecked: Tx7pco6SB3y/+A/8cBQA2DX57ZnDHhlq+cT5+equpVhFHWlkTn2CYsSAcQ81/xLpmQGCU/A77BC3vN7FapCTa9SokSapyTO9Xi6aPstsEtl5OsLMICKKyOFOv1gdZf+jf+hLV+WNN0LUwVcx4NNW0H2qC2SbE1HE01krgGPz23g6r/J1fMw+vZpjxB2iPDDV9V7Aim5pOc5vIWy8xjPtVbPSLFYp3hpPSeX9DtoZW6SG+E7/6Yek6TDUNGfN5Uk/y5J1l/1VrIbP6bSaBkKFBoiYJPKmNU/rCfM4V2VxRtI4U5Z4gqQKccuXiEjtazWrIhG5MgE6uARzSvL0M5Qm5Q==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB5742.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7085ecac-ae15-4bd9-7309-08df4c1a52b0
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Nov 2026 00:06:44.9835
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BxHNBXQ3zpImfKMWXGVW9Gf3zrb57l93oxLladW/RsOPyOsv28rRwAVLhr5ddAcOwvEgQjXj89tmZ2WedzJFM8bfKgmZetMgv79dG+lp0x0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR03MB6684
X-MTK: N

SGkgRmVsaXgsDQoNCigxKSBUaGUgY2hhbm5lbC1pZGxlIGNvdW50ZXIgaW4gRlcgd2FzIGluIHNs
b3QgdW5pdHMgKG9uZSBzbG90ID0gOSB1cyksDQpidXQgdGhlIGZpcm13YXJlIGFscmVhZHkgc2Nh
bGVzIGl0IHRvIG1pY3Jvc2Vjb25kcyBiZWZvcmUgcmVwb3J0aW5nIHRvDQpEcml2ZXIuwqANCldo
aWxlIHRoZSAnYnVzeScgdGltZSBzdGF0cyB3ZXJlIGFscmVhZHkgcHJvdmlkZWQgaW4gcmVhbCBt
aWNyby0NCnNlY29uZHMuDQoNClNvIHRoaXMgcGFydCBmb3IgJ2J1c3kgKyBpZGxlJyBzaG91bGQg
YmUgYWN0dWFsIHRpbWUuDQoNCigyKSBZZXMsIHlvdSBhcmUgcmlnaHQgYWJvdXQgdGhlIE1MTyBi
YW5kIDAgYW5kIGJhbmQgMSBpc3N1ZSBmb3IgdGhlDQpzY2FuIGRvbmUgcmVwb3J0IGZyb20gb3Vy
IEZXLiAgSSB3aWxsIGZpeCB0aGlzIHBhcnQgYW5kIGxldCB5b3Uga25vdw0KZm9yIG5ldyB1cGRh
dGVzIG9uY2Ugc3VibWl0dGVkIHRvIHVwc3RyZWFtIGFnYWluLg0KDQpUaGFua3MsDQpNaWNoYWVs
Lg0KDQoNCj4gSGksDQo+IEkndmUgdGVzdGVkIGEgcmViYXNlZCB2ZXJzaW9uIG9mIHRoaXMgcGF0
Y2ggd2l0aCBmaXJtd2FyZSAyMDI2MDgxMw0KPiBhbmQgDQo+IGZvdW5kIGEgZmV3IGRpc2NyZXBh
bmNpZXM6DQo+IA0KPiAtIHRoZSBpZGxlIGNvdW50ZXIgc2VlbXMgdG8gY291bnQgc2xvdHMgb2Yg
YWJvdXQgOCB1cywgbm90DQo+IG1pY3Jvc2Vjb25kcywgDQo+IHNvIGJ1c3kgKyBpZGxlIGdpdmVz
IGFib3V0IDEvOCBvZiByZWFsIHRpbWUuDQo+IC0gdGhlIGNvZGUgYWx3YXlzIHF1ZXJpZXMgYmFu
ZMKgMC4gV2l0aCBNTE8sIHRoZSBmaXJtd2FyZSBwdXRzIHRoZQ0KPiBzZWNvbmQgDQo+IGxpbmsg
b24gYmFuZCAxLCBzbyB0aGF0IGxpbmsncyBhaXJ0aW1lIGlzIG1pc3NlZC4NCj4gDQo+IFRoYW5r
cywNCj4gDQo+IC0gRmVsaXgNCg0K
