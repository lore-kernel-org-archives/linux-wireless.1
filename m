Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=46.4.11.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795196706;
	b=5JX7ZzNFZDefBOLivkMmzJmZOJnTtDo5Z7qqtXyjkpDf6aCt9L/Zu0CGZDbAyiwpHwTv
	 gbhZghQ3RN1PuudkJAnv57sSkEBDp5dBjDHxpk0AL/7ayvELvsfzCeL3KWR3J7jXo61Bc
	 3MzfSBHF85E0ofWYNppi1QsRgFNJBOsKKXWvST34kzJ6WED/u7opmhTGaQ9AzS+5dMz5H
	 zge/earcd4eorZ73H/3M9MxUnkW2tObjuBYq3wZCRuPPBSXyffwUFDAML65gDvwZQZLkZ
	 u52NRFUcgTZ8j+8isR102N/Gf5fueDPIYRl7L/P5cB+fhUEIgk9XvdyJhpKhQ1/EZ4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795196706;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=I5AKps6/Sctid9b60VNoKd/+fSQuRGIjlGYl01w9KrE=;
	b=NTFad1pY+HeZAgehUwB76T07yonnQtDAQ3lpWSNnOXaLObEfErlF7rQZWrk3pBSgSloz
	 57t1zvHbwnfavHBcgewc3GHouva+skDAL8JIBed+LhoTFXeFZkWXI8KXxN9V/o9QaHGUw
	 pdAueQrnjkJDZTEjenFYuNWZbpVLVozAXdterGjmRjU2KxglrCq4YMwziOBTQMK8FRGAj
	 F15L9nmka/dWOQGHOaLbplWuNX1erWer4M8cz6sCeKOKQgc9qHU+s+ZjT8LB2aQ2wNGzQ
	 VPxfjS8mijS1TNoV0Y6PO4RCzcEX/Zc2ObDZfwNJtuYerWySKdH/E02tltnr01Rg4oQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nbd.name;
	spf=pass smtp.mailfrom=nbd.name;
	dkim=pass header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=N8HHcbFU;
	arc=none smtp.remote-ip=46.4.11.11
Received: from nbd.name (nbd.name [46.4.11.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF34960A2624
	for <linux-wireless@vger.kernel.org>; Fri, 20 Nov 2026 17:45:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EF34960A2624
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nbd.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nbd.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=N8HHcbFU
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
	s=20160729; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=I5AKps6/Sctid9b60VNoKd/+fSQuRGIjlGYl01w9KrE=; b=N8HHcbFUA4GLcZ+tE/O84TrA+L
	asB6qfo9wb1tvQ4Y1s5urBV6SMDAKjUB3ecAVztU95ApDlhtKTJJJhQPjxYRWXWQ9dgYpfk0ccdCl
	ew+4ZLGmR/pEUJkhyHWEUPbNdbpyzg57zaM3Ii8Kv+8vsXXGrGkXphix1GzLVfS8tOMg=;
Received: from p200300cadf12920000000000000005bb.dip0.t-ipconnect.de ([2003:ca:df12:9200::5bb] helo=localhost.localdomain)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <nbd@nbd.name>)
	id 1xUSfY-0065GI-1y
	for linux-wireless@vger.kernel.org;
	Fri, 20 Nov 2026 18:45:04 +0100
From: Felix Fietkau <nbd@nbd.name>
To: linux-wireless@vger.kernel.org
Subject: [PATCH mt76-next 07/20] wifi: mt76: mt7925: skip a polled link without a station
Date: Fri, 20 Nov 2026 18:44:46 +0100
Message-ID: <20261120174459.1657382-7-nbd@nbd.name>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261120174459.1657382-1-nbd@nbd.name>
References: <20261120174459.1657382-1-nbd@nbd.name>
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

Since the WCID teardown moved into mt7925_mac_link_sta_remove(),
mt7925_mac_sta_remove_links() clears mlink->sta of a removed link while
the link is still on sta_poll_list. On PCIe, mt7925_mac_sta_poll() runs
from the TX free event without dev->mt76.mutex. It can thus take such a
link off the list and dereference the NULL station.

Skip a polled link without a station.

Fixes: 52f088a2e6bf ("wifi: mt76: mt7925: move WCID teardown into link_sta_remove()")
Signed-off-by: Felix Fietkau <nbd@nbd.name>
---
 drivers/net/wireless/mediatek/mt76/mt7925/mac.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mac.c b/drivers/net/wireless/mediatek/mt76/mt7925/mac.c
index 30deb675c5ff..ca54d71db4c7 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mac.c
@@ -90,7 +90,7 @@ static void mt7925_mac_sta_poll(struct mt792x_dev *dev)
 			memset(mlink->airtime_ac, 0, sizeof(mlink->airtime_ac));
 		}
 
-		if (!mlink->wcid.sta)
+		if (!msta || !mlink->wcid.sta)
 			continue;
 
 		sta = container_of((void *)msta, struct ieee80211_sta,
-- 
2.47.3

