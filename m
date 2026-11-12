Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.70.55
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794488828;
	b=NrcOIllyp+KJD9Z3ZYFDfDuBLFjy+zSTYr+ecWQ+7LJkE5vdAxQu81vLcWILSKvT9pTd
	 oy8d+Ef0vcDqRqVaudrCHfMxh8riyuw9IL9qRIJXfko160+uZHAxavNn0FgGQxWvcRPgh
	 jpoEXrHdWTYmz48U6/8JHhFvgTPSp4BmojVX2NE1l7Ml1g/P0RRZQ6SCKXKdIPbg/xMNo
	 gVt5yRhin52Jfe/aPQawSX6VV5RHr+7Nj9yCbWiJVxUUNV5bpLx4DhkpEjZrOWw52lohu
	 CR/2T7xFnYGgciEvj4oaKUM2WN3FehilIsYw7z3+yEjDyO6HlNJC3CjP8SbkNgybooA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794488828;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:Content-Type:
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
	bh=W29ZAFK/Xl2gcsT4htqHimspo5R3wx8uG5Rcjd/LD+A=;
	b=5nNK13RUulBXJp7e36DiyFNU5vKkxFHripJQKZ7xo2S+0fR0OGMXrH6MAMME7v9i53Cf
	 Q0uO2oY5iQPRPh2p9p6fXG9+VRTZZDsTeJjxRJiE5ftbHvWQTr3at0pnB+On88cMzfIyY
	 jPACHFcMr/XaY7GP6h/3L4650Sx4+M0zLkEgp2rRZ0kJV/MNl6NwLpkH4T1dQ86h7XQwu
	 0MFgpFI4tgA7ntGw1jNinky7DxRAmxhOhSJ9s2xQTDddVKG3hd9ECT/Od4PeOUJfFByqW
	 I3Ncow/Ixhm6j52JIlIV/5EYfJmcyi881Hcvcg7oczvcXb6G4snNTJ+xzRHcWOEFSOQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=pVP8XvWF;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.70.55
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011055.outbound.protection.outlook.com [52.101.70.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8F24606A321
	for <linux-wireless@vger.kernel.org>; Thu, 12 Nov 2026 13:07:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E8F24606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=pVP8XvWF
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fMn0nFb9CSDSx421CToF2xPUXmCFHtCtz0s/JLoXL0xDyO0fKcthB+dgCvWRFAoK1JfsnsN4N4q5wlPMwnO/Fk1kP0+g/yXXQdUB2lNaP0FdtYZlkKS8+Y7kN9ZUfT/aKlTtwsQqpraYfD8/RNdiCCXrsJ3y1UcJz5V9ErzuMmNGzsaYYxXdaThGwqKqOCMX3aes5TDKvMs5s05i46XNmI4SURBCaBhzkRDlOvG9lAmDiWor7pnUUsIkxKRm/bjodC6v891G/Y609ASCp+T64fflzsYke3zbRmvSmQw8gueTFXI2ju6L8erAN2yRX3ZpHN8ML3t6MCWt4YTHeFO4Ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W29ZAFK/Xl2gcsT4htqHimspo5R3wx8uG5Rcjd/LD+A=;
 b=kQdv8Fwrz0RmgnJsBvf6oxTGswuJlnA9QJ2TxGCh/VwvEL7Bbo2TRH2jcbN0mtKl1c4GaNkg0tjWiOK/8exfMxJq9JiQX4RcccoSB1ZYW4LqPcSby/dxHir/0x9jmSZdwbUtvQlFJ7+Zyy4gdjzSOuIsdvntVD8vryQFL/w5bxOoXnlH19hlSdkBtXySCtgANth4vEU8IRBUHHqjl4PAQubXmFcnK4kgaxmUnh+9CthNuTkTfnJ1I1FgrYDSaj3CoZUKpjxghNIP60ry8Cw/QtG6wkMIQaOlXAPTStWoWQ5B9gxFeU376veGQjBcrLx2G4XtVEfTN46h89W/PXVkMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W29ZAFK/Xl2gcsT4htqHimspo5R3wx8uG5Rcjd/LD+A=;
 b=pVP8XvWFJPeIX1r2V99TDW9ys1A+NbfM/VoHnoXUMzzvCeTp/O5oExsV/TSBBohcKY3Or1HxtiQyaL4Lq6ern5xACoWRevqLRy+WtX/ikR4w1Ewn9lSN0d+Wt6jq2GzxIg42MUr4D5kOmHs5mg5r1p9fHAib5LNv6dNtSUJn7N1qMZuPZxq4sOE7jsCZBPOFYohzEgBL57TImK3L/7qlsjXMyBZdtlNUz1vr1vTHg+yu18FvP/BxLqCQL3N5o9TXa2Zc0+nHJbO7CsArWBFIOX4xcUHQTf3bbSTtvyDKXqLkzSHJjqLLGlyW+O37FvHCJvMvK5UgwLKJcVy+3T1LIA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from VE1PR04MB7280.eurprd04.prod.outlook.com (2603:10a6:800:1af::22)
 by VI1PR04MB9762.eurprd04.prod.outlook.com (2603:10a6:800:1d3::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.11; Thu, 12 Nov
 2026 13:07:04 +0000
Received: from VE1PR04MB7280.eurprd04.prod.outlook.com
 ([fe80::92fd:f75a:a302:f859]) by VE1PR04MB7280.eurprd04.prod.outlook.com
 ([fe80::92fd:f75a:a302:f859%4]) with mapi id 15.21.0615.009; Thu, 12 Nov 2026
 13:07:04 +0000
From: jeff.chen_1@oss.nxp.com
To: Vishal Gupta <vishal.gupta_1@philips.com>
Cc: Jeff Chen <jeff.chen_1@oss.nxp.com>,
	linux-wireless@vger.kernel.org,
	elb12345@hotmail.co.uk,
	francesco@dolcini.it,
	jeff.chen_1@nxp.com,
	johannes@sipsolutions.net,
	kees+treewide@kernel.org,
	lilinmao@kylinos.cn
Subject: Re: [PATCH 1/1] wifi: nxpwifi: fix race on scan_processing in nxpwifi_scan_networks()
Date: Thu, 12 Nov 2026 21:06:29 +0800
Message-Id: <20261112130629.142693-1-jeff.chen_1@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261112122755.183585-1-vishal.gupta_1@philips.com>
References: <20261109170400.1316239-1-vishal.gupta_1@philips.com> <20261112122755.183585-1-vishal.gupta_1@philips.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS4P190CA0006.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:20b:5de::9) To VE1PR04MB7280.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: VE1PR04MB7280:EE_|VI1PR04MB9762:EE_
X-MS-Office365-Filtering-Correlation-Id: a342613d-5c28-431a-9266-08df40bdd877
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|19092799006|366016|23010399003|261102123227099003|261026121527099003|261021121427099003|4143699003|56012099006|10067099003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	aiFK+k2lxuayR9N+iq75yAcaSy82g95EmeLcH4m8krTWIOjWdTDydGUjDL3ej1JwxawY5H/k+OUxHsM/QpdBFjzElt+n9F8IWnHGbr2BvnnFoaNajVud7mmnB31xxYMRmkmKpwYjsSJ5BfQEiWhUMpqpyIXpTkQR84cQJuX62p0DQ5nMVXhYAjSw0MGrpLGqn+HaMYwTlxxYDjRKc7j/ZE8ueXI277usEwc6TE9ZAddyBk7XG91a3P/LKrUs2Ii1UQ6E61RJjLjt9F/xnP5JRnt3gv6sHWnJhH4wIv1id5g5SJY8o/EGlwMrNYPaxk2xkiozL8a6LGjkK+Mt+K8+dW0KjJxRVHYF6g/HFFZid80tqi6RCf0lN6avw+375wHrtphLWNIU+9+dx/g4tkTwtchYKsiAWMwYq9CtTYe5X34M3ZHTs6f/d2t06av6wKtKEC+/zfiwirqrfOpN4TdEsIgId5bAKj7vkjX1RcOm0yO1qFVoyQTte2fcYW+1x6S7OCvuSTKn4Z7U03hjT1CRi9lrfFpjf8wHq9qR0zV446H3lTLNasjgq2ZGi4PWCKo72DESzEbRdgwQwwnn2smltFoLZWt+cs6nTm1MXUmJZ3J/vz1t2EGrqVW64jv+2IQQ32gfIAbjDB7dJjFNdVra9AOurPlSC09FjL8F+v06KU8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB7280.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(19092799006)(366016)(23010399003)(261102123227099003)(261026121527099003)(261021121427099003)(4143699003)(56012099006)(10067099003)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?THdoVC9hYkZkczlzc0srdkJ2QmcxUEpyNk4yNFBPYWNNTGh4S0g4alEyTXU5?=
 =?utf-8?B?aDdYVTRQSUhsa3BzTmJPVmNqeFArSklCeWVZUEN2NzlKTHh0VWwrcWRaRWJ3?=
 =?utf-8?B?ZXFDblRuTzZkMDVFRk4vVWp6ZXJET2l0NHloY0VuWW5oaEtVMjhuVThadU5y?=
 =?utf-8?B?SVIraGZLeDR6L1RRVjN6ZENWdDZZWmMxZDdFQmgxd01vMG95L0VUZEdQSHpT?=
 =?utf-8?B?RWNOKzdjTGU3UGxSVFE0Nlp5cnNhYUM0dG9qcFZFZjMyMW00VmhTMjRENFN5?=
 =?utf-8?B?eXFQUWJSSkorVkYrQmlCT3ZZOElOOU82eE5rdmpTa2gyMkhCSmEvREdobi9o?=
 =?utf-8?B?VDJ2Z0pZbmo3eko4cUNVU3ZDemh2TEVKRjZkQ0ZuUUxUdVhhM2J6MndQMnZa?=
 =?utf-8?B?QUl1L1FFNjl5cldzRjZieWJtSWdjNk1MQXl6aldlL0RoREtBeGcwamhvaGF2?=
 =?utf-8?B?TzZSVDBXT295TUtlRTZHY3FKZFB1ZDVnb1FzYlM5N0YzOGFQYkVpYVdlQlZO?=
 =?utf-8?B?a05Ec1lJR1JzSk1jM1M0cllRajcrZzZOUzduc1NMSmwwTnhQWkk2KzV2OGNm?=
 =?utf-8?B?dnI5aGZ4UHgvV1F4WXpOUTBmaFhQMXViOFVKVThScVYzdnpjalh3NlREV3pq?=
 =?utf-8?B?dkdHbUxvQUlKWXNIY0pJWXE4TXJVVW1nbCt0cnhwamsxTjJHZkJkUUQwQ04x?=
 =?utf-8?B?K1VmbE8xU3dONU9uQVAxZTQrN0hGdi92SHFqT24yUytORHQxMG9HTXR4R3g1?=
 =?utf-8?B?bUtRM01XTTVhdmxENzRVa2ZqNWdoUnJJdWZsZ1k5aDY1TzVnTVVuTFdvMk00?=
 =?utf-8?B?UzFIMWV1MUZrb0habTVLcVNZMTc0Ti9sTHlHekxwcUI5UWtSaFR5eFloQ0dx?=
 =?utf-8?B?RThROFN4ekRFMFlMK1JQYW5mOTFKaHhmcS95WHczSVd4T1dCelZLRjFka1lF?=
 =?utf-8?B?eEpIN2czNHhLaG5abTJNVWZYQS93ekdLRTZjVEFlSFpjUUtFTlpBMkY1TTZP?=
 =?utf-8?B?d1RxckZUSWpPRXNqdlBnZC96Z3V3VCtTNHVJNUVnaWJiNnhQQURGT0xxdTJJ?=
 =?utf-8?B?L3hpTnZ6Z0kyVXNWTzlUZnFaNjBjeVBvRGNmSlo2M1NCbUQvSitRMElNVWl1?=
 =?utf-8?B?d2NyS1M4dWF5dUpGQmxxaVJzZEtvbDgzd3hNZzFTRm9FLzJtQ3k2RjlrQW1L?=
 =?utf-8?B?d0VKWlJoOEYrbHZJNGZGU0dDQ3BCaHpKTGFvY3I0MkZWVlo1bUYxdUVZeCtW?=
 =?utf-8?B?QkRLdDBQWjgxNnNMTGIyWFQyUTlhbFFzZWdXMDk5aklXRVNYQ05Fd0VkSTdX?=
 =?utf-8?B?SE0xYnpsZHhPRzFxTEt1M29odUxERll5NnQ0dUdaQTB4d2dkU2Q2Q3htOXRV?=
 =?utf-8?B?aXkvc3N0aEQ4czJqVVBwNkRGeXNYK3JsZk5EaUR4Tit4WE1BY0gzbHhJakky?=
 =?utf-8?B?VmFWOGc1SGdtakc5T1NkOVlEMW55V0tZa2VNTXNva3J3YXlPUHByUmtzRGZN?=
 =?utf-8?B?aGs5UlBYWExFTHl5bnR0cjJYdzBtb0VBSElHR0czQlMxSk5INVdWVVVIWFlu?=
 =?utf-8?B?Y1p0MU9hUFZBL09xVEJSa0F0QjVnRGtXUWYyMFlLZ3pmSjI4NnI3a0hjS3Zm?=
 =?utf-8?B?bzkwaXJ4WWJrVGlNZmE4c1kwM1lHb1QvYzRpT0F1K1NyNW1rN0l4TFVTV1g4?=
 =?utf-8?B?WStFcEZPdjh1a3lMbFFsZi82eHZOTjl4ZVpBbWR3Vlp2Q0JBeC81bUg5VVMr?=
 =?utf-8?B?N1RJV2QrbkdlbDRvTXhLYU1kUTFXMnBxM2ZVcEltVG5TeFNMRE8zZUVaSlBR?=
 =?utf-8?B?Q1dNMHJPQ1JPOU5mT1VoaHNZTGEzTndmZFRJYTlNT1RVOEc4cDRWalRBT3RS?=
 =?utf-8?B?ZUorWDdrZUR0R2xyNk5WZ0dZZnpNN1JleVdlck9UUU94RncxUUNrMTVwNEJG?=
 =?utf-8?B?SVJWQmRVR1Y0eitXQ2YxR0llUHU1a1FGTXUzRyticEM3VDkwd3BvcDBPWkNz?=
 =?utf-8?B?cGF4RmpXQlhaekh3YW9GNmw3V093bFZoZ1FTUHhFS1llRlNCeURSODlLVWV4?=
 =?utf-8?B?OFNYUFRUREZvbnkrUERiRWMzOTVUMytaNWJvYnF0T1pkNlZaTU11R0FNR1My?=
 =?utf-8?B?S1RZUzIzcnhHR3BxdHpVa1BuUVBFWTZoeUxGL25zN3ozT2JaLy9VNFA5eFk1?=
 =?utf-8?B?Z3ZYOVgwWFkrbldUQ1pZYnN3V2dQRWVtYnp5TSt0K2p1cVF0eDBqL2FpY1lJ?=
 =?utf-8?B?VUlhNHUrZzU1ZkFiclNONU9NaFYyQlBxMWEyYnVpZUxoNjh0Vlk1RHF3cm1m?=
 =?utf-8?B?c3BPWWJ1MXEyeXFxYXFVb05FT1ZMSy9UOGY4TnRoejMyZC9tMHZ4S1R4cUw3?=
 =?utf-8?Q?J//6KOYshvHKoRPCsoR1TDukhhHCJTtlbYauj?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a342613d-5c28-431a-9266-08df40bdd877
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB7280.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2026 13:07:04.2490
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sAw5DcyPRLvItQad8iCdJ2cVU0kM4V34jolX5j2DpY7Q+ebtZsx8GgPhpZLWBh3hs2hUaHRS0+2B5aJ2ATBgf7f3CqD5Uo1s0KMudheuKurGX94L/KdkIzXBY9UcZyHU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB9762

From: Jeff Chen <jeff.chen_1@oss.nxp.com>

On Thu, Nov 12, 2026 at 01:27:53 PM +0100, Vishal Gupta wrote:
> My patch sent on November 9 is visible in the lore archive, but I can’t find it in Patchwork. so do i need to resend?
> 
> Regards,
> Vishal
> 

Please resend the patch.

thanks,
Jeff

