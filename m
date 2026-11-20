Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.162.16
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795171474;
	b=AemEryCidq1eN5S6F1Q3+rbIy6GhZw9lTdaMBASGIynbn2NVBVZg+xSzHRvh38kUiuMv
	 ictv4HVULm6HehjYoGLxwNnTBU/xvddShpX26zzEeUk7QPXCMJgJetdzN9pQegbSCQ+ZY
	 fopV9+sbG74oxs8NgnRJqSzbpP/LaIwqwh2m5NejOn6i7VttivNTTd1yhNfAshjHegqBO
	 zVCkbKfoVU4MtYET4j0DbDkt7cXmVWyYqThgfY1iLYxMgkp8YYb2KSfFgYTLdgBtgkSRk
	 Yfcz1aMZHM1jemOkg0Li4eas/WjPz2XIJMVusE1BYwl6A7NxUKXgeK7jZlLQmX+LJLA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795171474;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:X-CLAM-Verdict:X-CLAM-Score:X-CLAM-Description:Received:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-EOPAttributedMessage:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=t/cJOtF5zbScuECBrYmxwbl4rj8yw8OSUnkcnO4Cg7s=;
	b=un0LJwNQYxwl3uO/BvIn23hNHbC2Sm/iRJw7lZdODbwcLwTODJC5ggM0DVAQERL9HZPW
	 3b+ikhe6z+nQd6tl3Y/O5fjzn8kdUYiYiLhb5/6fN5bYZQE0ujeEZXwePuCdU/Ltf51SW
	 w1QwD1M3upaW0Vl9O8oAvMRU7vnJED0YKP+ytbAVhHmAPsrXeqZck76hdivj9BEh111Ol
	 5DuC3lQ+yYIXfUGjk6VhotaUNBid9o+tds2/RVblgCWEy3Q1AbbYhvNY9UhT0UD2cZRZP
	 gEljMsVqPdP1hprwJchLYWbWbfuqgeC4ZbN0mlHdrluGuf+7V3PTBfFdUUoVXLjVyLg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=philips.com;
	spf=pass smtp.mailfrom=bbl.ms.philips.com;
	dkim=pass header.d=philips.com header.i=@philips.com header.a=rsa-sha256 header.s=selector1 header.b=zOYDi2YR;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.162.16
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013016.outbound.protection.outlook.com [40.107.162.16])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C25A3606A320
	for <linux-wireless@vger.kernel.org>; Fri, 20 Nov 2026 10:44:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C25A3606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=philips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bbl.ms.philips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=philips.com header.i=@philips.com header.a=rsa-sha256 header.s=selector1 header.b=zOYDi2YR
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nwH4NcyNmim5TqTL6IfEENhVarMlG9easuhqZYV+E3kQchhTtjwYPObU/x9h4o/AOI75BITQJwCTcTwC5yatR9kWS39PPvSXiHwehiTW//3MKfyOc0+uJBsf2SQzHQN0snBLOtpeMynocuy0Gu3krrgV5DgKfLyRy4MleXhqDRMESeDGG16OTzwegMqR1Wwm0pRNT6lpr88kzkd5l5f1ZFQPzvw2X+Nj2ekYLRzm6W26l+lyV3CekO/v6u5/qjdIM/g1Ps7S9dVdBtIldtuL2xTbB9nAaEDueiP4M0ypKORvUlcjgfbhE7gtFXvdkynXL8OQ2cCRpWhpWRjVrBEkDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t/cJOtF5zbScuECBrYmxwbl4rj8yw8OSUnkcnO4Cg7s=;
 b=IteEzUyJxc9ee11I4vD95fxu1Y9zcEwD4j1I440a6UepgTjYJHdI5DC0OZ129fHeDeueD/0Co5MMbb+peopKryTMEi8jQLVa8ujyo1rXL8RhXwfCKpg8mFhhn9nMkG0YDflkemEeH2BFNBkg1z7rG0J3bHsAJlWk5u5WFiEkwygWbyjQhp8hKmQi3SaQs/PMiM7Qgp3v7PJr3XirBxN0X/MsbHJ41fp44hZ/pglwhfFihEOla/EhmjT6WLbZbyNpc2ONc3YwCimuMA6mNc3u2RMTmYi+vKV2DSxdP1QqPzHApTEXvlMM5Nzq9YRf/BqUy5EIRtGTkFI3Rqw4BNOuXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 3.248.88.141) smtp.rcpttodomain=vger.kernel.org
 smtp.mailfrom=bbl.ms.philips.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=philips.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=philips.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t/cJOtF5zbScuECBrYmxwbl4rj8yw8OSUnkcnO4Cg7s=;
 b=zOYDi2YRJvnVH8umx2QU9Bx1FAClE6YchBDJV09ty2t1wahSzqdU7VnDbU+R7LdT6ERdQGA5YY4tNrWgulVM3HYkybdYgR6NHFIi0IHccwLMuisbR/rJB1EwVY6fzS79C1bO+DrOcLRwnHp7ZWmIMSYq+crytHoQUTcONDHF5AA=
