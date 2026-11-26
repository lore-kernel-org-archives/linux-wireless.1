Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=210.61.82.184
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795686908;
	b=XaGjsHcRkLW0GZag2UiNjGX2oECMVV3rlMJYhx03eXhSsUFsyzbC/W1SDm9RNGYULZkA
	 7bSH1K52K/fIqXIzm6utwMvJOE8qZN5TZb915zF4o4waAu8Z0f6I6I/4a1NtXSZAL1Kcv
	 kbz8qBaY97zedewhoW6fYaKtdqX5rks3VqSP6VvdVZDn7Tlgivqn3Q1QQYFrKKLyUfc7l
	 0nCG4UwrEFswy3wsTlbpBp5DWOWhnjS8LG5Hly1UpOSBaKhUFwthcsAounpbIFioPH4De
	 y/mvcXemGhWB8OTZHfKZVJipt5nxAjTGPbQ9fOlpd6aOD5mWxigbSQUul6oUZizi1xg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795686908;
	h=DMARC-Filter:X-UUID:DKIM-Signature:X-CID-P-RULE:X-CID-O-INFO:
	 X-CID-META:X-CID-BVR:X-CID-BAS:X-CID-FACTOR:X-CID-RHF:X-UUID:Received:
	 Received:Received:Received:From:To:CC:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-MTK;
	bh=5cqKCREXyff81gjefYvzOAk0PiOglC3sM+LBF9bDjlo=;
	b=g+yb2Ne0uoD0sBthjJYnhGc38UVvqk1Z0cGv5VfYPcRt6vOwlNPZWbY9pHqqpSSrgI8V
	 5nTy/MKQF5YYl4tXAYEgxNdxafRD9z2gzcYc2YqdW7dcOeH7mLaJe9Wl+9xOCxBaxKYj3
	 nqk3TRTWa09WJnvvOJU0+lWaOFkJBWU2kDCe1YYvwr2oM2aGNJqwZb7W/72i/yR5GKAKo
	 sye/qAhbD1Xx1E2H1RELVEdXCsIhQwyLYC2jkGYx+Ur5fpMOc4BGaAjYKc27SQfdFQxve
	 6u+3bNsVrJXAJ+3Ag5kXiPTPUMlZfUOdAMZZtT8OHtBc4Ylt4ZhY3Kf/njgp8uZpGKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mediatek.com;
	spf=pass smtp.mailfrom=mediatek.com;
	dkim=pass header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=L0UBhp1Z;
	arc=none smtp.remote-ip=210.61.82.184
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75D16606A321
	for <linux-wireless@vger.kernel.org>; Thu, 26 Nov 2026 09:55:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 75D16606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=L0UBhp1Z
X-UUID: 71786e14e97f11f1a7aecdb2598be72c-20261126
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=5cqKCREXyff81gjefYvzOAk0PiOglC3sM+LBF9bDjlo=;
	b=L0UBhp1ZdernTyBRkyGF6/beO5J9xblKLtrWJ/IEkQ/RhVwlikoBVlzYAvy1lV/NVFVrYu0sEqxeumgN6G2hh5zae3GA14A85JvQZrDLQ9HLBJ8WOcs5RlHR7198YsjKp8c4LZXdlDkqDxaIa8f7kDAye/3LN5CI/MYQXcLn/kc=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.21,REQID:887814a3-52b4-41d4-8736-2499ba1f607d,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:b0318ac,CLOUDID:de7b171a-ae4c-4a2b-b1c4-72e411efd0c9,B
	ulkID:nil,BulkQuantity:0,SF:81|82|102|836|865|888|898,TC:-5,Content:0|15|5
	0|99,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0
	,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 71786e14e97f11f1a7aecdb2598be72c-20261126
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw02.mediatek.com
	(envelope-from <mtk10484@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2113115755; Thu, 26 Nov 2026 17:54:59 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 26 Nov 2026 17:54:58 +0800
Received: from mediatek.com (10.233.130.16) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.2562.56 via Frontend
 Transport; Thu, 26 Nov 2026 17:54:58 +0800
Received: by mediatek.com (Postfix, from userid 10010484)
	id 80701200C5; Thu, 26 Nov 2026 17:54:58 +0800 (CST)
From: Anthony Liu <anthony.liu@mediatek.com>
To: <anthony.liu@mediatek.com>
CC: <Emery.Hsin@mediatek.com>, <Jb.Tsai@mediatek.com>,
	<Leon.Yen@mediatek.com>, <Litien.Chang@mediatek.com>,
	<Quan.Zhou@mediatek.com>, <Ryder.Lee@mediatek.com>, <Sean.Wang@mediatek.com>,
	<kun.wu@mediatek.com>, <linux-mediatek@lists.infradead.org>,
	<linux-wireless@vger.kernel.org>, <lorenzo@kernel.org>, <nbd@nbd.name>
Subject: [PATCH v5 3/5] wifi: mt76: add ACPI MTFG option for bus configuration
Date: Thu, 26 Nov 2026 17:54:53 +0800
Message-ID: <20261126095455.3280998-4-anthony.liu@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20261126095455.3280998-1-anthony.liu@mediatek.com>
References: <a359fadf034e2077f7c92e1da6c9ce9f2a40f718.camel@mediatek.com>
 <20261126095455.3280998-1-anthony.liu@mediatek.com>
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N

Extend ACPI MTFG table parsing to support an additional MTFG bus
configuration option.

Signed-off-by: Anthony Liu <anthony.liu@mediatek.com>
Reviewed-by: Felix Fietkau <nbd@nbd.name>
---
 drivers/net/wireless/mediatek/mt76/mt792x_acpi_sar.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt792x_acpi_sar.c b/drivers/net/wireless/mediatek/mt76/mt792x_acpi_sar.c
index 2d7a967fd399..d8268ec56f98 100644
--- a/drivers/net/wireless/mediatek/mt76/mt792x_acpi_sar.c
+++ b/drivers/net/wireless/mediatek/mt76/mt792x_acpi_sar.c
@@ -398,6 +398,7 @@ u8 mt792x_acpi_get_flags(struct mt792x_phy *phy)
 	} map[] = {
 		{ 1, 1 },
 		{ 4, 2 },
+		{ 13, 3 },
 	};
 	u8 flags = BIT(0);
 	int i, j;
-- 
2.45.2

