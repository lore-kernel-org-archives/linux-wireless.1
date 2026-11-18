Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.84.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794987738;
	b=2hVW6be44Npol0vNlzkvA/UHXhRytdCPXGgTHYFwsyfXDryHQtkDdvA0BVu/qubCf0Hi
	 HgpTDigoXkxjyCuSKqOLknNq856QhcnteE86TazLMKpZ7PCqYXXvDTWS8fXnKfRbif+UE
	 CPhWoq2aZD7Cr6nJw9+hgAbvbDWIka0IeTHskHkkYC/1qdCbB0R+olF3WFq7LP1LPuWex
	 SpiSBq1nS+4Iil3RrxqTE5iO4uJH+wGI2ZI5tCIxSH+eOrWjakrG9OC607jGGnKQ8UXYn
	 YKPLofGHwl7RMKIDiaVx7hWvGj+jgBxnewhHOc2D3wkMivGcZiXIPdFdFOsFLOZvDJA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794987738;
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
	bh=fMAYEhOtfQZoMo0oA1bxmtYSCE9eEiLiKPIPJbgX96w=;
	b=qakN1s1s/5JgS9Gg0iNhfSvTMRIxDcRhH3eWrWInppAi3vXy7yGMV/zCbd6MDyHjTnPl
	 qjXEkHhVy9jYx949tmljsBCDZIk9HfSJ1OYW6+ypKlxfy52Rjn68uOnYwNGXjVVEmseZE
	 ZgMdyPTsKQbktalR1OG+y0kI2BYZQxC8dEtB81Jf42IR79D8MJQngEQNBM7vSHxlCZ2KD
	 OwRRY6wG0XrKG1B7IGeqeJs07Zk2qsJszyWjv/YquCHatsecyG5eNYpw6zLN7DmYgZdId
	 1nCW1nsi4Sln0l++mO2Dvuxixv6fd6pxao09PCgtHmg3Q82clO3dLnmnNo3DC6DhHNg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=faydpDcM;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.84.50
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010050.outbound.protection.outlook.com [52.101.84.50])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AD4E606A32A
	for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 07:42:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8AD4E606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=faydpDcM
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YSrp8eNCt3MsLz4s3jsSfFwEQMJSst0VF/23FZvfB05BXuTzJAbuigdWXhoVdltV9cjL0g9eu6ipWjNuwHS+tQWr3raFewb45KxkfGExTox1pJZxcejtnmFFVMPw6cIyNaUPktJEgfaWf41fTL0pf2KyHzo9VYx0pkciVULGeTVdvTQ1Jzf938XY0a1euPHmdlXyDMN5NcmMlQR9+7MLmn8BsN2OtZugxSGt1PUsJ4YRU1/Wu6Jkbidu4zXytQSFAAPJNN0X6u6iYRDX/L0AynvNMBIAsBCHe8ZwCZ0yHAWq+FDiNcvEV1zWaU//S5r12yGukZNzpwyYQpb4DatQDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fMAYEhOtfQZoMo0oA1bxmtYSCE9eEiLiKPIPJbgX96w=;
 b=qBZRvUkHULuGnWUfbNyIalcKOVvNhRyPUyI7fQIBbDAFu6Braz1t0LwU3ADvT3e38sZZzH7ub0Na9qW4S9uXGO+ttSzaIZqZNbAbV6to937wjK8BLVQbbrDg2U5adImvkZlz43F7Fh/XZ1C6dU/Odn3iiLttCMa53MCPPU2iISPK4EutOLwunjX+HlzTxeUOoIxEl8TujtI+M8iL5W80c0LfmKafQ8DSmpWeUFu2vhjQRzSzi5bBYYLDJ3gcOwFq0Lj4578pxWGRN17GcouniNE3yrHPySu9VNcZnW11nthU6VW5ovm+jIAQCWA9P1Wr6Da2aahz427I0vY4BBM5gQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fMAYEhOtfQZoMo0oA1bxmtYSCE9eEiLiKPIPJbgX96w=;
 b=faydpDcM4iDCv7sNJE6EpGYv85On4wPU0DjxSAyMwY1cMFVeqnKxp4XnyOzI53zlPUPE5jw+pXOUYZjZI4CFQiySPTvk3VTRqaI8Y5EHEa5OTVq3aupEVMPSp+SXS3akNqvXuPLCBhjHI3ntEFryiSs4agUcYLbwP0yJW5q1dXqqkat6p8NOMJr2j7kXALfHDAeSvhAkLcdBbpQHauPrhkjSjScQASuWHUa0gk4Wmb0kscSZSzA8LAur21jJH+pxRYpwMNQ5yMz2yFFZgRwRpuzJCJG6N4B4a8NZNIuO6BNtyJG0IdlmxKMbxHh05wKEPuzlO9X30cIfzlUEos/vjw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from VE1PR04MB7280.eurprd04.prod.outlook.com (2603:10a6:800:1af::22)
 by AS1PR04MB9583.eurprd04.prod.outlook.com (2603:10a6:20b:472::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Wed, 18 Nov
 2026 07:42:14 +0000
Received: from VE1PR04MB7280.eurprd04.prod.outlook.com
 ([fe80::92fd:f75a:a302:f859]) by VE1PR04MB7280.eurprd04.prod.outlook.com
 ([fe80::92fd:f75a:a302:f859%4]) with mapi id 15.21.0615.013; Wed, 18 Nov 2026
 07:42:13 +0000
From: jeff.chen_1@oss.nxp.com
To: Zhao Li <enderaoelyther@gmail.com>
Cc: Jeff Chen <jeff.chen_1@oss.nxp.com>,
	Jeff Chen <jeff.chen_1@nxp.com>,
	Francesco Dolcini <francesco@dolcini.it>,
	Johannes Berg <johannes@sipsolutions.net>,
	Arend van Spriel <arend.vanspriel@broadcom.com>,
	Jiangshan Yi <yijiangshan@kylinos.cn>,
	Linmao Li <lilinmao@kylinos.cn>,
	Kees Cook <kees+treewide@kernel.org>,
	Rosen Penev <rosenp@gmail.com>,
	linux-wireless@vger.kernel.org
Subject: Re: [PATCH 2/4] wifi: nxpwifi: stop AP TX after preparing channel switch
Date: Wed, 18 Nov 2026 15:41:04 +0800
Message-Id: <20261118074104.510351-1-jeff.chen_1@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261028141819.7556-3-enderaoelyther@gmail.com>
References: <20261028141819.7556-1-enderaoelyther@gmail.com> <20261028141819.7556-3-enderaoelyther@gmail.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0004.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::12) To VE1PR04MB7280.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: VE1PR04MB7280:EE_|AS1PR04MB9583:EE_
X-MS-Office365-Filtering-Correlation-Id: c08f9e07-fe96-4082-8075-08df454775fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|23010399003|1800799024|366016|376014|261026140227099003|261026121527099003|261028144727099003|261021123027099003|261022105027099003|261102123227099003|4143699003|11063799006|56012099006|261021121427099003|10067099003|18002099003|261009223027099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	12YykYqCYLR3J5hHHEJ19W9Ivxi7knV2cjHg3a2JWuxo4yIJZQrPU/bEeJt8o6eItdaD2S2kPSZ1c+3YuPnT2MuEfy/PtYbkP9w+lkHs/uTtCRpTprL6Dkkto6lac6xJeLOoPG113RQSBC/kKlELPbjdrkGgzpdj50QmxUK/HrwA1Xs9Ss9T8UA0waPQMEA+fGVdbLTH///+92JTtIY1Vc3DCaF/HY5R3gtrtftTQHA3FfLtLbU2XDhGJOO3sTo/7bL0a8B2caLGjPR1gcubEwixnDcUiA8NLYKS2bMebFn5Mjf+yWMWE7u6QkK96CWkZRlU8iBjXUxCGSmViZBJYje4GX3REYn0+/OyGmx2hpmEyGH+sU1EQ25NIFNTipN0iGjqZgpIOp5wJA1b3oV0cMc8RvyrqkEMKHQ9Mrn9ZVwDda+N6mNGZHd/laBwyDLHCc7gdoXiKSsZVCKyN0vuWwtHIIL8hpfWXBkrvVDytXqjLt6m70WHuiH9SuR4gaNJ0lW1c6KD+L8xtnN+8tMSB4DQjlB/Duwz83bxcnBHqXuuVdvQ9kuJV+fy4g3F4ylTd9NW0YuQS9SNuaksXpLJOfOz6ahGImDiBoNkVE0FKphK98O3+E5uz/ZXzJ7IAwRdygrV0O+WdRb5Yg+bZlymFCZa/2Gz+0I9KWqzb37++rQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB7280.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(23010399003)(1800799024)(366016)(376014)(261026140227099003)(261026121527099003)(261028144727099003)(261021123027099003)(261022105027099003)(261102123227099003)(4143699003)(11063799006)(56012099006)(261021121427099003)(10067099003)(18002099003)(261009223027099003)(22082099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?nL8W1vhgQpHbOa87E4e4Pcp/a0DhFh7t0RhOabsbL02wgCfF9xLPxbCxeJjH?=
 =?us-ascii?Q?AHhREiNE1qfoz5hOH/2DU/ZNPvL0Etu0YinOQHybtuSbnNeWakzah5pS0M6X?=
 =?us-ascii?Q?n+ge405sw7h177fy6tCt4vcDTNkqDsAsaNCzKdKDaz4mUBL6mO38l8kriqLC?=
 =?us-ascii?Q?0FsHcY28Y9yESnVKSaH+OUEGxJyP6JS5LXWiY7op5tX3enuY67x0OQM2In+c?=
 =?us-ascii?Q?rvMu8Nf+gK4lAyGsETrJV58eUj2EnaXoKQDatMQSPb9PkiNloDazFAAer6DC?=
 =?us-ascii?Q?+M3Ci7EIAe09UwM0NLyk7ehtzKQ8tAs1hg0hOX/zR5lvAG/0lQ66vTolj4Mc?=
 =?us-ascii?Q?w5ZaTfUjfgddOpQX6wvY8jVefXe3EHm3UCxV0/V0UlFZoaLPTGVWcJli9ZEb?=
 =?us-ascii?Q?Q4boFAaTMKz+Tkok0y0+/SHkTIsTEhApNgNflrdj6ChqBaJ0GB/nWC8rM2+B?=
 =?us-ascii?Q?kvWgJrGFtPBulxNrTba7GhsGEGpZ1z4ETSQb3608VgxOzYshIogtgbbWYV29?=
 =?us-ascii?Q?6AArlZcG6AO646jJTPlkSeaPk+MRnDt9FcHAelY8NDk3/u8bBG32bN3ESvJ0?=
 =?us-ascii?Q?qJg5CWR/4tFUmE2jhrHT14k05QJ+ZmB8l/usfdyGxQV17ZBlnX39CjFYt9ie?=
 =?us-ascii?Q?5wKWhgNpSVAA3QnB0o8Mcb6hOf7XBIMm/vzJoOnVvYQo50aUQXTxV51U9eHC?=
 =?us-ascii?Q?PQ9qDHK6TQpZkELIDRP6RnxjPu5E7TrDZ/pJQHgWWCiYT7oxQRi711vFgiA5?=
 =?us-ascii?Q?N02ShAplApk5E6xzPCKyOgxO/fBtaX4RkVr0nl+ISjfX4gqZ/W8mjAnsqgUL?=
 =?us-ascii?Q?2XWOAYQXbnUoALOI9Z49b9Ib+c8nJHaaewrD5SIw9fbguNScwnQ6x9FMAbem?=
 =?us-ascii?Q?m/64qvgT9jaJxV/jsL7lSeyzgi4ypX+CptevxewSulvxeQyqFGs2dekCtFu+?=
 =?us-ascii?Q?USwwz2VutKwUOw3E+/N3EvpNB6apeR+p/18AIiwJzrlS2pxi6pIJfMvVR8a1?=
 =?us-ascii?Q?zROnGdeimHjppSPJRZARJcs2yGXUut5xmGuH6V8y/hTTMKPI0IQBZv4hgVLS?=
 =?us-ascii?Q?BztutzEQGnMVP6hV/JMSlaPNvUB/ERusPrFlQEorqUfebjG/Xwe1zK1UKzK4?=
 =?us-ascii?Q?KvrGD+c1AYb43RePI/DeU5CSZD3F6Pt+HMgGTQKwWsi2hgunKySCCPXlZg6m?=
 =?us-ascii?Q?Ab8hfY4tZzYSqfagbqauHDTnnv1BsPfFSYTcVvNXRsB4po2XBzJbQrVIVhlQ?=
 =?us-ascii?Q?x4EFkBzMgTN+oRbKTXU8bYPLty3OnQgPE4ZoSnj2c5hw2FrwrVEfmxYBVcwS?=
 =?us-ascii?Q?CO72JBblYF8FbDeUnB/22Xy1du/Jamswq/UaBx93WjtP165USOFOCx89CgBb?=
 =?us-ascii?Q?9PjKfg6indG0bERIqGDQ3KWl7Bo5jOxAQzX3sOfVdJklCN1akJssGN4NSn4U?=
 =?us-ascii?Q?DAsvNtaV2HDm15anofyh5ejncWa3gS5/oXqEUOzXHiWOGO02Pb5VhrU2jiPc?=
 =?us-ascii?Q?GQ8CF+eVBCfy4JI/oisnnegr1Xbus09X0tLoFNsaRXg1tQSkO/Mv8DIKqv8F?=
 =?us-ascii?Q?EymP/V6XFfmU+d5BXlSvywhfrKDztTkRKyoagYQKnamEamFeDdNb6V8TvZ2D?=
 =?us-ascii?Q?LXP7mxbKr4Br/RRt0rPqfZhCmi8dfFDPlQ77KRkEwJhol2Mc9eWFWf/7nxEq?=
 =?us-ascii?Q?5c4IL+HBcg3e1I0uy3fG2olSbkmfh8Yx2tJbI8y5Zj2vc18ZpQuAyGipfm+5?=
 =?us-ascii?Q?UcwixreujJ7bi9A/qB+bShvZlGoZNTxsoUygSNZfvNJGbKgeYhWJ?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c08f9e07-fe96-4082-8075-08df454775fd
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB7280.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2026 07:42:13.7306
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N3FXG7FraAuzYcY6LSN84i704XwCUhSGBJ+C94ObN4tmUkMgDWVKe37fy7WiVg5/HM+t3S7/8EGJqY7HUJS7qTHSxAChdD+IwT7va2x3KZWg9tKFgwZWmm613L8xyyXb
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9583

From: Jeff Chen <jeff.chen_1@oss.nxp.com>

On Wed, Oct 28, 2026 at 10:18:17 PM +0800, Zhao Li wrote:
> -	nxpwifi_queue_delayed_wiphy_work(priv->adapter,
> -					 &priv->dfs_chan_sw_work,
> -					 msecs_to_jiffies(chsw_msec));
> +	wiphy_delayed_work_queue(wiphy, &priv->dfs_chan_sw_work,
> +				 msecs_to_jiffies(chsw_msec));

Hi Zhao,

Thanks for the patch.

I don't think the switch from
nxpwifi_queue_delayed_wiphy_work() to wiphy_delayed_work_queue() is
related to the issue being fixed here.

The wrapper only drops work when SURPRISE_REMOVED, IS_CMD_TIMEDOUT, or
IS_SUSPENDED is set. In those states, the preceding management IE
commands already fail, so channel_switch() exits before reaching the
queue call.

Also, nxpwifi_dfs_chan_sw_work() itself sends several FW commands. Even
if the work is queued, those commands cannot succeed while these flags
are set, so bypassing the wrapper does not appear to improve the
situation.

Thanks,
Jeff

