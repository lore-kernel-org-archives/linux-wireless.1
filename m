Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=198.175.65.13
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794403028;
	b=CUcPaUcXzOILgQDBWb67sPCyaYKsL2OCerKHh+PDGS9OlgF/ZqtmSQZhw70tXSEguQo0
	 UK/PkOPZvnVCOZv0fM6AK4Eb5ZollmZeIUtjSdTwssLpUPgEvgkXoTdBxOaEA6WuxWw8a
	 chAnzc/0lP0jE3SouAePeI6+yxx7Q+YfhrV2Ji+Bhru0s9ne/2k1dR9LApI6/e0zU41Un
	 /uMugHhA1qpbvWeoUnd8QH7uetlsT+1dmAIgKYegPEpFJCd1UEuGaH4VIZf1vgaE5n5co
	 m6vJQYJiaGuHfTjd4QSNyefqMPtPfbpoRensDHh5CY6O/hs0rrTL8uh+upj5H5Jxumg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794403028;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Received:
	 Received:Received:Received:From:To:CC:Subject:Thread-Topic:
	 Thread-Index:Date:Message-ID:References:In-Reply-To:Accept-Language:
	 Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:
	 x-ms-publictraffictype:x-ms-traffictypediagnostic:
	 x-ms-office365-filtering-correlation-id:x-ms-exchange-senderadcheck:
	 x-ms-exchange-antispam-relay:x-microsoft-antispam:
	 x-microsoft-antispam-message-info:x-forefront-antispam-report:
	 x-ms-exchange-antispam-messagedata-chunkcount:
	 x-ms-exchange-antispam-messagedata-0:Content-Type:
	 Content-Transfer-Encoding:MIME-Version:
	 X-Exchange-RoutingPolicyChecked:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-originalarrivaltime:
	 X-MS-Exchange-CrossTenant-fromentityheader:
	 X-MS-Exchange-CrossTenant-id:X-MS-Exchange-CrossTenant-mailboxtype:
	 X-MS-Exchange-CrossTenant-userprincipalname:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:X-OriginatorOrg;
	bh=BqKAQmLFZGIOlXOUtztYFbABWsBcYAoW4yDOpiy4YUI=;
	b=ODYSeMDdyUUDruX4YBRwqQkYPWSejHYDMt39qbdWtoI7FpYK1d/FxCA5+SsKVKEvVSbN
	 88/i9rptrQfnFwxCSR7/80P/s9pakW0Gg3ieMcPznu8Mf3/6sIGXOuYptMc2n66hglEn8
	 IVi0GIugdCvDMVlX+vqYq1dstm0UYFN+Wi5QScW6nDsxdmxdd6e/fotnlhA5MllbCvSmM
	 yjQYAWlDyKFuZz1jQVh/SoE+1C2qwoY5BUM58LSuVxNfHx8IcbRE3fwOIUatZxnmtlCBv
	 Zcn97heXmYJdqnXT79VGcPzsbUNCFnhdpf5cjXwbYIDrZtsB5KAWbTgWeZ2gsEkkR8w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="UjauMt/C";
	arc=pass header.oldest-pass=0 smtp.remote-ip=198.175.65.13
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47DAD606A31C
	for <linux-wireless@vger.kernel.org>; Wed, 11 Nov 2026 13:17:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 47DAD606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=UjauMt/C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794403027; x=1825939027;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=BqKAQmLFZGIOlXOUtztYFbABWsBcYAoW4yDOpiy4YUI=;
  b=UjauMt/CdKqAxZcHCGuQUigNu798dzK8FD4v3UISq5dVZ1gvKIk10Xsp
   7vlZM3vf9OR1HczQxIRWhpbuRBLdeQ9d0m3SAJSjfBU6KslcIhyEXV/Nz
   W6XwrYw1VGuQElmSGCPeqISI97/p6cm19DGCK4zaelR+ByGAvmYeSgvwc
   C3w/NjGMFQRwG5vEKzlTWt0y2MQY93H2W0twHpIjgNuP03jsYWrqGNJDo
   jSwqVjBuZ9kj+bYn0+AbR36SkAMnL+R2WOqOoYXKh54vjiqH1ltzm5jos
   UpfVxNhCfknq2v/tnB+StJZopWyd4f0UgE3mwcKd8BtD1B7+CkmdnERGo
   Q==;