Received: from AM9P195CA0012.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:21f::17)
 by AS8PR10MB6818.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:5b8::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.2; Fri, 20 Nov
 2026 10:44:28 +0000
Received: from AM7PEPF00000054.EURPRD83.prod.outlook.com
 (2603:10a6:20b:21f:cafe::39) by AM9P195CA0012.outlook.office365.com
 (2603:10a6:20b:21f::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.12 via Frontend Transport; Fri,
 20 Nov 2026 10:44:28 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 3.248.88.141) smtp.mailfrom=bbl.ms.philips.com; dkim=none (message not
 signed) header.d=none;dmarc=pass action=none header.from=philips.com;
Received-SPF: Pass (protection.outlook.com: domain of bbl.ms.philips.com
 designates 3.248.88.141 as permitted sender) receiver=protection.outlook.com;
 client-ip=3.248.88.141; helo=ext-eur1.smtp.philips.com; pr=C
Received: from ext-eur1.smtp.philips.com (3.248.88.141) by
 AM7PEPF00000054.mail.protection.outlook.com (10.167.242.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.662.0 via Frontend Transport; Fri, 20 Nov 2026 10:44:28 +0000
Received: from smtprelay-eur1.philips.com ([130.138.84.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 256/256 bits)
	(Client did not present a certificate)
	by ext-eur1.smtp.philips.com with ESMTPS
	id UBfHxpHWlf0UDUM6Wx0F6G; Fri, 20 Nov 2026 11:44:28 +0100
Received: from mail.bbl.ms.philips.com ([130.143.87.230])
	by smtprelay-eur1.philips.com with ESMTP
	id UM6VxTZ0gbtn9UM6VxpTYW; Fri, 20 Nov 2026 11:44:28 +0100
X-CLAM-Verdict: legit
X-CLAM-Score: ??
X-CLAM-Description: ??
Received: from bbl2xvg1.bbl.ms.philips.com (bbl2xvg1.bbl.ms.philips.com [130.143.220.100])
	by mail.bbl.ms.philips.com (Postfix) with ESMTP id B9ACE1803CB;
	Fri, 20 Nov 2026 11:44:27 +0100 (CET)
Received: by bbl2xvg1.bbl.ms.philips.com (Postfix, from userid 2884)
	id B6528FE023B; Fri, 20 Nov 2026 11:44:27 +0100 (CET)
From: Vishal Gupta <vishal.gupta_1@philips.com>
To: vishal.gupta_1@philips.com
Cc: jeff.johnson@oss.qualcomm.com,
	linux-wireless@vger.kernel.org,
	uwe.schnick@philips.com
Subject: Re: [PATCH v2] wifi: ath6kl: synchronize scan request completion
Date: Fri, 20 Nov 2026 11:44:26 +0100
Message-ID: <20261120104427.7514-1-vishal.gupta_1@philips.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261111143037.688461-1-vishal.gupta_1@philips.com>
References: <20261111143037.688461-1-vishal.gupta_1@philips.com>
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PEPF00000054:EE_|AS8PR10MB6818:EE_
X-MS-Office365-Filtering-Correlation-Id: 76ba5c0d-1f6d-4cde-cff5-08df46f34063
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|30052699003|82310400026|23010399003|1800799024|376014|36860700016|18002099003|22082099003|11063799006|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info:
	JXT5BFQ4MrYuo0uSeqNmxTfrFlAowBsOIjC5tSdPLhegneZykkqtFx1JnIhpJlcEhCpOdVkJvW6ry9bfPZo+H7buHy01E0HjAJoG2GxaOdPTn53u25pfc7qy7+mgL26a2zsL0MccbdUnEHq2z71lp2u2UqRuUF227cNlBn/l8XSYs75eQfB6KHqpf9sT372hQurLseYVxBu6MxAJRWi498hgTRQgWlW7CTgoGXtPLIoYGVlJFg31VYaA+k8zC8hJiuXPImUc8wsOxj2yRje+gxQKH8NPaW8ktl/S4RnzQOYHM3OA6cLSMyLPpOM8yveLDpYip7N38EkPUW0/d+5oDnfAoUy9W9YLNYjECGja7q5GOmuMuzfPhvbCL/ij9DtwVqSwViQT0bPjuJ56YgUWkyGnVkh8u2ZYEnijiC7x9/VNanhrYw3dVXikSGjgBJliSGkvvJfNawEq7VKwhmRtwxd0WFb9egrQhb2LWYp5ZVek767kYiMSaPHz9aiwep/dNB0Vy7x3hl6PCitP5qJe2Ey6y3HzFgGaqVgG7tv7cT5tUJ1DSKvMmVwcNFe7e8kGltIs6RSkvx7HdhzW1NH+nNKVMZo/MXMR8atc4a5M+mdO76G7zyM8i2NQVuLWO9VUVfKXxkH5sP28duCiFTD8L7W7XjSUQdJvodegpRIWI/p5aPQzTtQ7cpFS3DMHe20mNqLip8btwuHTKVOZ17WW1Q==
X-Forefront-Antispam-Report:
	CIP:3.248.88.141;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ext-eur1.smtp.philips.com;PTR:ext-eur1.smtp.philips.com;CAT:NONE;SFS:(13230040)(30052699003)(82310400026)(23010399003)(1800799024)(376014)(36860700016)(18002099003)(22082099003)(11063799006)(56012099006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	+wAMDbfaUaqPIfE89uBwkrnbY8CHcVrighZLCI2uqdsC1A54/JCn7w5HkZmY6gfhsluGu09+6dpfCbevwoIx63+FHd5FDOi35L317xKiZEhk1nKl6caCSVcpSxGd4cMslI0nji80pXipwGDioeHcaLYbOgUhcbZxygWOgG1TvWQ0L8AzSHSEwV8XbbkH2l7Vutt/05fT2D93GepYlnuwB53IlIIh4tqwRmuhPUTk9ayrHLaX31nd5h397dv31CI+L/S5f61GnpE/2iBKs6B3FgKz/ZCipBcPNsKWugiz2q/daKgoosG0bY0CZ5+oXJcBVtospo6kN8v2laRkxkO1wZTbiN2aB7bGP4MJD5pflg8s/bubgWOgiELunU751DjjvCPq8uwSUsP4g40xb0eZLFdyGqNTg/XtqiqMw/U6fet5tJoHoScLkdl1qiEaKiwy
X-OriginatorOrg: philips.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2026 10:44:28.0686
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 76ba5c0d-1f6d-4cde-cff5-08df46f34063
X-MS-Exchange-CrossTenant-Id: 1a407a2d-7675-4d17-8692-b3ac285306e4
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=1a407a2d-7675-4d17-8692-b3ac285306e4;Ip=[3.248.88.141];Helo=[ext-eur1.smtp.philips.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7PEPF00000054.EURPRD83.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR10MB6818

Hi,

Just checking whether you’ve had a chance to review this patch. I am happy to address any feedback.

Regards
Vishal Gupta
