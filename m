Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=46.4.11.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795509794;
	b=GW1EW19dq5nexueS4jXdrQDLcFNUWjv+hZS9T5iN9FH4kL579BWdruNX3KjVsRwVe1XR
	 wYby73bVeBNkIMMe1ixO0NLYk0QUVvQ7R8wU/PxVaWKQt1L8juFrCGXAN9jqQ94bvzud9
	 VCfg8Yp2B+sG5k1ruzP8tPaOxVfx5xuEWIXerj8G598hsFiLJLAs3xbj0Xb7BR/RdWZ9g
	 AbgoCBeARUOjqhIXHdYfhRdBDm4Cz2VXL7ZyxxztpEuupbifn0LMpImPzQKM7yRYV6jrm
	 y2OnKiOgfFexb5OaoXkqZsbYl3J/nKxP720cLZgll8Q386CgRAOIKLyZbKq5SNPKkow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795509794;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=SXIYmwJ14HT+KBhhJGfVgH8tlXKNcXbQvIy6horMiic=;
	b=YgH6RrQXheE3pd1JZ1Xco9ZVxjrlNyI+EIbtPYI4wRJLX4iwRrmdivstjLeUTwYEF2Ou
	 nVD2sHgd01zVS3KUTle4vc+VFMAYPgqNy4wlmugIEIWG2Zf81ZSqnT3SoXxwH7dPyVPny
	 /qVe+lLYCaiTdwjUFU9J5uta/V3HMDGLGe/73jnM622lsd3KGxLaOidRmTL1ll2eOcbcA
	 MVkEs9DcUKNtIAVOj0YGyg5ab5WCSZpkBFGxw4UrqBGQToYmf5Iii9SaQxz9LkhB+m3S2
	 Fx+d2Uh21i71hi6dbNyLGfz8IIFzQrZqdfkxqhB7svazlsmmhf+YfPPWY/gXPGUeTww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nbd.name;
	spf=pass smtp.mailfrom=nbd.name;
	dkim=pass header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=rGzr+Don;
	arc=none smtp.remote-ip=46.4.11.11
Received: from nbd.name (nbd.name [46.4.11.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6551E606A327
	for <linux-wireless@vger.kernel.org>; Tue, 24 Nov 2026 08:43:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6551E606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nbd.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nbd.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=rGzr+Don
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
	s=20160729; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=SXIYmwJ14HT+KBhhJGfVgH8tlXKNcXbQvIy6horMiic=; b=rGzr+DonSe2R7P9lFNs9KdGXRL
	x2Wx7L4JdN8wosmhqOKB36JNJUumnkFqL/gVgvRH1WKBjZDHBN+Yq4FTkhApZNfVM1DiWvZVb69+B
	F99h+rQACr5DSZQCmJ3O/qEux4LRojVWtpfx+s+PaY1EYKZagXItl+7cHITAj+7OmwG4=;
Received: from p200300cadf0ca80000000000000005bb.dip0.t-ipconnect.de ([2003:ca:df0c:a800::5bb] helo=localhost.localdomain)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <nbd@nbd.name>)
	id 1xVm7L-007dJf-38
	for linux-wireless@vger.kernel.org;
	Tue, 24 Nov 2026 09:43:12 +0100
From: Felix Fietkau <nbd@nbd.name>
To: linux-wireless@vger.kernel.org
Subject: [PATCH mt76-next 05/20] wifi: mt76: retry only an MCU command that reads
Date: Tue, 24 Nov 2026 09:42:54 +0100
Message-ID: <20261124084309.1981968-5-nbd@nbd.name>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261124084309.1981968-1-nbd@nbd.name>
References: <20261124084309.1981968-1-nbd@nbd.name>
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

mt76_mcu_skb_send_and_get_msg() sends a command again after its answer
did not come in time. The firmware keeps no state per sequence number,
so a command whose answer alone was lost runs twice. Not every command
is safe to run twice. A second removal of a station record can clear
the entry of another station.

Retry only a command that is marked as a read. Any other command whose
answer does not come goes to the timeout handling of the driver at
once. As before, a driver gets the retry only with an
mcu_skb_prepare_msg op. A command that changes state and loses its
answer during the probe now fails the probe.

Fixes: 3688c18b65ae ("wifi: mt76: mt7915: retry mcu messages")
Signed-off-by: Felix Fietkau <nbd@nbd.name>
---
 drivers/net/wireless/mediatek/mt76/mcu.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mcu.c b/drivers/net/wireless/mediatek/mt76/mcu.c
index 0a7d82bdeeeb..61b8ced5c11a 100644
--- a/drivers/net/wireless/mediatek/mt76/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mcu.c
@@ -74,6 +74,7 @@ int mt76_mcu_skb_send_and_get_msg(struct mt76_dev *dev, struct sk_buff *skb,
 				  int cmd, bool wait_resp,
 				  struct sk_buff **ret_skb)
 {
+	bool read = cmd & MT76_MCU_CMD_READ;
 	unsigned int retry = 0;
 	struct sk_buff *orig_skb = NULL;
 	unsigned long expires;
@@ -124,7 +125,8 @@ int mt76_mcu_skb_send_and_get_msg(struct mt76_dev *dev, struct sk_buff *skb,
 
 	do {
 		skb = mt76_mcu_get_response(dev, expires);
-		if (!skb && !test_bit(MT76_MCU_RESET, &dev->phy.state) &&
+		if (!skb && read &&
+		    !test_bit(MT76_MCU_RESET, &dev->phy.state) &&
 		    orig_skb && retry++ < dev->mcu_ops->max_retry) {
 			dev_err(dev->dev, "Retry message %08x (seq %d)\n",
 				cmd, seq);
-- 
2.47.3

