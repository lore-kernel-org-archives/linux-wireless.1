Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=46.4.11.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795717411;
	b=UaHhx0xXEULnIQh4b1YoxVfoF3Q8gktl6gbCm++To4Q/rSERj9y9E+tCmv5rpHTf5IFC
	 +mSMO0xbV3v6N7GG16IOJC0Tw0haahCfP09NmQ9Tyt2u0dt5+6x1NoSlUBT9B/CX2+Ln0
	 WKNp58XLnF+iuXnCXfqe/VV75jwoPaIUW6pNvPL5khGk+Vj0JkRzatMqpSwYZSbBvkv+U
	 AnqBFq2pUY1oZmRJP9XraQ/wSPyybc/j6qdd9CY3WBd1zrusssHdw1e1jXd1+g38m4e+L
	 spwTxYwMP0kz5U62ExKc5xl+9G9qjT2mgsJLCshgo0NhZZH5L9MVSOnp3aemRtps00w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795717411;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ddf9hVlkHqCUp2Oy28nG4LZbDKhaHU5km9es1u3MEOI=;
	b=T5qIGAsPYfu7Ky8yPDLS71+Tz7hNpA4F1FFuEFrjn8yOpyd5K0H0pNcOllGGMlFkl29n
	 dMDJuPau430WGYfJT9hIMKp9Z3tz6zW55kIEjAcM31wX+b653juY9ypbWC7lMq/s2/Mys
	 SKDr2vlJHW+DWcHXsdX1d3OiYqVB9sHjAws6JzsyJV8kU9xNdNrIXx5XMckyOr9MMXPPl
	 VznK3GcFOXmuwCsrgxi6EFNj/CNOcO7PhL+KIHwOJbbqoSJobipdSxXWRX9MNYiJYTE9L
	 S4TEDldRFjZJJXQd5oA6vSRitWYjKxfbOTkIHLwPmobc78n1MgFmHjNwFzvAsr66rug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nbd.name;
	spf=pass smtp.mailfrom=nbd.name;
	dkim=pass header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=nswI8Dm2;
	arc=none smtp.remote-ip=46.4.11.11
Received: from nbd.name (nbd.name [46.4.11.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 879F3606A691
	for <linux-wireless@vger.kernel.org>; Thu, 26 Nov 2026 18:23:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 879F3606A691
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nbd.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nbd.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=nswI8Dm2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
	s=20160729; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=ddf9hVlkHqCUp2Oy28nG4LZbDKhaHU5km9es1u3MEOI=; b=nswI8Dm2eSX1mmM66U1tWs42Tz
	PS9O+hyg75G2A+YQ1Mz44yrW5OGbmZyWMHMR0EQBbeL64PhNoxP/gJf36rRt4s5uQIAmavljtXydU
	E5gu+/VcbvSeLDOr8xikyud0tCQoiierpcmlPCfbhxhTxlmhoKGVYLscDCqTR+pVFc5M=;
Received: from p200300cadf0358007454e6799d1561c3.dip0.t-ipconnect.de ([2003:ca:df03:5800:7454:e679:9d15:61c3] helo=localhost.localdomain)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <nbd@nbd.name>)
	id 1xWe82-008icn-0I
	for linux-wireless@vger.kernel.org;
	Thu, 26 Nov 2026 19:23:30 +0100
From: Felix Fietkau <nbd@nbd.name>
To: linux-wireless@vger.kernel.org
Subject: [PATCH mt76-next 14/16] wifi: mt76: mt76x02: find no station for the group wcid of a vif
Date: Thu, 26 Nov 2026 19:23:23 +0100
Message-ID: <20261126182325.2516607-14-nbd@nbd.name>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261126182325.2516607-1-nbd@nbd.name>
References: <20261126182325.2516607-1-nbd@nbd.name>
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

dev->wcid[] holds the group wcid of each vif at MT_VIF_WCID().
mt76x02_rx_get_sta() refused such an index until commit dc66a129adf1
("wifi: mt76: add a wrapper for wcid access with validation") replaced
its bound with the size of the table. It now takes the group wcid as a
struct mt76x02_sta. For a group addressed frame whose RXWI names that
wcid, mt76x02_rx_get_sta_wcid() derives a pointer from the vif index
that follows the wcid, and mt76_check_sta() dereferences it. Whether
the hardware reports that index is not known.

Find no station for a wcid without one.

Fixes: dc66a129adf1 ("wifi: mt76: add a wrapper for wcid access with validation")
Signed-off-by: Felix Fietkau <nbd@nbd.name>
---
 drivers/net/wireless/mediatek/mt76/mt76x02.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76x02.h b/drivers/net/wireless/mediatek/mt76/mt76x02.h
index f5a25608f8ff..da35daeb977a 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76x02.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76x02.h
@@ -265,7 +265,7 @@ mt76x02_rx_get_sta(struct mt76_dev *dev, u8 idx)
 	struct mt76_wcid *wcid;
 
 	wcid = __mt76_wcid_ptr(dev, idx);
-	if (!wcid)
+	if (!wcid || !wcid->sta)
 		return NULL;
 
 	return container_of(wcid, struct mt76x02_sta, wcid);
-- 
2.47.3