X-CSE-ConnectionGUID: bvFw7db1SX+SQfVyk4LYCA==
X-CSE-MsgGUID: wupYD3SPT/q1+XaQSU73yA==
X-IronPort-AV: E=McAfee;i="6800,10657,11963"; a="3055202"
X-IronPort-AV: E=Sophos;i="6.27,207,1787036400"; 
   d="scan'208";a="3055202"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2026 05:16:56 -0800
X-CSE-ConnectionGUID: IzZjsnR9SY2e7F3vdxfdhw==
X-CSE-MsgGUID: txgQnfteSaKnMeJUrkmGVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,207,1787036400"; 
   d="scan'208";a="8415339"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2026 05:16:56 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 11 Nov 2026 05:16:53 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Wed, 11 Nov 2026 05:16:53 -0800
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.32) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 11 Nov 2026 05:16:52 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ga05Hd5DmP5UeGQ6mtTPkEsj6vR2K9mcjKYXuQnTNZZvYm0xDBbQ1Q5taK4nLRtL+Zs4L2MKr6AOmeddeBKy30VXxOpWj3GydFL9QwlL6OfIYTWbBe1672dAF0keRj/z9vFmP7aiK2pQSwEeLugGX03mFhfSecaoLct4RMLuM3yPjdlutZ/LC3dtbKF2VMQNT9wiqCHzrOBAg6nng4g1Xp8u6ZXnsSRKBirl0QonjbgJPGLLcr3h3Na+GQ3IJ7SIOVDvbeRMPxQwgTM6XkwIkNSjBlqL9p0e1ehgUEK+fGy4Ohv9UEYU1W79C29LzSGQDetCxfe/wh++soJV5GaVwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BqKAQmLFZGIOlXOUtztYFbABWsBcYAoW4yDOpiy4YUI=;
 b=f3M5HJJigH9nZszyBPoZXBTlWKiT79LNWHgkYzQsmTKDb8BCK1HHg0w1wdamyzY8jboMdv2MKr9BN0s5vTMJrmI6ISPtnQuP5s1QLjLVdZvJ2Jj9pN/luYJzYY9Ye8Hr0WCxZQde0qWD6Rv2+iDGILwWb16kGQokl08cdNSMe+VQwmvBlNS5moDuSPMLVB3gLU/gmPq7IkaJpZE9aUS/0Lhnf0mlim25mGurGxECauxnMzGzX6cp1SPvTudbEW5yxV9E8jduWcMcPUlYzZVAuNLPgE3V/MRtyhMImZ3yfc8Wr0Xnj8V6nm95T7SfCj7D/NPbA2+OF1ufr5Wgjlc2qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6252.namprd11.prod.outlook.com (2603:10b6:a03:457::21)
 by IA1PR11MB7344.namprd11.prod.outlook.com (2603:10b6:208:423::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Wed, 11 Nov
 2026 13:16:50 +0000
Received: from SJ1PR11MB6252.namprd11.prod.outlook.com
 ([fe80::7d3e:3000:9690:1570]) by SJ1PR11MB6252.namprd11.prod.outlook.com
 ([fe80::7d3e:3000:9690:1570%6]) with mapi id 15.21.0615.007; Wed, 11 Nov 2026
 13:16:50 +0000
From: "Otcheretianski, Andrei" <andrei.otcheretianski@intel.com>
To: Shivani Baranwal <shivani.baranwal@oss.qualcomm.com>,
	"johannes@sipsolutions.net" <johannes@sipsolutions.net>
CC: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
	"kavita.kavita@oss.qualcomm.com" <kavita.kavita@oss.qualcomm.com>,
	"vamsin@qti.qualcomm.com" <vamsin@qti.qualcomm.com>
Subject: RE: [PATCH wireless-next v2 10/19] wifi: nl80211/cfg80211: add
 support for NDP initiation in offload mode
Thread-Topic: [PATCH wireless-next v2 10/19] wifi: nl80211/cfg80211: add
 support for NDP initiation in offload mode
Thread-Index: AQHdcNOHJgDuv6P2P0+nzIDNCfAtV7coy6Sg
Date: Wed, 11 Nov 2026 13:16:50 +0000
Message-ID: <SJ1PR11MB6252EEB132E331DB033C793BF5712@SJ1PR11MB6252.namprd11.prod.outlook.com>
References: <20261110043242.2012238-1-shivani.baranwal@oss.qualcomm.com>
 <20261110043242.2012238-11-shivani.baranwal@oss.qualcomm.com>
In-Reply-To: <20261110043242.2012238-11-shivani.baranwal@oss.qualcomm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6252:EE_|IA1PR11MB7344:EE_
x-ms-office365-filtering-correlation-id: a7946466-9631-4974-fbcb-08df3ff60c17
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|23010399003|1800799024|366016|376014|18002099003|22082099003|3023799007|38070700021|56012099006|4143699003|261028144727099003|261026140227099003|261026121527099003|261022105027099003|261022075727099003|11063799006|261009223027099003|261022113327099003|10067099003;
x-microsoft-antispam-message-info: FvBVa/w6Q/5eOXhZynaJkQPkiScjevkpfdPx3jswAzLzxDb41x8of4Ormv+3WU4WWVp5PvgkvmrfHyb9OpxqJln7G48JMXOcUJ5q8GeuKxuxYpQVvHszzomN3y3eSeb5y0ld1MwWuBgK7ofSMIyl02J4jCpcvh0/HbNTr3cMsIg1QxRDf0lO8FRstE37tRRknq+SQ0T0JqVBlEdl7EBwUSKTALqLlqC/0mGiw/15Ba1wrQs0/0CQXz4PlBlWW4K/LmcIhEdaCRO9F0LkHpH3xxur5olDg2Lo4h+Dc/Jf29IdpBYyoybyHJIvxKmiILiTyAk8oMQyBCOlLl/tNY+xWU8TSbbVcoU1PiE9YTxKPOadANV+fmoe+DixVPrU56xv6YH2Q/GR0f9JSSTwfjIu3abn8W+7mJlDQrwz8fyixN4GFFr2oNv4diWGAfBJWgnyqqe1JVCq/mAXHJH5H76RY5VnooUGaCUHRVnTgpjooNbYSfE+NhE0u77TMmw/Vjar7JvItI873ZzfLgp4N03e/xUFt6UTL1cxbXALOjBmzM7Ci+Lizz8w6lKagJOx+xt1bwkeuMW633xbRttDa92IepEkt5tm5LoNp9WB0dUlb1ASwxrJ9nbEQ476mGtbSG0Blr4nef9PdoAF+RvAxYUFVx876fljpq0EyHajM6IvvkSkaPXofX5JXZ/xnO4alm82jKvPrJ++4KdFEORyFg8soVyjL/3nkRi+QirRPAZM9OA=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ1PR11MB6252.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(18002099003)(22082099003)(3023799007)(38070700021)(56012099006)(4143699003)(261028144727099003)(261026140227099003)(261026121527099003)(261022105027099003)(261022075727099003)(11063799006)(261009223027099003)(261022113327099003)(10067099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UksvcUtIemlteXZRTXBTOUt2QkQ4SUZQYThoQzRLM245Qzk5KzU2VjdhQ2pL?=
 =?utf-8?B?RHowK08rV0xVUU82USs2MXRRNXp3dG9vb05MY3VTUEhqNWdwcWRaWTdOWFM3?=
 =?utf-8?B?NDdCd2NIai9xayszaDUvemxrRyt4eFR4cmJDTFlVSkxJbEFkL2dDQ2JJdjM0?=
 =?utf-8?B?TG0zYVVhL0g5Q01YbDJic2FoWlc1dTc5SzJMREI2Yk13b3F1ZWxHcVRqaXZZ?=
 =?utf-8?B?azVnVmZ4dmdxS0VXR2tyVnJEL1J3SVFuY05Mc1gyTjFvbVVHOUw5TlNxV3ZI?=
 =?utf-8?B?NTV6WUZwVXUwR09wRmM0bEhMYThJaHNJK0s1UHRJYWRtaC9QRm53SkF5ZERh?=
 =?utf-8?B?bVc5bG9mUVZzS0pEM2dnWFVpM0pTb3dhL3NJRGVzNDdQYTNBUEZSdjN2TGhz?=
 =?utf-8?B?REJnL3NLWjFDeTIwaXdBNE4xYkRZZkZzb0J4UEZ1ckpwVlROdVQwdFBleHlh?=
 =?utf-8?B?Zm5Pd1k4OC84YytKWERCUjZVV3N3dDRCSWlEYzJ4K2ZZQnhhUzZTcVU3VVRD?=
 =?utf-8?B?aUdvK1BxZ011QUltS0NoNlFNNjBhWC9qd213U1RGVkZnV0o1Y0NqNGZxL2E1?=
 =?utf-8?B?aDdGQXJJazhVNFJveENKYzE1UDB5cGlNdjRnVWpMUkdzWUNQVWZZUjVJTC9T?=
 =?utf-8?B?Q25QRFdBcFF3UG84MEZxeFFmbFY2Vm5ESEZocDF2SzBIOTBiQWIxWVdDZmlL?=
 =?utf-8?B?NGttZldHMmIyRFUxb1FEMEVaUUFWSHhKSmpjM1MyQThuV2pPcmgxa2NHNUF0?=
 =?utf-8?B?TTZMT1YvUjJsclE1NEZWbU4rYVd2MC9ncWU4ckNwL3JWNThCUTBjTEdZREZW?=
 =?utf-8?B?TnZQWktVM3VnTEM3Rm1NMzNLUllORnRGR0lSSWtLVXF0QnRWR0VFNnVJTHhr?=
 =?utf-8?B?aHVFTWJJTkx2ZlJaOHBhMkJaazVoNVJRVTV4MElPSk5ELyt5UWRDcXAzK0dN?=
 =?utf-8?B?dS9pMWxCUCtNQThKWU01dFBpUzZEL2laR3NwTjE0a2Ird2V1bnhLaTlsQmZW?=
 =?utf-8?B?SjB0VDJrMjdvSDlRNjJaUGpyR0hYRklzL09ZUU41eGNpZmdhRnVGbytFbTY2?=
 =?utf-8?B?Y3h2d3RkSTRhaDBSdENua2pDSW5ieGx1MndjejQwaW1BVjVNMUd0V3RESjlH?=
 =?utf-8?B?K25WMWZLTXdkK1FxZmh5ajZrU0dTbVJ1Rm95QmZabWE1YzFQNmZtL2lCMWNv?=
 =?utf-8?B?LzBZT01MbkVUbEQ3VHcwUVBjMkdPa2dQaHhxNjRoK0x3YTNrY1VtVU9mb1NF?=
 =?utf-8?B?dW5SUEM5RzhaK2RyUGdjQ0ZEenhYVHcvakFwSi91QlgxZlVZVEdQWUJic09S?=
 =?utf-8?B?SE5MRUN3aWxVZG5nS1hXbkhZbmN0R251bjdqYi9FZWlyakM5K01KRzJYelM3?=
 =?utf-8?B?OC9wTS8xOUVpcU9VaTVkSmJGVzdnZzBMR2FISTJUckMvWmFUZVRnTUhkWWdD?=
 =?utf-8?B?cW5QbXFROWhBVkZ4dTUwRmwwOVFGNjVPTVc5T2JsZ0FWRTBuZVU5dENpemVW?=
 =?utf-8?B?YTNHakFMRXhuQVc0MFZsUVppeWZnVWVZdU44Uzd1VGVSc2Y2eXRFUlRYMUdI?=
 =?utf-8?B?Q0NiZ3M4RnFNb0IwdjRhWVhnV1N3UnpsbjI4bG9vSnJsaHhpUlloaitTNllU?=
 =?utf-8?B?K1huNXZKK1QxT2ZuVjlnK1BIN1FUQmJ0YWtJNUJUSWUvbFh6SGdrOHhGd1hN?=
 =?utf-8?B?LzNIL0w1VGg4aGxJekJkOUJhZUJKTG5XTWc3OWhLeElLSENVL0c0MlNuRENz?=
 =?utf-8?B?OWswcWE5WWFhMHMwUkI5MlBkS1VSMG5QN1dEQVNBTnUzYWV5di9aeU9DZS8v?=
 =?utf-8?B?UXR2KzNPS3R1ZFBOZFhCbERwYU91MGNjTFRpUEtoVS9NaHZTbmZrNEg0bGpY?=
 =?utf-8?B?YzdQTmVqODU1aE04NEhZSmdiTnEyamU5ZFpobmozRmpuMDFubFcremNkL3RR?=
 =?utf-8?B?b1BkdUt5T3dLUkxDR25lZm1Md0pMVnVBdk9HWDdzakdYbkY3dWtpeldUMUZx?=
 =?utf-8?B?TGhaMVozZlNWUklMeUpwQTRnTTc3WkVBdWluSG9PNU9RN2ltc1FnR1BmYlh4?=
 =?utf-8?B?blM0eXNLK0Ivc0pVZ285amVnVEppUng3eHdadU9aUmdURDhoTXl2dXlLOTNj?=
 =?utf-8?B?c1RkbVZkNUxYS3VhckZiNGhScHdGZUhURDgvY1ZOUEtYUnZnTEpCUW5xYVRu?=
 =?utf-8?B?YjdxSVRYVm8xYkVaNVpTUkpCc0lQMVRhRmpIUDRZeVdTS2wycjV3THBzSUdV?=
 =?utf-8?B?MGdCMktGcC9Kb2pZMWtyVmtTcVRwRW5JNlZsQ0k3bTU1Zmp2YWVXSFpQRjdz?=
 =?utf-8?B?THhBYkl6Tm4wWklxS01JVFhlcFdySHFBMUR5OXArbTMzYlhkMDBOWCs3R3FI?=
 =?utf-8?Q?nP0BFT10pE2QiliQ=3D?=
Content-Type: text/plain; charset="utf-8"
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
X-Exchange-RoutingPolicyChecked: yvk2UcMqWbuTRqIZoe2aNpLP4qTUtBu+NgX7f+B7xXU9DnQDhQsFZNtVcyMpH4uzDeNba/x3UhbfL7Xab1asSLXv2Zid5zZJyrWNv2K5jVX9L1P7ybZq9XKFJ3d2b+XHJffK4F3osbNbNc8rPhcdlQX/wUaJEmxl1lHn48OLyStli6qqokosuWdTI8DpXcGdTU7gBA7TyGLEdv6carX+oXu1ACDH9Udmz9Q2BLA4oYn1C/FgzsqzGep3cnwnBxFusKX2NxgyExnLE7d5hTMf0NZENEB1aE+D2EyEgruLioPztqcjGDRjY6EUMc1itrHqWUxzpNcwSduTQeqFPRV5cw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6252.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a7946466-9631-4974-fbcb-08df3ff60c17
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Nov 2026 13:16:50.7139
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7QBcCm8bnp3G3yS613zbRJ/Eq3Eqdg5pLsN8h4Ao+5ca4B/ayYft8CZgVwqBvcAiqqFKEwu7G9ChoeAVPUuPA5P4e0msfrJIgd4HqAWpXPc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7344
X-OriginatorOrg: intel.com

PiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS91YXBpL2xpbnV4L25sODAyMTEuaCBiL2luY2x1ZGUvdWFw
aS9saW51eC9ubDgwMjExLmgNCj4gaW5kZXggMzQwNmUzN2RmNWM0Li5kNmI2MDE1NTYyNDggMTAw
NjQ0DQo+IC0tLSBhL2luY2x1ZGUvdWFwaS9saW51eC9ubDgwMjExLmgNCj4gKysrIGIvaW5jbHVk
ZS91YXBpL2xpbnV4L25sODAyMTEuaA0KPiArZW51bSBubDgwMjExX25hbl9uZHBfYXR0cmlidXRl
cyB7DQo+ICsJX19OTDgwMjExX05BTl9ORFBfQVRUUl9JTlZBTElELA0KPiArDQo+ICsJTkw4MDIx
MV9OQU5fTkRQX0FUVFJfSUQsDQo+ICsJTkw4MDIxMV9OQU5fTkRQX0FUVFJfUFVCTElTSF9JRCwN
Cj4gKwlOTDgwMjExX05BTl9ORFBfQVRUUl9TRVJWSUNFX0lELA0KPiArCU5MODAyMTFfTkFOX05E
UF9BVFRSX0lOSVRfTkRJLA0KPiArCU5MODAyMTFfTkFOX05EUF9BVFRSX1JFU1BfTkRJLA0KPiAr
CU5MODAyMTFfTkFOX05EUF9BVFRSX1NTSSwNCj4gKwlOTDgwMjExX05BTl9ORFBfQVRUUl9DSVBI
RVJfU1VJVEUsDQo+ICsJTkw4MDIxMV9OQU5fTkRQX0FUVFJfUE1LLA0KPiArCU5MODAyMTFfTkFO
X05EUF9BVFRSX1BNS0lELA0KPiArCU5MODAyMTFfTkFOX05EUF9BVFRSX0dUS19SRVFVSVJFRCwN
Cj4gKwlOTDgwMjExX05BTl9ORFBfQVRUUl9HVEtfQ0lQSEVSLA0KPiArCU5MODAyMTFfTkFOX05E
UF9BVFRSX0lQVjZfSU5URl9JRCwNCj4gKwlOTDgwMjExX05BTl9ORFBfQVRUUl9UUkFOU1BPUlRf
UE9SVCwNCj4gKwlOTDgwMjExX05BTl9ORFBfQVRUUl9UUkFOU1BPUlRfUFJPVE9DT0wsDQoNCk1h
eWJlIGNvbnNpZGVyIGhhdmluZyBoZXJlIHNvbWUgYWRkaXRpb25hbCBhdHRyaWJ1dGUgdG8gZGVz
Y3JpYmUgTkRQIFFvUyByZXF1aXJlbWVudHMuDQpTdXBwbGljYW50J3MgQVBJIHVzZXMgc2xvdHMv
bGF0ZW5jeSBpbiB3cGFzX25hbl9uZHBfcmVxdWVzdCgpLg0KVGhlIHNwZWMgZGVmaW5lcyBhIG1v
cmUgY29tcGxleCBxb3NfcmVxdWlyZW1lbnRzIGluIDYuMS4xLjEuDQpJbiBhbnkgY2FzZSwgdGhl
cmUgc2hvdWxkIGJlIHNvbWUgd2F5IHRvIHRlbGwgdGhlIGRldmljZSBob3cgdGhlIHNjaGVkdWxl
IHNob3VsZCBiZSBhbGxvY2F0ZWQuDQoNCj4gKwlOTDgwMjExX05BTl9ORFBfQVRUUl9DSEFOTkVM
X0ZSRVEsDQo+ICsJTkw4MDIxMV9OQU5fTkRQX0FUVFJfQ0hBTk5FTF9GT1JDRUQsDQoNClRoaXMg
aXMgc29tZXdoYXQgbGltaXRlZCBhbmQgdW5jbGVhci4gVXN1YWxseSwgTkRMIHNjaGVkdWxlIGNv
bnRhaW5zIG11bHRpcGxlIGNoYW5uZWxzLg0KQWxzbywgdGhlIGVzdGFibGlzaGVkIE5ETCBzY2hl
ZHVsZSBpc24ndCByZXBvcnRlZCB0byB0aGUgdXNlciBzcGFjZSwgc28gaW4gc3Vic2VxdWVudCBO
RFBzIGl0IGNhbid0IHJldXNlIHByZXZpb3VzIGNoYW5uZWxzLg0KTm90ZSB0aGF0IHRoaXMgQVBJ
IGlzIHBlciBORFAgLSB3aGljaCBtYXkgcmV1c2UgYW5kIGFscmVhZHkgZXhpc3RpbmcgTkRMLg0K
SWYgeW91IHdhbnQgdG8gaGF2ZSBhIHNjaGVkdWxlIGhpbnQgZm9yIGEgZGV2aWNlIEkgd291bGQg
Y29uc2lkZXIgcmV1c2luZyB0aGUgc2FtZSBzY2hlZHVsZSBkZWZpbml0aW9ucyB0aGF0IHdlIHVz
ZSBpbiBOTDgwMjExX0NNRF9OQU5fU0VUX0xPQ0FMX1NDSEVELCBidXQgaW4gc3VjaCBjYXNlIHlv
dSB3b3VsZCBhbHNvIG5lZWQgdG8gcmVwb3J0IHRoZSByZXN1bHRpbmcgc2NoZWR1bGUgYmFjayB0
byB1c2VyIHNwYWNlLg0KVGhpcyBiZWNvbWVzIHF1aXRlIGNvbXBsaWNhdGVkIG5vdyDwn5iKDQpT
byBib3R0b20gbGluZSwgaXQncyBub3QgY2xlYXIgd2hhdCBpcyB0aGUgZXhwZWN0ZWQgZGV2aWNl
IGJlaGF2aW9yIGhlcmUgLSBpdCBjb3VsZCBmb3IgZXhhbXBsZSBzZWxlY3QgYSBzaW5nbGUgc2xv
dCBvbiBzb21lIGNoYW5uZWwgb25seSB0byBzYXRpc2Z5IHRoaXMgZm9yY2VkIGZsYWcuDQpJIHdv
dWxkIGNvbnNpZGVyIGRyb3BwaW5nIHRoaXMsIGFzIGRlZmluaW5nIHN1Y2ggImhpbnRzIiAvICJw
cmVmZXJlbmNlcyIgaW4gYSBnZW5lcmljIHdheSBpcyBjaGFsbGVuZ2luZy4NCg0KPiAtLS0gYS9u
ZXQvd2lyZWxlc3Mvbmw4MDIxMS5jDQo+ICsrKyBiL25ldC93aXJlbGVzcy9ubDgwMjExLmMNCj4g
KwllcnIgPSByZGV2X25hbl9uZHBfaW5pdGlhdGUocmRldiwgd2RldiwgJnBhcmFtcyk7DQo+ICsJ
aWYgKGVycikgew0KPiArCQlubG1zZ19mcmVlKG1zZyk7DQo+ICsJCXJldHVybiBlcnI7DQo+ICsJ
fQ0KPiArDQo+ICsJaWYgKFdBUk5fT05fT05DRSghcGFyYW1zLm5kcF9pZCkpIHsNCj4gKwkJbmxt
c2dfZnJlZShtc2cpOw0KPiArCQlyZXR1cm4gLUVJTlZBTDsNCj4gKwl9DQo+ICsNCj4gKwluZHBf
YXR0ciA9IG5sYV9uZXN0X3N0YXJ0X25vZmxhZyhtc2csIE5MODAyMTFfQVRUUl9OQU5fTkRQKTsN
Cj4gKwlpZiAoIW5kcF9hdHRyIHx8DQo+ICsJICAgIG5sYV9wdXRfdTgobXNnLCBOTDgwMjExX05B
Tl9ORFBfQVRUUl9JRCwgcGFyYW1zLm5kcF9pZCkpDQo+ICsJCWdvdG8gbmxhX3B1dF9mYWlsdXJl
Ow0KPiArDQoNCklmICByZGV2X25hbl9uZHBfaW5pdGlhdGUoKSBzdWNjZWVkcyBidXQgdGhlcmUn
cyBhIGZhaWx1cmUgbGF0ZXIsIHRoZSBkcml2ZXIgZG9lc24ndCBrbm93IGFib3V0IGl0IGFuZCB3
aWxsIG5vdCBhYm9ydCBORFAgZXN0YWJsaXNobWVudC4NClVzZXIgc3BhY2UgaW4gdGhpcyBjYXNl
IHRoaW5rcyB0aGF0IHRoZSBjb21tYW5kIGlzIGZhaWxlZCBhbmQgd29uJ3QgYmUgYWJsZSB0byB0
ZXJtaW5hdGUgdGhlIE5EUCBuZWl0aGVyLg0KDQpBbmRyZWkNCiANCg0K
