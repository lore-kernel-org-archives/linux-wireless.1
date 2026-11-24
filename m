Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.69.22
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795501597;
	b=3gzgEpKxBbH9cqdXNR4NS/WBD+SPnJZDK5qbOX0HAbwB9PG7fjSQNtPJFKP7h6jD5oWh
	 BX2OqLOMk+A1wZ3Sb8NqXij1Jsj7AlXl45H20p669ZhiSzG2t9G5cWbZkssKEIeA+h1e4
	 8K3YQF3Rl/iIUi6371k4R1DJqaXlKRtyk1Ma5XJNhvC1UOfov6x46HX/XT6/MqlEzUb+4
	 IC08wY7WAHDzuIUZjhVDvCRP2pejrYtnCZ8GBy1eYAFVYouf0UroMzp+PF3jliWsj14RF
	 ODOOHUsmTTUD+NueZbi5mrenaWMmaax1kP4zBO4TbYGaAPP75jFpQEvkjKxxLYE8N1w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795501597;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:
	 Content-Transfer-Encoding:Content-Type:X-ClientProxiedBy:MIME-Version:
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
	bh=0SS2HKaCpzT/qfA5bSI2Q1528A30f8GwIdZUtzpTzMY=;
	b=G5K/Zir+dn3XxwiycwX4+eD7Zrlnc1dptKS85WqCx9T36OMbk67285/EvwSSdy2WDThf
	 LuGBggvykuBRITP2b7ZwJEspg20Q6ICNwj/VR7jPg1fstTmqlB85ms0oiDazW4BTe3AWH
	 2eiHpP8gs40cXRXD95YdHMpsYyakqUsJmj55Pg6h9NQCSQTwmf2ZNMySeHMKC18CZ16lL
	 ZKkLOK6M5loj5tPhfz8QTqn6L0DNvrZ0EfsCnr3gE6J54wFwm6hLLA7NE2XFag5Rdqen9
	 TRjZbMgVPDcnbjQAreQLjvwbSo76HWgYGlRqyiB7kVRNZKroGaGra6icg2PSEaG2LtA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=ubiwhRLd;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.69.22
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010022.outbound.protection.outlook.com [52.101.69.22])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8265F606A32C
	for <linux-wireless@vger.kernel.org>; Tue, 24 Nov 2026 06:26:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8265F606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=ubiwhRLd
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QWrGWgqq+HzaBl22H6nc4w6O80lE5sUnG9xxhRlHJ1UHw05C+zGPbVzL4Zq2oSyQ//1cJVSkXA8FKAzMnmKkDW2eafUUkej/Qiz+15wNL2V8VcGnK2HKoUonasd5NDZ93CFmzG8cHbGU4yVCDo5aDbXJ/+ikJlpqPMjvVzN+a38ri1yuvn1GtyfS03JqnUxjbXnVZph/cx/kat+xTNaW2oaa2k9KuV3hRL96xtcW7PWWMnc+cgsGjwwX5wW5AFtk5A3WxMWfChemLBjAGbj5wD8wltrCWFDiGOf7p+WZQgxlZgbhIaH4628MBwizgK2ZI90NtOQ058eDzlcjLRSC9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0SS2HKaCpzT/qfA5bSI2Q1528A30f8GwIdZUtzpTzMY=;
 b=TiyOIE8Uu3h6DHRufx61PHg4AoMxPEbciVz0KzaPpOef8AXGDUPIkJ/Ia7xZ2iXtISrdeSsleNSd6koZ6li9xq2iOGwm8mB8bKbDkmxFqJ0HO/sTUcnJOfm7pzy7wRoPV0CufcwDkZQ7m6ceX6NsFkPMOsqjLpBk64We+t9g575FJzjT4Vv6BW+kokfpGJNzUwHkqw5YT3dr87LuYqL824EgCkqW0TaKNt/cG+D41HpVopNGORUtrtemUVhS4FKm7nERuU23yWymlG3YlypI0I1XLeWEY4mXcds7CflQ0bcik9CBXIEbDwEWW8JiAtr1leHPw0RzeBz9Dr+envnsuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0SS2HKaCpzT/qfA5bSI2Q1528A30f8GwIdZUtzpTzMY=;
 b=ubiwhRLdaoyPmddQbsJIQgJlefgfKdeqMcaaHp1811jLC3AnXblUejUvDeN7sgHK0oSuJxrfaSBDVTyO+B+Ujynynd7SsOJbjv78emhWmEliMmyisAkPDkzUKz08OA/L1JOICX8foDaohed2MBpD8tsNpI48acMQqB1mX45R1RjJ7bprTmHr8CBigM3W3xJLFwZeo0hpRPyGKTT5C5vtDx5Df40hus8TgBwmtQ1odsmINViTHJFinLztktf4ntVhE7JlhJqKHzDreVESjkC9gZjWK1kie+ELttZd84Op6ijEoKT+eH9kfdRQBZKgc5I4AiwmtSFsdGw+cUupqd3dOA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from VE1PR04MB7280.eurprd04.prod.outlook.com (2603:10a6:800:1af::22)
 by PA4PR04MB8014.eurprd04.prod.outlook.com (2603:10a6:102:c7::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.13; Tue, 24 Nov
 2026 06:26:33 +0000
Received: from VE1PR04MB7280.eurprd04.prod.outlook.com
 ([fe80::92fd:f75a:a302:f859]) by VE1PR04MB7280.eurprd04.prod.outlook.com
 ([fe80::92fd:f75a:a302:f859%4]) with mapi id 15.21.0639.012; Tue, 24 Nov 2026
 06:26:33 +0000
From: jeff.chen_1@oss.nxp.com
To: Tristan Madani <tristmd@gmail.com>
Cc: Jeff Chen <jeff.chen_1@oss.nxp.com>,
	linux-wireless@vger.kernel.org,
	briannorris@chromium.org,
	Jeff Chen <jeff.chen_1@nxp.com>
Subject: Re: [PATCH wireless] wifi: mwifiex: validate scan response TLV sizes before indexed access
Date: Tue, 24 Nov 2026 14:25:39 +0800
Message-Id: <20261124062539.801946-1-jeff.chen_1@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261025181130.3711823-1-tristan@talencesecurity.com>
References: <20261025181130.3711823-1-tristan@talencesecurity.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0064.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ce::16) To VE1PR04MB7280.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: VE1PR04MB7280:EE_|PA4PR04MB8014:EE_
X-MS-Office365-Filtering-Correlation-Id: f488a286-48c7-4293-5bcb-08df49f3e206
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|23010399003|19092799006|22082099003|18002099003|261021121427099003|261102123227099003|56012099006|10067099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	HprcgbBbBcKiRYe3fbpKkmWCNQ5WUHaQGVh00i0ZwSZw+xc9UWGkKjADGHVc0D+jUOumkrJB/EiJFlBQmAtIhKm7qoojWKu0BGh0mcy9iTTcoe+1xt+MFnXgnVDw1MjJXlRNECfPaHFK382jjMQHP2kXdNRUlNl98HZypDF3EPuKzkuaUOFHWvmEiy/ztMp7UI74HJWTd6DSC1O4niGvIarZH8iXlh6A6WkSbY9X4AUU50xxndNJ07I+zPjZbwldZEA7L1Vco8evn141QiCZRuf0axzQaT3aFWXqSq909fs4VuSR/I3NuJX2DcLc7MxhGa2dkj8ji6Nmk8YsJrOdlwlRpc+D2yjvdH6vgZEukgv0fWlD4m7olrbVH05sFrW6EGWuuHDQ4Pe0ibKh7vQ3g/IrvxujdRj/RGOBQtX5GLfDavxLVGPN8wHau9otAgavCReATJ1omQ6/dgS8p6UnVBY3LO00aR6nLTicr+ZES2HT6pob19CABaGxQhd6G3DEIt+YT2Htr1kAB3dqq1jhNmRFAwISt6Kpovf95mYWHx8AopBsmrA82Y95i6F9mwS+rx0KdQhkzddvLI+fYlIIY3FIlH7vw32PvihDfl1evUnlxFom1MevMwyAYMyhxM8OywSeXH7LLSUWHSi2CPgnd6mdXtHVNpLJ1VW0YZ6AA1M=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB7280.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(19092799006)(22082099003)(18002099003)(261021121427099003)(261102123227099003)(56012099006)(10067099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?1i2x4shVAVs4LUj93R1HVSZZ8Ud6XUOnUeG3gvu+wyBiDALFYh8XgMqvwSPr?=
 =?us-ascii?Q?YFNn1xsvRioCpYDEuKVXPjAzRJ1fT3VlZ9jQPHn6ACa+686Wdapggym1iBIE?=
 =?us-ascii?Q?edRvGXn5LJldjxpMGk6i7OwS9d4GdZ57K8NWiPPWy9UhaDpUeBqwsr+Vy/mI?=
 =?us-ascii?Q?JRKJ37+KTkvpo9bvSAGzWRF5I2mKWiAbeIQAMllMQzirvvYTYbRY+99pDFDn?=
 =?us-ascii?Q?RmiDFVj0EblRNecudPek9UdpEynHGzYFsOFU9aTzqw5zkSQIqcX0zIFOolP9?=
 =?us-ascii?Q?Fp63LMtVVqkDp9UreA9SGlaZkcZWCrSTEAEYtBGkez+lzm0VWWxGWonI6orP?=
 =?us-ascii?Q?Y99mdrSJh+CJ1tyYuk9q9VEvGGytbjxYayv1+zcEF5cqyo+YmkYfY7BbYdeH?=
 =?us-ascii?Q?VrkImAJIXbLTOXTFqrWJVKfD8x3iN6zrZ/PC++zLw5Znhtiu+1PYZElWxxMm?=
 =?us-ascii?Q?dCegVobMxkGJSRVvJmGH0PzefOA5+tUR+Ih6XUMelQOt5mWmk+ZEosqIKGGZ?=
 =?us-ascii?Q?tepaOIj40KoeoQd0BXdPz/DZINJzdL5gK3zfccl+icHue/vm00SmIoCm9aEe?=
 =?us-ascii?Q?7DkIXLF+VUeCJAbKiow52oxcmJb/flV2RMRoXqh7ruRwkuUiGOMZxtiUdaGS?=
 =?us-ascii?Q?kGIHqEcXzzqgMmf9omNufKPwb28LYc5LBekPGnPyaoc5nDAnJNP/peCPjbKJ?=
 =?us-ascii?Q?Nz3Ik4SZfDj++duht8Ua7FR3JBK4bf58tpDRfAQvoQeV7twchXgyhDmuVDMe?=
 =?us-ascii?Q?21zldg/JtkyfN0dnkxa/AL4JGsBlUnkpCxLBYea+ws8CYsJnA3G9GplDdNQJ?=
 =?us-ascii?Q?izcxjcuKabPCGX2BjVlcPwcwww7JAO2Sde2pacMWHV7XQ2kS2sn7EuBAw7Qc?=
 =?us-ascii?Q?uYdLMZuVhYAKZeDW1kH81HkwhDScI4RCrz2QX2/Swgdg9+AtGLBadTLgcKBz?=
 =?us-ascii?Q?RfhXq9UunQIlXOhEFISfpH6PAQHMc8AU0EeNXNfMUg6N8sWK/AvocPLFa9Ei?=
 =?us-ascii?Q?K7J9ANZxjFf/2wUcU/JJF2Au544g5oQzgwi6XEPeIKDErOK1Qg1MQ7hAwoAi?=
 =?us-ascii?Q?BoENBz70yZkeoJMjKb+TkHjnJvIAIlBkI85g6DD9rzAGb9wJPJpRt8lmlCys?=
 =?us-ascii?Q?soU5h9L0UWsU5tjVjDDrMyy94e3bLrEOaA0mhjwTAAOpxWz9uFzcESTkhaqA?=
 =?us-ascii?Q?jTgzLptgxhdCisfeVciqNW0IH/XdM7sVbGnKgKpD0IejLdvHWHmK6+ZLCJSo?=
 =?us-ascii?Q?tTd5wp7eNcCm10XFs9f2T4LS0tKfuoQa3YKT2sByYmzLJjPmFNTdRFgLyyMI?=
 =?us-ascii?Q?DbwztrAgltNwJJ3UzB0B7tCpXtFkQ+VrrRTOBVCv4sAWTaORUDtmKst0xP1O?=
 =?us-ascii?Q?1npt7249rxYty5GDxzkDdlcuHcgxmfWs/m8AceuD1aEY2GoGihiS7+6EOYFy?=
 =?us-ascii?Q?gUzofqetRTQwEpAJR0qvR/0GmvrbESX0zVYJWC2jHgCroNCJP8bIXp4hO86X?=
 =?us-ascii?Q?LKsuPRq4B9UJ3U6aTdkplY9yX8NvCW/dWII2hF0hivYl1KlGSY/3UYSE8yHT?=
 =?us-ascii?Q?06RVEbjwOQrM3kLoXPJ/SBBqxvauMf0PQl+AGzouAzbsaTnBBPTe5RAWTUMs?=
 =?us-ascii?Q?tf/tiYIsq/reCZKQmuYzFphji/TkTw/u6d4y3k+SjM4n4MTyKNbhvk2l62Gz?=
 =?us-ascii?Q?4eZXEkqeCGyHVus8L9w6PuasEOwlQ6a0Dgb7lThomvaQBJuEhbVQLScddOM/?=
 =?us-ascii?Q?ursbZ2zZciaSHQVwyDs07saxdyK7LNxGCKZnuxRX7dRjYwwGNsIF?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f488a286-48c7-4293-5bcb-08df49f3e206
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB7280.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2026 06:26:32.9759
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tLSUCbZ0j6R7dhDgFf7BiCxuFCugmFochibz8HAjT+JxNMEjoNGs/E776+/S9lTOmUqXtBZcCXYQ5UFbJP6oTNUkkYEnwRZoUiv8g8+2xL6ihwBWSuOMLFdr+DpmgvAX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB8014

From: Jeff Chen <jeff.chen_1@oss.nxp.com>

On Sun, Oct 25, 2026 at 06:11:30 PM +0000, Tristan Madani wrote:
> The scan response handler indexes into TSF and channel-band TLV arrays
> using a loop counter derived from the number of BSS entries, but never
> checks whether the TLV data is large enough. A firmware response with
> fewer TLV entries than BSS entries leads to reads past the TLV buffer.

Reviewed-by: Jeff Chen <jeff.chen_1@nxp.com>

Please check the checkpatch warnings.

