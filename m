Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.83.13
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795171659;
	b=M/JIzR6xY8gQiEoilFAkHSH5jOAsuP6JGVqEb4g7SK8f2TxC8r2SKNM968+jSAZ7c196
	 SshTTB20y9KkaT7rZV721L/AjVzcQG81FD4O5qlH2sv9ZDL839yG4cuUMKTnErvOCkS3q
	 Ng3B6f+qTuO6itPohxTKgauJGW1q/vSIiucWG5JWgfyLYmSqruSI/Sv+LIEBCJ6syRZxQ
	 Ct1o2fOu01jHp7ABj24ncfRGDrtYfLXgvG3LhZIKcjc4mHIztR6dcru9v/IRv2cz0pxSx
	 ezMQKNq3YwONmV7MCGhWexx27VOCXK4ekBHt1xIzy5OP0vguWkG/bSvIbefU22gqa8A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795171659;
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
	b=NqnsAnNXVzoZnfWzLPEPflOASsMkKSyaMqBXmyOpNAObpdWp86YNmLoOWD7fY9kuq1e8
	 wHk597DObfObIYqD7ENQNT3nh3tSR1UM1uTxDW0tlTsKoeBg3HPblOKN3Yp1iLeiz5saT
	 m2jZgdwvEYVUDy3LThR17i9zHtZCG6xJxgqaTODuv23SzxLGGQ4QyQtpxdqBjxgFOHqL3
	 p8URyssxpD84NUWaNUnKBEM+/coyFcwFThtvptUpLzV5P8mgm3t4OrQxwvSDJaaCy6WBw
	 WpJt7T0F+CLaic1eGRJwXEOt8TVnkJhzos+IylRQHrKufaHbp1QkURz79dUtVevJcDQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=philips.com;
	spf=pass smtp.mailfrom=bbl.ms.philips.com;
	dkim=pass header.d=philips.com header.i=@philips.com header.a=rsa-sha256 header.s=selector1 header.b=IyrgHvfK;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.83.13
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013013.outbound.protection.outlook.com [52.101.83.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19F03606A32C
	for <linux-wireless@vger.kernel.org>; Fri, 20 Nov 2026 10:47:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 19F03606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=philips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bbl.ms.philips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=philips.com header.i=@philips.com header.a=rsa-sha256 header.s=selector1 header.b=IyrgHvfK
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZBHWlk7JHiQim4Yx+lwzD45X+szoI6igBxZqatqzeZFCu5UAWT/OorL/8mPbcQW1RkjRf66K2WKCBaaDFQQOVmrwCwr0cvEHGrDq0Zy26YZdGvnnD1k/uOFYCRKuOEIpR+kCyVoLqHVtXf+PtIMqbQrMAxK0A3VUmIjrNmG0BTm3tqy+E2KMtsJKZNa46sKJtsrIhr7jyd8qibkH5H/ALt0FniCERaKH+xmt4wQN7QCDhC1KcdCW+jzbfhPr1kmV5P5t+O6Yzkv7V+2JuI6DjpB799pHrcSwilhgLYHE81M7FJHrWyYEVO9Ym/pz0O0TUQq8e5ysIFepkw9Q9k2QkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t/cJOtF5zbScuECBrYmxwbl4rj8yw8OSUnkcnO4Cg7s=;
 b=pNUC+aK4n0NSv8RS3AyKtXk8BNMEjiCFelp3yWcd6khO7nZhiC3rOBFEKyyJIABw+JDWZf1Yh8PjdxA1OPEHKB+hhQoFXV94MyEsk7m19sd1fSYw6Re4LsPp0v4C1LCtwiv+LVgLPRX00aqZJ8BWCLF7UHDUzBIKp/8G1fW88vdW3G9mM+CNlyCrTP9Pq7cLkxZ85t8dk7baRlTJ9MToRtTJnspsmDbwd5i1ma+FNNk4ddthOz0CZ0hWKGIzea5Gcwavur99zadTK9K0uNcTL1CZXAiu+qqgmGHHPoeju64hKZ5Ul+BxIe8dixp8San1VpYR71tnTCkcDF4wg7G3HQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 3.248.88.141) smtp.rcpttodomain=vger.kernel.org
 smtp.mailfrom=bbl.ms.philips.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=philips.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=philips.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t/cJOtF5zbScuECBrYmxwbl4rj8yw8OSUnkcnO4Cg7s=;
 b=IyrgHvfKhlKhWYGZLdaSDYPFxWy8eegNgI3ufQKgzvn15bXfsiRy+mvrbwyNuHtA1MSrQK1MNjpAjjemFre8c+f5bSkxYXHq2L4QMyaRtZvkcaOBVPtaro9nideEw6xNBNtxrvUm59h5lgX2hoeUvgmKLWXrMFq74X/KrGo3030=
