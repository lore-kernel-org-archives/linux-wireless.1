Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.70.59
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795502947;
	b=REBnFFU0TX94obyzScz2DOMtYxa9XF/8K7YgMK07M7Z+VVyjTbrNvUk0wQ0L515i//K5
	 tchGToEUALzsjzPPVTOkxWdnEr6my2wbf6cudkoXk9yVZkhTFJgG47p6tLGaW77PFRqx5
	 ygeY6Ijym1jXHNXyozRtx1E7bPuvssej40aOZxqWFoN/nmUFy0Q5fuaVRU9ZtsH1fVcyj
	 gvk7XNIGDhMQgHU+mDSQdrdtvxritaFACYD8etPSKbY3EVePAg+pXdeS3RuTn2/OOMs+h
	 4SUu6V69tKI1FVusesRV8/8fC873VbV9jd0FvW2Vr0quEjaGlkarnFfZ9qUdZ1vEa8w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795502947;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:Content-Type:
	 Content-Disposition:X-Mutt-References:X-Mutt-Fcc:Status:Lines:
	 Content-Transfer-Encoding:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=SfZsto7L6LS5jKWj6y0KFRXcbhH/g9lvPH1NcwFT5gA=;
	b=LYj+INim3aqCLAGmO8LnpWNHMsd0a47NlRBu4j/W04kEyEANGCom/kNa6bwIfgfqg+Gl
	 S+W3X0gTca/pJWZxyFbekZSo16QO5ZLNl7tRaspFl0Ugkno4GYfkSpmwK2QTHG7q2SxNA
	 VOHsWNFNqRmrZ1eZWRdC6AMx5A+6bDMqGV+AKS4pRKddKHdZiwEFiRo5ea2GmtPNafqnt
	 4KI5mWYnFPEZzHo7oL27bXu4EPcerPDYhxcg4cU0sGyJ2FA2SWiC96FvurP4qOkhzHkqD
	 YepC4DulcZrcKymalLrWknxIKurn65CdJ/1o8/4oYT1geIT4utkjz9eYUl1BJIBKU5Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=vpERGVpc;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.70.59
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011059.outbound.protection.outlook.com [52.101.70.59])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64A2D606A31E
	for <linux-wireless@vger.kernel.org>; Tue, 24 Nov 2026 06:49:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 64A2D606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=vpERGVpc
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ohKJhfpcQbGE8K+U510nH2oDrJpg7NFsznRVFchjpM5ThJ5a+YknKzJTPwNwYFjw2/3gIlARXJHGqE76gF5diowfz5FBaF9obeBViJnRRI4ZoA9RG3jpJ4VhjQQt59Tl3g14brvDNHsYiFKVn8oyI2z4rFLNEr6Jj4wMUqhMromAr0qRAH8hg25llBmrPDnZvIcFuhwFbDDj4Luv2mv0O38TiVyCnXv4DFvk0wXpRQIllcwYNJW3FUesaTgaWezlVAtOErcsJOAe41bWYDt5W3AwQY09PaeyLF7bh7tzXqzVmiXWl8CTG9srW70smyZsV1VFe90X+x6elY1sH6Rt8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SfZsto7L6LS5jKWj6y0KFRXcbhH/g9lvPH1NcwFT5gA=;
 b=e4XgkpfUO1LPGRW5MI4T4Ofe8WFEzvKXsINOT+DH30IaEF3HwX5yecQ3B/O9H2/uTp9YvoH1rj0ADfwUGisE0325YjgmUqKQAtcZQIa6Ytq0pvTHyC6+oD2fUgOYdM9pMtjgDgdldZG9XUVmng11E0ag9dC1TfkVgs3Q0ZEVvdE09o6Nfj8yx84NR/7K1OXnISfehGrFR1h7p30XwYoiA9f0KRlzUXju5RG+IRCJSz5m7GeIn0ANZ8E4XWOe+zHCseaNqdjisyRiJz4cyz2ijZgmo/rtnQo1NHT9a3Q4HithSPuY5LGmtdfXYzjtGpm92H9LhflR3t6ZpzZhR0LYkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SfZsto7L6LS5jKWj6y0KFRXcbhH/g9lvPH1NcwFT5gA=;
 b=vpERGVpceXOYIgpJf9AeWGcEqHPRWXf4iyMV+0AwH8866zBP29FQ+mrKEUeax4h73gMYrFoWonrWvHeKwxGlkFVwGSNndeeouq7hQ1QOIrwHLk96eWBBWYyAol7EBieST8uqWysHWpIZ/sSnK7jXngE+yXa5F/HJjoRfVVJ5J++UDyD8rJB4z0y3XP8+GQRaZKMvmcgDoVf+McRhIoV/VpzNZUQuOpGPdW/pFppkmkbPS0zE1elGFu4AQBJ1VkW1sNNpmb7aj/mtot8Io5GtFPhNVgADaEJ49UJFOq/lD451iI4T11XRw2ZKJWDfmVufYSRl1AmyYA15xsazrPZm0w==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from VE1PR04MB7280.eurprd04.prod.outlook.com (2603:10a6:800:1af::22)
 by AS8PR04MB8754.eurprd04.prod.outlook.com (2603:10a6:20b:42d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.14; Tue, 24 Nov
 2026 06:49:04 +0000
Received: from VE1PR04MB7280.eurprd04.prod.outlook.com
 ([fe80::92fd:f75a:a302:f859]) by VE1PR04MB7280.eurprd04.prod.outlook.com
 ([fe80::92fd:f75a:a302:f859%4]) with mapi id 15.21.0639.012; Tue, 24 Nov 2026
 06:49:04 +0000
From: jeff.chen_1@oss.nxp.com
To: Tristan Madani <tristmd@gmail.com>
Cc: Jeff Chen <jeff.chen_1@oss.nxp.com>,
	Brian Norris <briannorris@chromium.org>,
	Francesco Dolcini <francesco@dolcini.it>,
	linux-wireless@vger.kernel.org,
	Tristan Madani <tristan@talencesecurity.com>,
	Jeff Chen <jeff.chen_1@nxp.com>
Subject: Re: [PATCH wireless 1/3] wifi: mwifiex: validate TID in ADDBA response handler
Date: Tue, 24 Nov 2026 14:48:10 +0800
Message-Id: <20261124064810.802854-1-jeff.chen_1@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261101205802.2909524-2-tristmd@gmail.com>
References: <20261101205802.2909524-1-tristmd@gmail.com> <20261101205802.2909524-2-tristmd@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mutt-References: <20261101205802.2909524-2-tristmd@gmail.com>
X-Mutt-Fcc: ~/sent
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS4P195CA0040.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:20b:65a::28) To VE1PR04MB7280.eurprd04.prod.outlook.com
 (2603:10a6:800:1af::22)
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB7280:EE_|AS8PR04MB8754:EE_
X-MS-Office365-Filtering-Correlation-Id: 91a53893-cc6a-4c74-c2ad-08df49f707ae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|19092799006|1800799024|376014|18002099003|22082099003|261102123227099003|4143699003|10067099003|11063799006|56012099006|261021121427099003;
X-Microsoft-Antispam-Message-Info:
	NzBVSvqGrQOtz9q7H+oQEQU3QIgDRPUtzkJLTEXuEAvD4LisSLcl/X7g+2YbWqqIB6+92PfZSQD6O75ewz0h2dxh59VSnopt1NFTTspFG1frIXOoSmI3pJB0Ue0IOrtjmW0IdOJr1E5HV7vO4EfdDI5bCy1jsDtIzYC2zl00eJmk32NAEkU+0KnjVebGGgRg0a+MunrSpkUinYTDBCbIUwMDZrgCahOy/VtWiMrA+J20hfSo4EN8z0fsrLJq7px765KlznIKbsWgjigPue2mJ0fabtKwtXgR9DoxpGDp33vNMb3quikNLzJvs2PXZRd2kvEfnhGReqGtcSKcn1IryGxtuXqu0MMc4lh46/E7JkfwuyuQIQSH3MUM+gCqL+InIVuBSa/askgw/FKonmJNsU8kkyXl0+AAD1jFcYbuMpcB/xWqyTeVb0xEtJWtrt9HVB2d7exgwycwfInbtX4W6ID4c+s2GVuJyzbVf2zxdkrZyAMBLcHrig2R48XptAVZNwAlYiv6XI3fEuEUJQgnzI64M2kvHVkqH+nQ5A4gKfWwNG/SHg/IXCRUf3ucqqhRJ4mQds6QlKt02ZjhItcfAiqsJuHxyhn2KzR3bSEYacnr7N0vGDXyiH7ywvGGTK01RCSXxiV4wFUCLeJKJjHekSCTSIEImO39qmZ+S1gNFcE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB7280.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(19092799006)(1800799024)(376014)(18002099003)(22082099003)(261102123227099003)(4143699003)(10067099003)(11063799006)(56012099006)(261021121427099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?MIiLNIywlbsHs4GsKDKH7klrPfmsX8n9utRcyRlv1fCJ2M/+MzT1fDure2av?=
 =?us-ascii?Q?KWxHN+2usQ1+f2Ku64mkInOB/lI4VOHFKVJzUaos7dP0ux1xuqoBhpet/l8O?=
 =?us-ascii?Q?cDwwyzlttAHenq9DORNDOuLdd/tPl8j77hHLyyo89ogN8fMopc6iVldu0iJM?=
 =?us-ascii?Q?aprnJQar+rKZzJbecXVitVsUnULv6jXgLFdy4bgmTwHyIl42x1TM/olfh2zF?=
 =?us-ascii?Q?WqiaBYFLw69L/5vFjhnPJ7c58grJ+rWI2z8mJGqGHusLljbIsD9O3G57mgYR?=
 =?us-ascii?Q?NgPx/Y0+7WWbbfBSqp/IO9yJ3SfKOkUTeosmalJ/JB1O99M5zlqz/tG4IhRl?=
 =?us-ascii?Q?m/MAqvbRcpw0DlZ2+jToAzzId/hM6sD2CMjiu8RIqu/2G/XLm77ruXh4MSF7?=
 =?us-ascii?Q?9XL19gybcFQGCkZUZS418P8QTuCx2JyktSfVxn+kFV0ZktK6mW7qa3pZ723S?=
 =?us-ascii?Q?HllT+b5fnisWbPQT5z1R2f6U1VpzAzXRGccGLGel0H6ePMshlAtiqEuNxspD?=
 =?us-ascii?Q?AGbwSbX9glsxx/ONSgz3hMCpO2UYSg6Hl0AjY+4e5ldEAeWBISvkeTOUna+d?=
 =?us-ascii?Q?378wOEpGwgc2ujMjF2/uq5RKWr6kHJLVNF28pyL1d4pn7cQp5wQ46cs+o6OT?=
 =?us-ascii?Q?JNOHIo1Av9u8Nxo3gho5rUu7GDcWW9cQOFBFeAfaZTTmnf1ctNPNMuVAp3A7?=
 =?us-ascii?Q?FUuLyNQq68UUUXOop/1Om3ZmdmRukHhsry3otI6/oVRfaT15H62D4pMK5byu?=
 =?us-ascii?Q?Wvaibv2CAH7LrR4p25DCmmI82TJu5Edj8emujU3HSkSd6Z5811jQVUT63tTP?=
 =?us-ascii?Q?wjtOcv0aJeuqLK1nwPKaeKDJErd6urdS5PCHzNZ9yEIoHunslU/Wsd/1Uk5b?=
 =?us-ascii?Q?A7m4D+R7DQ7P6wzd0OBnYZlwWvEJ/4hDSG5Q+6p9x3VfqGb+AicAVjbuTtDR?=
 =?us-ascii?Q?1ouBZa4GcAKZsFSPRjMp0aKD+2/r3RShkHTevrsSSVcy6z7IG3rQkWPOT9BC?=
 =?us-ascii?Q?Lp0A4US/bBy9Mn7fo+v47bEscQYRTw5EJzLI4VErR/mqWqy1JemIhrfVvn6D?=
 =?us-ascii?Q?gj/dsz8g81G2DScmNX2Pj6dvOQkX+XYDE9l75uWivO/kiDWSntrC+yRxtwbx?=
 =?us-ascii?Q?Zl5yVXJ8MtkAutlnPRa43BTMo+LLcL/XV8c3kXcx0IJgTE58rkUzWcC7g1jp?=
 =?us-ascii?Q?c+E4bJfGBlvkMwffs8M/LAgLS90WCkVkIOJYRaBUECO/pH4kDVs0cwx9RWps?=
 =?us-ascii?Q?01Qzn4g1aS6yzUsqmDEILqG5pODwETl1wczOhpQ195c0hJg7DPsWbeu441wV?=
 =?us-ascii?Q?c0mz1CakQgVI0wabfGbo0AwJ2khcK3mbdhS+zlsrl7OjRFYS3f3lyfvsV/I8?=
 =?us-ascii?Q?i6Eu0TbaHCl/68xRm221mdRFm9GOUdbjU/QBhxa6xI+Sw0AgKNVnj4fSpaIZ?=
 =?us-ascii?Q?6L6aVJbED11MVpOdDBzSP76EU0XAFOMUqkcpaLophlwFdPpxpRH9xUt0ILLy?=
 =?us-ascii?Q?55uTuoYiIzsnSZFg4p+7kYtd1CpqPOuYw1Rs2x5+7uC+N4coSidZVcZ4pVCg?=
 =?us-ascii?Q?dj2/U+x6xDnOGeZbiBG/pY5I99iaYv7Kc/iBbhjPsBbgtt9kggQvLEZWOtbG?=
 =?us-ascii?Q?cd69++/rf8AvbJkl7shs5Lr6YfQrFFldIPwqzvMR1HBeTXUw6s/p24IARUeX?=
 =?us-ascii?Q?9/2oZslspc/kJI6oQ8smPkWY+J8DtFb7WNsV7e5VjABdDfts2Pa5vtlVJTuE?=
 =?us-ascii?Q?QGpW/mX1kTOInT+4Bhi5GJOwdMSnqEKCJ0ObV4gWU396VY6AEIJz?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 91a53893-cc6a-4c74-c2ad-08df49f707ae
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB7280.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2026 06:49:04.6064
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MW5u7+eFdTWL2Ok5P42GpuZ3p/JUCsiS51IajZao7N2/Jyp8SiJ2QWTF6I5soiFZBOerUQ0GBQ/NM4cBJJ2pE30npD6dHwbR5QsycyOq44Ev5y3LBnsD07E/hBh6R6rP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8754

From: Jeff Chen <jeff.chen_1@oss.nxp.com>

On Sun, Nov 01, 2026 at 08:58:00 PM +0000, Tristan Madani wrote:
> From: Tristan Madani <tristan@talencesecurity.com>
> 
> The TID value extracted from the Block Ack parameter set is a 4-bit
> field (0-15), but aggr_prio_tbl[] has only MAX_NUM_TID (8) entries.
> A value >= 8 causes an out-of-bounds array access.
> 
> Add a bounds check after extracting the TID.

Reviewed-by: Jeff Chen <jeff.chen_1@nxp.com>

