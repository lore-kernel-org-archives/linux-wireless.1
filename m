Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.159.31
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794990052;
	b=istWodsJHPiMYcwXQ3DHoDewT0GGpJoj2uDyxaK2kYKb5bDVGbl9f+lxyVgiKNXp491J
	 2OozWRJguqXKPox/PjuTvdzpI+k0gPi0/5FC2ayZMBJwL7MEJHF+N5ilsJdnrdiYaHDUl
	 jeKO0DUjb1EgqfceUj+szToa2icvuC82gnafH45feyM1XMFKZqhFkQPObvOkxLb0JC3Du
	 3Sm8D3OALy5R0aPUkRpKR61RDPcwo6nLOFn0sO8rF6WJZERWYWcZTg9yXabDvsb0oz7+q
	 popnXYBPQ/EI36e2B/B1QLADzm6UUgol2SOp6BXav/YxT35zlUiBZ9L6A6fC+dSDSxQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794990052;
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
	bh=qpJxds9z137CoPxdV2QU9BHgWw4Oet5JIxYalQ1eWfg=;
	b=r55yaYjDV/a6ZeKk2vVlnKPco1ExLt3K5BkgnIR30VI6lRi7OoVZVrkHZaDkF8WDQMfh
	 4ie0JeTq/cQ6VCdAigWnFlE6iO5bf6WZF+yX/eq6ZdeAMuR7GTTPM+lAOiGcHt02mbP22
	 k4BMbGOV1SXFMK1FOGiLFz4kCPYMMFn9EXIvfCzCbZpnVwX8yIRA29ped2jRVe0pkG8C9
	 0PlhiUnXWHL3rCz8Jje0AdObprHCYnv4b0p3DMfhXBFHc8zIG0249ZbXg2nlHT9s0LaNZ
	 tiRTABdZbBviMhg8X3Fe315+uPCH5KtFhUl7pnjwt3UaW0AZWZSJzu5v7sMMAFDJS3w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=APX4Subq;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.159.31
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013031.outbound.protection.outlook.com [40.107.159.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B50E606A31C
	for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 08:20:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7B50E606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=APX4Subq
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oeE86NXhtt419G+RktTCnAwQ5G3FSkgLoR4s/hQUgGw8vMzW4YuNVL+PW5RlgBeSMybCWJ61QKKI+J+z8l6r4KDgNhPPcelyv6XlPBvEFBSBkr7jJgpFgl4ZSryTpx4yksXO4FNVmnXPy3bDooDeziEfFQrkvsms3yAsej8P5Thm4FtrpBPAHV5vPgBEp4z127C941gxdXt61ThlXRInWTAU8dpAno72CBrcTXR5D6prnPCM4QFM1j7K9WLnyI0wspeKyUntzRCHmYvFilB6eKMu6EPgq+7cU65Fl8bR6jAq/rMmSC5gbjiFZuErslsBQFv835MaGmKXrU+nUmBkfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qpJxds9z137CoPxdV2QU9BHgWw4Oet5JIxYalQ1eWfg=;
 b=W3Ea69DJ2VALfWVmFnemTKNWJ0YdaINLNy6HhaWz7/G16gB1r/8dRMIFVb0q57yCL2haxxxpGK6va7LmrT5dAHjzzXr7B3iDfXGt187hcnzhDdU+M+eczQBnu11q15I/YfTSfzL0Ft77c8dTWxltpfZmt4soN+zsktwdoq6wdumh9Rte2xwdVndMNLQCFt+Y4KOwuiYjQSkAEam3nq90OuHLHFHLq5DUmE3fDHyTnvFJuHMdbx2TgOubWeo/s+VbYcCjgR45WhN4N/li5HfyJmu3+D44pNd/H4SS8JLRXUWLfaSSmDn1Yqmfo6iwFnTveVQXajNbkr6slZP2kh6XnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qpJxds9z137CoPxdV2QU9BHgWw4Oet5JIxYalQ1eWfg=;
 b=APX4SubqlCU8pk89N8zO/0lYP1Bflx12RMK4EOX8lhEYibqRUEvN7vXeTg/RgbhyWo/cVEuQs3uik7oWWtk/Lrse9xTCEHDgNfAzKXI77ck5Nmw0dpS60YVdzXuvAaAt+tLmd/Qo7O/9uFRFbRMbUUp5VaNRXDdzdF9STM5CFYCet6VHcrxX407xQL1oX0cAQFxjfmhYJErK7xNuZ1BD2bQ5aWcthGtutgKTvvlQNifi1lFw21Pd4wtD/+xGc2YgtzttYt9OfgbCeUkYEU+0YdaeOhpzlgwx/vPKN0HQfdBw2RSIj1pEClFVE1Vlvhi+Nerxe3Xhki4PmCC7I0Y2rQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from VE1PR04MB7280.eurprd04.prod.outlook.com (2603:10a6:800:1af::22)
 by MIWPR04MB225290.eurprd04.prod.outlook.com (2603:10a6:290:90::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Wed, 18 Nov
 2026 08:20:48 +0000
Received: from VE1PR04MB7280.eurprd04.prod.outlook.com
 ([fe80::92fd:f75a:a302:f859]) by VE1PR04MB7280.eurprd04.prod.outlook.com
 ([fe80::92fd:f75a:a302:f859%4]) with mapi id 15.21.0615.013; Wed, 18 Nov 2026
 08:20:48 +0000
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
Subject: Re: [PATCH 0/4] wifi: nxpwifi: fix AP channel-switch lifetime and failures
Date: Wed, 18 Nov 2026 16:19:50 +0800
Message-Id: <20261118081950.512530-1-jeff.chen_1@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261028141819.7556-1-enderaoelyther@gmail.com>
References: <20261028141819.7556-1-enderaoelyther@gmail.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: JH0PR03CA0027.apcprd03.prod.outlook.com
 (2603:1096:990:74::10) To VE1PR04MB7280.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: VE1PR04MB7280:EE_|MIWPR04MB225290:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a2bf5af-ad59-4723-3379-08df454cd9d0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|19092799006|23010399003|18002099003|3023799007|22082099003|261022105027099003|261102123227099003|261028144727099003|261026140227099003|261021123027099003|261021121427099003|56012099006|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info:
	lrUZxg3GwX1Uh7fexPwn4iNkH0iMqnb4bAUiVmc5aiAqhUX7Dc0qlPF+ao10v7DInndklffXmDRkxdFcId5kRc2+UnXPhf+F4o1wDnAQz/MJxwI3LxtcdjizaA60oJ5POGGDGZVHC8GUCwUk6m/Rbi9O/PmlmMJ5uPNAQmqOcXtA7xp5n2ZFn/VFyIoOd4HrvaC5lObPdPYYqCRr876HszTUstDiKpcNa5tNACJ2GvGixi0TPS7P9BsPTseA0FfIZIU+16J80gpJOdiv1k0idSQULU6Qa0TScdpdFfdvy++xhUMulLWd8fOK1mbqylVz0r0dlVUtZ/sLNCALDhEcwjWTjAysHLmfgAoI6+DDMaMn/pbP6CDAd1ppIN7HQXYbBmVlpPfFtYX5Zq12aECp8uaF0zb20qvshpWVtSaWdvMdUCN0P9UNEuOS4yUJa3jloh1Wwzf42sA6lDqZ66GB4hS+3/LXlJh8LLbVEpz6RiyUw3t/lldHAHmuiuKKQ/QSMQSFph78LWwLXGwZJK/XBpy2LGUq/Cb6t2xb0Rnyi+Z7qe68ZcQv205darf6xg8Aox4OyQPrtY2UoMskAXXk0K9MCpqGKz2YkJdgJS91aljwe++16fYazp9OoFjOGN07h9lyBpquY4+5XpQbHas81z1XhfueoQpLL6tXEE/rSo4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB7280.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(19092799006)(23010399003)(18002099003)(3023799007)(22082099003)(261022105027099003)(261102123227099003)(261028144727099003)(261026140227099003)(261021123027099003)(261021121427099003)(56012099006)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?9F4oAg06wsuaaD/pLYURNkiHTT+CmI3IB5IpDhSPwTCYBq+OHVXgWtNgniS6?=
 =?us-ascii?Q?NhlKdD/OwG6754P9RXazPOsagXYX4pETMa/HrfSlTMPs7VHkpSabiwU6PbZv?=
 =?us-ascii?Q?9MGhkNhjZHTPOfckex1EX5AXJlVeKTqhbJsYSGJP37u+7ClizS8YAHG4iz16?=
 =?us-ascii?Q?BRe30zRQ5r54WarYN73fkQC7DjU8W9fFQuUsY4H5ztxVU5akGWyEb2kWh5KH?=
 =?us-ascii?Q?XFsLngXaZGbMjvAerk/GUP6XUDPAdaHn3Q9I96zWunqOpoCiERYja8ab35yO?=
 =?us-ascii?Q?PuxxzjJT/8F4lQK0rR3Jrc7dvJx45JkoV8jN07Y2X+iuVYPibK1ZPqFCzJWn?=
 =?us-ascii?Q?EP+aEsKzadpODqMTGqxRYuj07VAsONnMLcfarr6DzB1Kx17wXRj7S33JShBp?=
 =?us-ascii?Q?Q14ulDYB2pDLthxE1WCJG6QClur1Q4PypM7Rid450ud+QIb6fAEUr+5veuGR?=
 =?us-ascii?Q?NzgRMJz2JpOf9IVM2BqXnoF4vYTHSwIer+H5AWZUCSGkZtUbQ7+kVxHTsufH?=
 =?us-ascii?Q?XTzuq2+usA1ErLxik6y/fDoRgkvGUI5h0I2+nekXvz9CAvmQfUDMz0t6A7+n?=
 =?us-ascii?Q?D2iLMpfPH+PCHq75p1PH7kxLEvmkLJHAhDPbxx6vZUbnUWNcC8MrJ8mSEiHh?=
 =?us-ascii?Q?qaNc5DMP9oZmZpR6LiDRPh13ZpcM+FufDAyKrGWCIr/DzWPi8Y4frqVGXiX5?=
 =?us-ascii?Q?2FVtYkEYaq5vHTDuCPkH1/tPGR10NLvSnTSp+/jFLf/yfGJnUmaKBgJz+KZY?=
 =?us-ascii?Q?TrIs2sAN1871JtOHv1BuY5vyfqMow/jv7rhOazlunvzNPCCUx6F9E6CVCwxV?=
 =?us-ascii?Q?Fd8sMugbO6Okhljv5Dk7XUIzEtsxSAj02v16+W5d7PMCh1b85VdqSLXGK7NF?=
 =?us-ascii?Q?vIoUr7A/j4herkV1TDbjrrarkTwAGMCOl1IXEI+79OIt8I85G2IyI990q1aR?=
 =?us-ascii?Q?eXX1v2pvlV/s8var5nI1QzjGyvUuUqEx3xEsLYihi2DP9AEQT3hPq/fZOykD?=
 =?us-ascii?Q?qDFaoZLUpY47fdE68bupJSK2m3l3shRfGWesC7C37+rn15PL4W62p0QdKCAZ?=
 =?us-ascii?Q?zKFIuJDM2IPxfRB9Tf95BF0jYaW2yhzwhEIx9g3b4cTYCGobsc9Q7aeQdgab?=
 =?us-ascii?Q?ICsWjEksQxOv2E/31xIKoTkYTr9fNU/rPLXHoor/Z/W9KKOg3Pw2WNDV04ZD?=
 =?us-ascii?Q?195g1JI1UlFBo1Elzcv9elM0zm8UPHgskqmeTSXFTnR4FEfWba/4HuXUKH5A?=
 =?us-ascii?Q?hWRhnKZ1kZ5nmBvV7vI6jQXXBH8UDcKKq8OEwZ+jebrIPAuTwS8nK3oXxXaT?=
 =?us-ascii?Q?v6GVM8l7DODjSPEDAXT9/DUO4fGbrcJjvhMNQPRq45UGzfXQcipb9nF0LslS?=
 =?us-ascii?Q?PmsBzpkgqnv7Wnbci0FGM3pnHjKFjykxP3R88OmVG2yOBop+uWG0tMJ5CcqF?=
 =?us-ascii?Q?iVJH1tvOAbRrkQdTibDdCJukxxF7BMkKgHM4d0r0ERombqFvIMS77FyIwWqy?=
 =?us-ascii?Q?T1kh1FuQ+p3D4IUNqZrNn3/bcbW07X2dq6p04yDk5OUxfzLi41hv0Q0xXsEF?=
 =?us-ascii?Q?F6gCVVLdPf8WnOLzvZmqbVwEDM8Ujy36rDxUAsyzYua8GmnYUKHy1LoT3ON3?=
 =?us-ascii?Q?FcdDsxgDNH5n/Y2CaZ4ruM0MeBvaIsAiLGsaVFIubrDkruXF/udRazyln9Yf?=
 =?us-ascii?Q?pE5BfMZzYrwo0xRfQn3akp65rbH0lSYdCNaghUNKJYpZa7hBUz478zxfR3CK?=
 =?us-ascii?Q?b4c2sOqctN/PXdDjcW1rpW8KtcUpYDCUY2xEFzy+A6YuaALfB0jr?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a2bf5af-ad59-4723-3379-08df454cd9d0
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB7280.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2026 08:20:48.6029
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pGe2QD4xyTUr9LrI9LUlz+BGslWNAzdXnaE9QIk+0RzuBzS/FOvHYqw947hV+AfdESV+r5QTGwUBWemqwbW9QZbbdR8lInz7wR54si3Znms44q2u6pcr5PQZHOWD5D8g
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MIWPR04MB225290

From: Jeff Chen <jeff.chen_1@oss.nxp.com>

On Wed, Oct 28, 2026 at 10:18:15 PM +0800, Zhao Li wrote:
> NXPWIFI retains request-owned beacon buffers for delayed AP channel-switch
> work. Once the nl80211 request is released, the IE parser can read freed
> memory and copy stale bytes into management-IE commands sent to firmware.

Hi Zhao,

Thanks for the series.

Patches 1, 2 and 4 look good to me. However, patch 3 still needs to
be updated based on the review comments.

While respinning the series, please also simplify the commit messages.
Several of them are unnecessarily verbose and would be easier to review
if they focused on the specific bug and the corresponding fix.

Please resend the updated series.

Thanks,
Jeff