Received: from AS8PR04CA0029.eurprd04.prod.outlook.com (2603:10a6:20b:310::34)
 by BR2PR10MB992188.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:2c8:1d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.2; Fri, 20 Nov
 2026 10:47:36 +0000
Received: from ZR1PEPF0000E460.eurprd04.prod.outlook.com
 (2603:10a6:20b:310:cafe::15) by AS8PR04CA0029.outlook.office365.com
 (2603:10a6:20b:310::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.12 via Frontend Transport; Fri,
 20 Nov 2026 10:47:35 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 3.248.88.141) smtp.mailfrom=bbl.ms.philips.com; dkim=none (message not
 signed) header.d=none;dmarc=pass action=none header.from=philips.com;
Received-SPF: Pass (protection.outlook.com: domain of bbl.ms.philips.com
 designates 3.248.88.141 as permitted sender) receiver=protection.outlook.com;
 client-ip=3.248.88.141; helo=ext-eur1.smtp.philips.com; pr=C
Received: from ext-eur1.smtp.philips.com (3.248.88.141) by
 ZR1PEPF0000E460.mail.protection.outlook.com (10.167.241.58) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.5 via Frontend Transport; Fri, 20 Nov 2026 10:47:35 +0000
Received: from smtprelay-eur1.philips.com ([130.138.84.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 256/256 bits)
	(Client did not present a certificate)
	by ext-eur1.smtp.philips.com with ESMTPS
	id UBfHxpHWof0UDUM9Xx0Fmy; Fri, 20 Nov 2026 11:47:35 +0100
Received: from mail.bbl.ms.philips.com ([130.143.87.230])
	by smtprelay-eur1.philips.com with ESMTP
	id UM9WxTZ7kbtn9UM9WxpUBY; Fri, 20 Nov 2026 11:47:35 +0100
X-CLAM-Verdict: legit
X-CLAM-Score: ??
X-CLAM-Description: ??
Received: from bbl2xvg1.bbl.ms.philips.com (bbl2xvg1.bbl.ms.philips.com [130.143.220.100])
	by mail.bbl.ms.philips.com (Postfix) with ESMTP id BCACF1803CB;
	Fri, 20 Nov 2026 11:47:34 +0100 (CET)
Received: by bbl2xvg1.bbl.ms.philips.com (Postfix, from userid 2884)
	id BA740FE023B; Fri, 20 Nov 2026 11:47:34 +0100 (CET)
From: Vishal Gupta <vishal.gupta_1@philips.com>
To: vishal.gupta_1@philips.com
Cc: briannorris@chromium.org,
	francesco@dolcini.it,
	linux-kernel@vger.kernel.org,
	linux-wireless@vger.kernel.org
Subject: Re: [PATCH v2] wifi: ath6kl: synchronize scan request completion
Date: Fri, 20 Nov 2026 11:47:21 +0100
Message-ID: <20261120104734.7646-1-vishal.gupta_1@philips.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261028135818.4166538-1-vishal.gupta_1@philips.com>
References: <20261028135818.4166538-1-vishal.gupta_1@philips.com>
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
X-MS-TrafficTypeDiagnostic: ZR1PEPF0000E460:EE_|BR2PR10MB992188:EE_
X-MS-Office365-Filtering-Correlation-Id: f76a6d1d-7704-4ee6-8944-08df46f3afea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700016|23010399003|22082099003|18002099003|56012099006|10067099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	99VCZ+6XBdE+W7brpcR1mcQE9mfAp3PsAkB1MHjTVgqPxTqahf8ETZNKo3QEFDiZTJ1TD1PdbdEcyR5U9FSgUZhWlXKepYNY1UQFwX7OvaDXlnOMh54tuDbKbMqSixa+SL2a52UH79dXx9/9WSu4d10YwDULllx+DYg7A7AR/vhk7j0bWjVAjua90GNt3KPj42W2cq0CqYOgdb46BdGTZpdX0eJPJQHNHLbEJtyT1H57fC5nrZCVIFUe454KAk+5b4FzQrXNoqS7rtF9zz6fM+Y9W0R1xgq8Qoi3Yq07ZWLxmadCSNz1Y519W9H3pEpG0x4kg6VwF2Kwfpr2ECi1EoQkR0tSYd+WoYTO9iyPq1f1NSQtU8VgguoIm0Q4OGo3tH9D+qJ8ZTRPPJzSIbYcVBN/byJOS+n/mQUNxhOlEBCb2YBBmJDCEYdn1rwEk7THyjIbEI9PmiucAqwbx0PFaf+jpewBBaAtYtbnpqtd3P8N0UaXV6a3WdB5vNHEqYfWDkhL8XE9Z1ktWDUGILkIrN7/0JYB97og5bbylUR3jDcuQFrIpgfDTC0nAtJr9OggjsEQLiQTc5tNBbS38OYGN13Oqnz//Ph5yP+snC+ejuZVa9qiZ5pk4aBneVU3OACK3p4zLJC8MuVXy2rBFCli7mrEMpef6B2q87XIGxPinckShY0YfzQS2imSOy6X9zoRY/2n2zPUYSYkoCUhVIJMDA==
X-Forefront-Antispam-Report:
	CIP:3.248.88.141;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ext-eur1.smtp.philips.com;PTR:ext-eur1.smtp.philips.com;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700016)(23010399003)(22082099003)(18002099003)(56012099006)(10067099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Ku73nLT7NxBJT23/WK9dl+hTzH7kLUrdBzEkhl9XqsJe0gzw0BgrHblHQzYoHDOqmgIwt0qpDeiQOHKLKffvzswfRrbMo+csQgObqkjLvu1RsNW6srTot5WnwxdohHXe1uh/EGjxZ6l1CavrGz3I2I3Qf64mTNZ5DuE01rnHV+YzhAneFSDedk28k285wuFaXrxyyAg80zq73s5zACtnNFeGri26BRWpNfFVbrRtGIcPktSAkwZsp8RQ0q+qBQ7IR4WmRqfPg9qteRjoerWf96/0zDAIxr8gKVV5brEjEIH+yCEuz8v/XrCtVJWw7o1rYfLFUQjXr7Nn72dzWyfJBNgHeUepkTBmafbNXH6fpG0vFFasIfWzGfic/d3WP7DenOAPa1U28ICGifyEMLkLrwjm271RB8x8//+3cXB0ZYoGcnNY9CxQZRjfnnscXtyD
X-OriginatorOrg: philips.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2026 10:47:35.1349
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f76a6d1d-7704-4ee6-8944-08df46f3afea
X-MS-Exchange-CrossTenant-Id: 1a407a2d-7675-4d17-8692-b3ac285306e4
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=1a407a2d-7675-4d17-8692-b3ac285306e4;Ip=[3.248.88.141];Helo=[ext-eur1.smtp.philips.com]
X-MS-Exchange-CrossTenant-AuthSource:
	ZR1PEPF0000E460.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BR2PR10MB992188

Hi,

Just checking whether you’ve had a chance to review this patch. I am happy to address any feedback.

Regards
Vishal Gupta
