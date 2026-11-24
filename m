Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=46.4.11.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795509794;
	b=19PFmyaSv+p9BGcLXT5fOBSxza8yQqDm1rfw8FLqDwmKPZR71Vi/vX/4fmJSlp5JYgx+
	 yZp7ZioywZBD7oAo3E7aWq0QH2sUDXS0Mez8FzjEXmA4FarNN2vhZ2qc5e/6pUv+BzBUo
	 pCHynErziKPfEJ2jjp56IYBQMvao3UD1nPGyOzTeLr355qYqVOCjiyI6n3284tf+r4Ta/
	 wiq9bHNSe5C0qr5d/ywygK8Kpce7TiBK2m6pnbaPjzv7+Yh68EkNNB4JHAmXU/i9nfbPF
	 23jJbLmnnlNOXBmptiGkHFdA1opQ2DgNhjO+a11+H4WFju/Z9qcjrgVacd9+kVMUalg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795509794;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=CK7n4fHw7ArPebtifDXgTB7yC25t3+XHqfV+VCBxUUw=;
	b=CE39tap9hP6yhFW/2BXKscwNP6BCpuMQ0XyYsdL0zumfXuP+H83yxRhT1Jx6jb3pa6W9
	 Oh+cLbUHJNQiyjrWymCWq8EgO5/N7z8bh3riApkXWumpveFCvVmdLMcONsYcFf9QOk2cw
	 gdGMXNa/du7xzjjvtqeBzNOy9qwfuSGPziIHO3ga8+SXebdiwWXfLG+vSjd9oU1iqetwK
	 tUYcEcvzJ5aWZc8+GWAEPXsB3BHsHuKRUMMGderzKPOA2Gvo24Dmvv8zJ2hXcsDqKPJ46
	 +gtKivAOZg3ni9cThns6/YsOjV7Hb54dy+Hd1tTn27Q2WjYRaaa2fZMssddLCBOggpg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nbd.name;
	spf=pass smtp.mailfrom=nbd.name;
	dkim=pass header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=D7lqlLwS;
	arc=none smtp.remote-ip=46.4.11.11
Received: from nbd.name (nbd.name [46.4.11.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 488C1606A31E
	for <linux-wireless@vger.kernel.org>; Tue, 24 Nov 2026 08:43:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 488C1606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nbd.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nbd.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=D7lqlLwS
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
	s=20160729; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
	To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=CK7n4fHw7ArPebtifDXgTB7yC25t3+XHqfV+VCBxUUw=; b=D7lqlLwSJvZ2/HnuaZ5FPL3qh0
	Rbzz/1BhIdeATAgCETIv+ciWWqhJFIi+IR6n44WR3As3w8N4MDBJcK2CpOxoGe3qLkje/BGlgeftd
	ddWwx0/S8fAm3FJCzbsMbDmt3wSk3CSbl0VU2uf4a9jhaEwLP55gZrnjafpraLHpTW+Q=;
Received: from p200300cadf0ca80000000000000005bb.dip0.t-ipconnect.de ([2003:ca:df0c:a800::5bb] helo=localhost.localdomain)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <nbd@nbd.name>)
	id 1xVm7L-007dJf-0r
	for linux-wireless@vger.kernel.org;
	Tue, 24 Nov 2026 09:43:11 +0100
From: Felix Fietkau <nbd@nbd.name>
To: linux-wireless@vger.kernel.org
Subject: [PATCH mt76-next 01/20] wifi: mt76: mt7915: dump the firmware memory of mt7916
Date: Tue, 24 Nov 2026 09:42:50 +0100
Message-ID: <20261124084309.1981968-1-nbd@nbd.name>
X-Mailer: git-send-email 2.47.3
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

mt7915_coredump_get_mem_layout() selects the mt7916 regions for chip
0x7916, but mt76_chip() returns 0x7906 on mt7916, like is_mt7916()
expects. 0x7916 is the PCI id of the second interface, which
mt7915_pci_probe() hands to mt7915_pci_hif2_probe() without a device
of its own. With the coredump_memdump parameter set, an mt7916
firmware crash thus gives a dump without firmware memory.

Match the chip id of mt7916.

Fixes: 4dbcb9125cc3 ("wifi: mt76: mt7915: enable coredump support")
Signed-off-by: Felix Fietkau <nbd@nbd.name>
---
 drivers/net/wireless/mediatek/mt76/mt7915/coredump.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/coredump.c b/drivers/net/wireless/mediatek/mt76/mt7915/coredump.c
index db079b274a93..91f02735a882 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/coredump.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/coredump.c
@@ -96,7 +96,7 @@ mt7915_coredump_get_mem_layout(struct mt7915_dev *dev, u32 *num)
 	case 0x7986:
 		*num = ARRAY_SIZE(mt798x_mem_regions);
 		return &mt798x_mem_regions[0];
-	case 0x7916:
+	case 0x7906:
 		*num = ARRAY_SIZE(mt7916_mem_regions);
 		return &mt7916_mem_regions[0];
 	default:
-- 
2.47.3

