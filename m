Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=46.4.11.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794938510;
	b=3QmvUywR1DnuMBJo0NnGCLZCIQFcfGFq0uUe6zfVQhS8NRVexevjhktMDSQ3YL9XrqKe
	 fdmJXNw9HHP20ePIR/MD79ENDLmMUVKTFnY2bwUkQLqYcR07Zpuxg+b1CTR+2IWRj8Ld9
	 mnUQ2jTqjZLk7CY7Hio3fLfkuu/nxWHml/MvOKqS6SZuWaUR+fhFput3nBYX1YRCgt67S
	 QCXiupuX6kaoMqoqJRubZ7+oLBeB83p3bPtkK5pJuitqkXQJE/5T6Uis9uWF9iBk0hD7H
	 OtLiE3jSsaYKaJFYe0B58Yk3Q60tUGMGEtFdhlRdgQiLSwbgjWpaZ0Bq0YKhfwAO9SA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794938510;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=c48pvsPksA7naEGAOH1VVBlp7GnUj1J7VbFaXc42IRk=;
	b=ucI5LempzZ83oVBdHFniuAUxh+K8dZ8ibW9XoAVUKEDinrQXLLGrV44Z1rLSx4zPURBl
	 Cer6b8ng+k5BRo9JU3Shpwjxfg7BGJNB0lII5IML98XmJGEt7uy9gctz0LF8AqonL5wHc
	 G1SNZaICwYBMKB3XvjKQIjtJgzXBPOfuUW2i4s8MrTrTAg+sqxXL3Ia3cluFt14wQC80R
	 qjDPIrgQDZ5RxjJJFEwC1LG2I/BUWDME5Dol+YQXfZeAV471xYSuIEV2kh5lHtlcmefx5
	 esTgURYmcI/A7TiZjB6O9zpemDNPJlAjAOKQERYRwQtrER4nt4iFWwwzq6CcqnjIaCg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nbd.name;
	spf=pass smtp.mailfrom=nbd.name;
	dkim=pass header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=UzvQpc6j;
	arc=none smtp.remote-ip=46.4.11.11
Received: from nbd.name (nbd.name [46.4.11.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C97D606A32C
	for <linux-wireless@vger.kernel.org>; Tue, 17 Nov 2026 18:01:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9C97D606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nbd.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nbd.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=UzvQpc6j
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
	s=20160729; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=c48pvsPksA7naEGAOH1VVBlp7GnUj1J7VbFaXc42IRk=; b=UzvQpc6j6H8M/u8X49/B6PT39t
	xiJt0hKqQUupRVeJFAbHFmUyz7MmOGvrmLq1qL1NS2bFy9sittov0dJOSW+zYGS4XA2VBXHIu7B/T
	bCK8P/j2whJLnuJ2+UlQRwZ6Kac8i/Y39zREFQzftby+s+2SE9WCxHnSYIdcxlFNokjg=;
Received: from p200300cadf12920000000000000005bb.dip0.t-ipconnect.de ([2003:ca:df12:9200::5bb] helo=localhost.localdomain)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <nbd@nbd.name>)
	id 1xTNV0-004eiZ-1e
	for linux-wireless@vger.kernel.org;
	Tue, 17 Nov 2026 19:01:42 +0100
From: Felix Fietkau <nbd@nbd.name>
To: linux-wireless@vger.kernel.org
Subject: [PATCH mt76-next 03/19] wifi: mt76: mt7996: use the default timeout for STA_REC and BSS_INFO
Date: Tue, 17 Nov 2026 19:01:18 +0100
Message-ID: <20261117180134.2940930-3-nbd@nbd.name>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261117180134.2940930-1-nbd@nbd.name>
References: <20261117180134.2940930-1-nbd@nbd.name>
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

mt7996_mcu_set_timeout() gives STA_REC_UPDATE and BSS_INFO_UPDATE a
timeout of 2 seconds. Their payload grows with the beacon templates of
MBSS and MLD configurations, the firmware can take longer to process
them, and an MCU timeout resets the device.

Use the default timeout for both commands.

Fixes: beb01caa570c ("wifi: mt76: mt7996: decrease timeout for commonly issued MCU commands")
Signed-off-by: Felix Fietkau <nbd@nbd.name>
---
 drivers/net/wireless/mediatek/mt76/mt7996/mcu.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
index 94e88455c732..e56b60346fc4 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
@@ -282,8 +282,6 @@ mt7996_mcu_set_timeout(struct mt76_dev *mdev, int cmd)
 	case MCU_UNI_CMD_THERMAL:
 	case MCU_UNI_CMD_TWT:
 	case MCU_UNI_CMD_GET_MIB_INFO:
-	case MCU_UNI_CMD_STA_REC_UPDATE:
-	case MCU_UNI_CMD_BSS_INFO_UPDATE:
 		mdev->mcu.timeout = 2 * HZ;
 		return;
 	case MCU_UNI_CMD_EFUSE_CTRL:
-- 
2.47.3

