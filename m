Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.70.69
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795074714;
	b=Ruv6PHCffDINuKqu0ytJY8+o7Vw+EwCnZoGtEdHYivHnBkhE203VG3TtOjtdRlUWvjkx
	 AQWevUyiQmK/umDEXNw7G+XvDnyDJgHL9Rc6upceqUGIBcurv8RJ4ai+Z8DSi0PUIgIv0
	 /mIuLaD2FBeXor2f8oqPatl1jRd7pmlOjoQlXhj2tAz/JAtI3MoNe64Ev/eK6i9hGeN6k
	 GxMyOdZOdE7Uu9MmbDOZ4cIAZv4qn9W+Erm51J5EZ0/fag0h+HWj2k3FxFDpcF4743IgG
	 hZGsFP3x88+OJeGEMlC871xl30agbqY7cfAIMAOwyO0rzgsHpU4o0CCY9WoU3C9ExOA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795074714;
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
	bh=Cko5yJ9zarCkRRSiqkx1APKoAml9H5V79k5xqK9m1GY=;
	b=chmcSn4jlxuDQBrKhBsy7RsQrG/PXsOo3pmLyKy6mlR+iUWIfcMKFKoKs2dRu29s9OXh
	 Sf8iVX0xllHyqBk+XcbWfS39skH9QCNpB3idQEIW49tUTN6l9R0ocq1nFGT0RD1LNHc7V
	 PbrnFaDhOFTN/pc4XIM0bY6SDd9xr+U78NGOozHRGYTax5AZ55Fbh0iTqrOp25iZtos5l
	 yRV0bt0Vdm7hFljGBQ1fv8jPeiLhb+SnsSoqDm+MA2AgiX/HqtZm2LwCAER+Lq01bBCZU
	 B59O4G0oH4NSnukP/u5i/WUKZJ2DuubiHMG2hKJtr5vQ51y4vlFMcavU/MUQlqZqgzw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=rFGrJLnX;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.70.69
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011069.outbound.protection.outlook.com [52.101.70.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D153F606A320
	for <linux-wireless@vger.kernel.org>; Thu, 19 Nov 2026 07:51:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D153F606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=rFGrJLnX
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nw/4j4OKKuTsbHX7MwQXAr7IM99ve7qToPLJNH0tsF1rLA5X6Nlfjyp4kvBwdEdnfTx+mh/kV3ZHZ2JO0s8c118dCqyLXUtjurzK/BcasZ44qAriLyheW0e78zGTBrB5vL7gXW72F2qZOaCAUmsrOByTkl7uFAIQJorT5jBqRoFbltEEkUKbAAwGULQcIVP+fkP/6aXMh45uV3VE2wS1Kb/pgmM8uMoPqqzxWNmL9QDinPZy3SEYQui8Ak7f0atnoVt40iS3lufjeW2Vjlkm4dwb7PNrBI9KXsMWUipus7lrt6KEN+XahMsHWbZYIWcpqE0X7KhPL7KN5pmBA9JPZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Cko5yJ9zarCkRRSiqkx1APKoAml9H5V79k5xqK9m1GY=;
 b=hEsfyCm/lbqtuEh8EjNhFXAmf4FTbrYTlbS59/Z0ncljwFQUe5i2fkw+7AaosHo2trKziTdPWkUqMR7TBYycmdxkM6BVmiPAnnhUkcXXJYvH2KJv2hBeq28R8eHJ94ymqiJHmoM4w0aTHecMf6CbT7I917D6wH6LBLcbaWmKI82GnExEVzEeGTaDeqecvPoAPg4482h4kawdmfk0+Eeas0sqKlemXiiV+yhHaLnalAfQ8peznNzhsqzFbVEz//xdS/9ZmrQi/GyfyJkofbdK8p3u6+fmQdvR2HCbIT/kf+IHEDn0Oz3/HM11bFU3IE8Wf2Axo8HhybF7rM1eSJLAkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Cko5yJ9zarCkRRSiqkx1APKoAml9H5V79k5xqK9m1GY=;
 b=rFGrJLnXbsoezjmkPCNhwFx8MuVrDdH+72iD1q7S3m06hDZ+TCQ9N801rzk8iXIXcvidSly/xYqMTSdvaNt9Opbo/nOF6MZG52EYwGwAzlaFhWJzY7r9SSJPqzDd8ApG4sqH6RZOpZsrUADG/bVh0qKEEBzKY4JkEJaHHAajku7Am7egf+k3uQ9gjEv0gb060wtADxZ0ZjV18ssKFW19tGWy9ZN2jZmRVKo/k5VyyuwmkyrWDPYdXj7v8RHteOJgxgJ3cxt8C5tFvGeneFRWeUjC26cxlTtQ//LxeKwU6adlmI47AUZ7SJOK3bgljzVFxHoiTld4Unx4+ekTJb8sgA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from VE1PR04MB7280.eurprd04.prod.outlook.com (2603:10a6:800:1af::22)
 by AMBPR04MB644081.eurprd04.prod.outlook.com (2603:10a6:20b:7da::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.10; Thu, 19 Nov
 2026 07:51:51 +0000
Received: from VE1PR04MB7280.eurprd04.prod.outlook.com
 ([fe80::92fd:f75a:a302:f859]) by VE1PR04MB7280.eurprd04.prod.outlook.com
 ([fe80::92fd:f75a:a302:f859%4]) with mapi id 15.21.0615.015; Thu, 19 Nov 2026
 07:51:50 +0000
From: jeff.chen_1@oss.nxp.com
To: Paulneja <paulnejacontacto@gmail.com>
Cc: Jeff Chen <jeff.chen_1@oss.nxp.com>,
	Jeff Chen <jeff.chen_1@nxp.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	Francesco Dolcini <francesco@dolcini.it>,
	linux-wireless@vger.kernel.org
Subject: Re: [PATCH wireless] wifi: nxpwifi: bound the pairwise-cipher OUI walk to the IE length
Date: Thu, 19 Nov 2026 15:51:00 +0800
Message-Id: <20261119075100.559056-1-jeff.chen_1@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261111205917.449230-1-paulnejacontacto@gmail.com>
References: <20261111205917.449230-1-paulnejacontacto@gmail.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2P153CA0023.APCP153.PROD.OUTLOOK.COM (2603:1096:4:190::6)
 To VE1PR04MB7280.eurprd04.prod.outlook.com (2603:10a6:800:1af::22)
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
X-MS-TrafficTypeDiagnostic: VE1PR04MB7280:EE_|AMBPR04MB644081:EE_
X-MS-Office365-Filtering-Correlation-Id: ea535773-1122-4d67-d80b-08df4611f828
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|19092799006|23010399003|376014|366016|18002099003|22082099003|11063799006|261022105027099003|261026140227099003|261021121427099003|56012099006|261102123227099003|261009223027099003|261028144727099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	Tp0s3Ir2JskVLgD+LT2jtla4iJACcOee1HN+NZvYwRTIoYHeL/x1aaGvi4hEtkMGNXFVWIfqPsTijYrRhimU1R9BDR/NkkMOzeKnZOIdTJatQQBA3qQ17Kl7PE+xXb8HqxnYEhGm3lz87oFM4lNvmODrGzNIcBj+UQJrhlp5GX64MS/0MhlV7/pcONdXdrBBSoYmqtDXAtYDEJFHBzbr38xeVx1d68WnxqdgKtpGY85j+3tQkXaTTIODUEtJnFjR3dgJw1Ru/fBf+Z1cuVFdmoeO43ls9tDrjcnbvArg+LBrvUxlGlie6ZVD8DFIawEmT6qG5bBqQlmNtRmkc/TYsnYEYewBk07o3vi8ZtkRxEiHZudOZhyVB0F/OH0cO5as/Hpnwx8Jw/JmsPP5peO8Av2P1e5Mzo6p2xfYRDaTi/DkXM2oPgma5p1zD3TdtL7qC98SU7TicIWdsAVTcwbDXC/yggyFkl75nptucCdiSBzYahpyoqNLfOTAW25x+jzbNvn+0ZUzlbUhSEyzoyMuTLjHyymH3AL4AO507lkYMCv4qn551k0kHNDLIGG82k1d0w9bPnTvxRlO4zTb2TMaigzcg/EACFPN4uKSqDdlVtdA/zebvCG/WqKsKBSVI//YztDJsOBSuJQhyWJLDeZHEA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB7280.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(23010399003)(376014)(366016)(18002099003)(22082099003)(11063799006)(261022105027099003)(261026140227099003)(261021121427099003)(56012099006)(261102123227099003)(261009223027099003)(261028144727099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?qkz8uU88ZgABUpk2Sph8lM++Agb7tvxdvJKop/lotoWiHXlpPB/bgAkr3PJn?=
 =?us-ascii?Q?D4QmSM8ONQg0M9YU9U6I6LrLB1XtPBXST9mGb8BtZeiG/HSakc9hxBKDXCYv?=
 =?us-ascii?Q?m9dRJGeH42OHqqqD8zi3hH/59Cp2PRtcadJysfego6t6OlqUuS/QpiFVzNkO?=
 =?us-ascii?Q?byfj42jlBnf/qPrris9xe/BIEXLhbzfIn3B4GnOIcd31tyskH6xbcG0TOJ72?=
 =?us-ascii?Q?RRLwBIqnCQ3znmu1TY8Pa4bDCu0lnW0vv4DDJWXGDRMy6AUEMvSthvUD8t7R?=
 =?us-ascii?Q?ns+C09P465bwHPLnQpK9pLP3IRzH5s0EgjDYpoLiXJDuVUgt4p1WQcXA/Pmy?=
 =?us-ascii?Q?R7NObDNuGSgyji3tNz5qvBHdO+BARAPtr3fttxw8qUtZw4aLMiQ9CkPrlFzS?=
 =?us-ascii?Q?fJKkHunGFsfdpoCu/DbT80r3CaOqz5RELviyvaztMu7+hVKwjjcGubo5/4pW?=
 =?us-ascii?Q?YPZxWofgmAMZxbSm9rccl9o8hlHhUlEM0XtvZdxl951F5vTmCPaJSgpuoGup?=
 =?us-ascii?Q?UuINazR+Yg7Kpt+9Z0BzXyhBmblTPElcEiwqzgFPFEvkGcYd/D4TGUrJem6G?=
 =?us-ascii?Q?0D9mxPWyOvQ4UXhcg9J6786JywqRNoFOICLDbgzIwjMPc1n+RtfC9PcBynw8?=
 =?us-ascii?Q?NIJFgg5Ea9hy6S5K3154v/ui/hMThlQWkehAYeU9u/JaH+EF5/iFPSmlcUYz?=
 =?us-ascii?Q?cPCQ03dLaHCZaPhbKZd2MyfHXkpTV8evCYyVMcvyj+kXah0rXfs/1MWaFrAh?=
 =?us-ascii?Q?i0JvY58ZGyMEfCoNvAHpCywnKH4tGEDT9AZQXkYvBxUTk85ZBI8t9uG9QzKX?=
 =?us-ascii?Q?bMvvgOCeOc04Y/jWvPf+2FsqsiBWSbuswmhYA/K+rvk5GLtiksoSo07wlnKO?=
 =?us-ascii?Q?na3hLxuRA2oZHatwwM2hX8o36hkA/xrHDMJmhehWdNj0PYYOJHhsV7ZorM9L?=
 =?us-ascii?Q?9K7LeHu//HM9OnrdisBxQIOambL+yjzehG5tRP70oHvDzRPAMwSO90mKVTB2?=
 =?us-ascii?Q?zRnuhbzZLnHbaAi6XNGXc8k2cmm7t5/rpggYeU/HrjLYuUGaI/uX8KT0uER3?=
 =?us-ascii?Q?OMbIeGKUSH/F0MDGwJVQlUVLrjhtseTnzH7wUwQhshGYPfhGPS1so7R7aXIB?=
 =?us-ascii?Q?kEdlc/nQ+r7ndZJm+1yRT5gEnFT81W7yVjObPr2HZGZlPql2BM2uZhKBIzSH?=
 =?us-ascii?Q?iNmOnJrGFabHWF7gcXa2fFEOimw1PM5XOBOqUVpvPkcF7ZlxWny5ZeKJEUtS?=
 =?us-ascii?Q?tl4xMkEi2jDdMwHoQCcG8eQ2YBJ0U1sM0VrXZFFXquo4xK7tbQakiR0qupnm?=
 =?us-ascii?Q?XHPx7idSTUvOKxXYNHPgVhaBfa1LOOqoxTFB1r51/LSkNqoryodN1+7yRNIP?=
 =?us-ascii?Q?av1tcKo6JpAewPxhhdNnrVZnJLaxo7Vs/ulSR3g4qfc/pCm+wo7CmONgGqZk?=
 =?us-ascii?Q?NH4RSfLDCQ7XzglPSRPM0ajlQgAHTW2iLG0KMclU4U5a3Uq2MGeRED39uQFf?=
 =?us-ascii?Q?fjeZC5Cca8gi/eamxO9WwwXnRoD1VQo1VQLajwpkCuzkZic0oqz6AMKh4U9v?=
 =?us-ascii?Q?bqj8m7bfMmeeT6/YNr0QvlztKWkU/YdSOqIorkMPiISbPJc+97+XMiQNXvdA?=
 =?us-ascii?Q?jgTJNprbsGc8uy3A5J8YTj0K+/RzXi3FPK+Dn3VxeSoIaJY6vxPIFq2FUGys?=
 =?us-ascii?Q?t0k/zJ6vmrX2NvA6GMV8mFt3GU+WvZegafNEjDFBpskAUz4Q1GQWcmYyFKUv?=
 =?us-ascii?Q?0czzQuiL9a3HYXFe/h1ulCa8AsC8VSjWlnHkMCAmPgoV5E8BAKRe?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ea535773-1122-4d67-d80b-08df4611f828
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB7280.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2026 07:51:50.4970
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qMSLKLb2wuEaJ31zT41UJl5AHJcMlfYSsb7iyWPKrwMfnZx8p6EcZ1hpl3nOenqIFCx43COaBDJ5uxLzObwbzXc1bJDSgiZrsdom+O+AsKZToBrbmIDkHbgqVcU0kEfu
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMBPR04MB644081

From: Jeff Chen <jeff.chen_1@oss.nxp.com>

On Wed, Nov 11, 2026 at 05:59:17 PM -0300, Paulneja wrote:
> nxpwifi_search_oui_in_ie() takes the pairwise cipher suite count from the
> RSN or WPA element of a beacon or probe response and compares that many
> 4-byte suite selectors against the wanted one. The count is not checked
> against the length of the element, and the beacon parser records the
> element on its ID alone (the RSN case in nxpwifi_update_bss_desc_with_ie()
> has no length check at all, the WPA one only requires the OUI and type).

Hi Paulneja,
The patch looks good to me.

The commit message is too long. Two short paragraphs are enough:
what the bug is, and how the patch fixes it.

> Assisted-by: LLM

checkpatch fails here. Please drop this line. If you want to keep
the note, you can put it below the "---" line.

> Signed-off-by: Paulneja <paulnejacontacto@gmail.com>
> ---

