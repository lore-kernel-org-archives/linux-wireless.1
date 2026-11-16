Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794871173;
	b=FN7AEBBY7u8u91s1DhiDpGVxn/iIE42iOi1GZQQ51fyQv/95ikWFCkcDVSky8Vx6nAdF
	 l2ouaiwomNKbs2uCI5fnf8jDTgW8IJJZZM+DbMn44Ym6ItAselYRRsN40jrUE6OpWLKG2
	 1maREksM8nGZKcHXIW9bMFzGf7X9IHkZsERza5CtNeBXW2R4amXKzd8BQwbkL0NHSRJDl
	 4p6jLmsbQMoEOyqnwXn8V8wxvTPMxrVDuQWOSr5Lg0N7Uvq4KzhGT4p3B55C5iuqpdFYA
	 a5QPSLbRSz+JWhVNEMt6ftN+quFPYnj7bOQouoUPuxUgiuXpLqGqqJBrrgaq3I55UUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794871173;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=f3Z16Is7JJ5QNyB2RJKkWgILNYqi5rZnhGq+IeCbrE8=;
	b=i+jok7mCL3BvwUNPJEuOxPh1sbUr8zampzqF/UdU127Ik5bU5iDo8f19jfIIcs2tK3Nn
	 pyP9H9TKn9k3v4dw+obozAU0PCPceGY7ddHusQu7rWkmia8HLSpz7ja9thljN+L0oKI4m
	 eWDDya7/ypvONMdhdSznPKFtfqjTVcXvEPB8PP7J3/BLeNCw7G+51BeF8S7DzbfVufx7a
	 hdYP+rU+qTKfrTjTMY7vqzXA7KZLu6zwcOQ9cHeqKg6DLYVSxyqhGzS/Wi8iepqbrJqG5
	 ISLu7UocCCLBP+NBG7+tjbutb8d4Y/JBtqpYY6beD5N4dSgU5tOul3QwE/bv8H/lVYQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=kernel.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.160.50
Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F682606A32A
	for <linux-wireless@vger.kernel.org>; Mon, 16 Nov 2026 23:19:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6F682606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-48ed0b68895so3110274fac.1
        for <linux-wireless@vger.kernel.org>; Mon, 16 Nov 2026 15:19:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794871172; x=1795475972;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=f3Z16Is7JJ5QNyB2RJKkWgILNYqi5rZnhGq+IeCbrE8=;
        b=KyiNG/PqmxYYShJxSisOGe/4qTDyHVgAasMLmPWHEoDz0UMKGSqJGDiaVduaClNBup
         dteqVB6Y4s5tsynRt10IOH5oHUrYZ/0so3Cr2aPs/ELqVUOyAvmnaB9e35N8QPLqlBAQ
         i78jxWBDjjLF3Rh2U7VMHcIkJ4+O/JjuHUn/F19R0V6c9FURBRnzvO186bXpbAjJeHD9
         9v3/Da0+gODtjrJ/Qw8BlpAKvg62LXPxfLXQAXV1pCs49kGOEAB4aVQeMF2l/QMRs98J
         7YekID1wZ1JHoIa0AbAzq00yDEy5pqU8rJFTdcoE5IL9MLPpt6KmIWC3P3oEjOvljtK/
         8D+g==
X-Forwarded-Encrypted: i=1; AL+hErFeleyaKSRFrLfh8pE3uGqJ3/kxlRvpoL0PP6Xq8hwIsaUs97KJBHhjrA8qRse+P1Gj1vhbLOFqHt8UKMaGyA==@vger.kernel.org
X-Gm-Message-State: APuU4Z/5QSDP+1a0YKCZy78a4khCgGKHI2C0wpkdhP8cW1u6QkhpQ6aV
	QI8Ta1jcTAg2oKYgoMFs85ecXEhac3QlbMnwKxCX2QTOkiGMJNKPAMdU
X-Gm-Gg: AYBFou1uLhoDfjJMomFt6Oi+Q6XWIYbPqc+nyY9nSDWkBzNMbZpcDvA6jWy1BQQvOXT
	AtLBX97SAnK8AmC0fNOr1JWHjfOMddty+3Ix5mhyhjo/9Z2FzWuM4aHVP4CvciT7WKdHDwt+ZwW
	5iJKzN9qocHwBM98HwA9D/2k0Ly504bUBgdL8dMub/oqfBWCcgOAgfD/Jw2hd84GjV0Tqg4TIBC
	mqOCPNSn/fEc8LzjDAfaEB+0BDLg+YSGhQZXneQpe8ogrKC492zGpOZpE/JdxjWV5WnUaSboGpz
	y16gFODwq+NE5HoYJWOdO5geqRMb8jv/+A2yaUbINJARBuGd2RUC0mmeDEOfmtZPlNapKmXb3XY
	7jmpNITSwI8E1WuQmG00+DSOeG2+jqVSagUXoqZpO8Uo2WdQYqVCA6JHuX3fZ8rAvq7IYKZmlVY
	+db4QCKddYtytm5hLh/0X55meaGK4jd4/15rGchjhXWupZQ/qhn4C2YhwUAEwYi4MWfEi12XyQY
	11ggswZez637wxwx6MoMExNAVz/zbdz59XQii506d4MiO5fJlyeHg57+a5o4Qodny0/uWG8PKo+
	I26zpgHaiujKX3VzX4GIRR7knRx1UKkw2Q7ig5qPa26akbnp2sFNpyIl2SIGoyck8HZq6wk6yQF
	BP4Un88X+
X-Received: by 2002:a05:6808:319b:b0:4f4:d7:b16d with SMTP id 5614622812f47-56e65c53555mr9526418b6e.60.1794871172475;
        Mon, 16 Nov 2026 15:19:32 -0800 (PST)
Received: from sean-HP-EliteBook-830-G6.lan ([207.191.35.252])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56e70c58f9bsm10239635b6e.13.2026.11.16.15.19.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 15:19:30 -0800 (PST)
From: Sean Wang <sean.wang@kernel.org>
To: nbd@nbd.name,
	lorenzo.bianconi@kernel.org
Cc: yu-ching.liu@mediatek.com,
	chengwei.yu@mediatek.com,
	jacobs.wu@mediatek.com,
	posh.sun@mediatek.com,
	clifford.hsu@mediatek.com,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Sean Wang <sean.wang@mediatek.com>
Subject: [PATCH v2 12/19] wifi: mt76: mt7925: let TX status of DW-held NAN frames outlive the DW period
Date: Mon, 16 Nov 2026 17:16:23 -0600
Message-ID: <20261116231630.1733906-13-sean.wang@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261116231630.1733906-1-sean.wang@kernel.org>
References: <20261116231630.1733906-1-sean.wang@kernel.org>
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

From: Jacobs Wu <jacobs.wu@mediatek.com>

Frames on the NAN DW-WTBL legitimately wait up to a full discovery
window period (524ms) in a paused queue before they air, but the TX
status tracking times a packet out MT_TX_STATUS_SKB_TIMEOUT (250ms)
after DMA completion and reports it as failed. wpa_supplicant treats
the false no-ack as a delivery failure and retransmits: a NIK follow-up
held to the DW is then re-queued every cycle, the peer receives one
copy per DW (56 copies measured over one 30s window), and the resulting
pairing-confirm storm poisons the pairing-verification state, which
never triggers and times out.

Extend the TX status lifetime for frames tracked on the DW wcid so the
status is reported from the actual transmission.

Co-developed-by: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: Jacobs Wu <jacobs.wu@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/tx.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/tx.c b/drivers/net/wireless/mediatek/mt76/tx.c
index 08b04f092a0b..7e205412dae3 100644
--- a/drivers/net/wireless/mediatek/mt76/tx.c
+++ b/drivers/net/wireless/mediatek/mt76/tx.c
@@ -190,11 +190,20 @@ mt76_tx_status_skb_get(struct mt76_dev *dev, struct mt76_wcid *wcid, int pktid,
 		struct mt76_tx_cb *cb = mt76_tx_skb_cb(skb);
 
 		if (pktid >= 0) {
+			unsigned long timeout = MT_TX_STATUS_SKB_TIMEOUT;
+
 			if (!(cb->flags & MT_TX_CB_DMA_DONE))
 				continue;
 
-			if (time_is_after_jiffies(cb->jiffies +
-						   MT_TX_STATUS_SKB_TIMEOUT))
+			/* A frame held to the NAN DW legitimately waits up to
+			 * a full DW period (524ms) before it airs; timing its
+			 * status out earlier reports a false no-ack to the
+			 * one-shot NAN handshakes (PASN, NDP key install).
+			 */
+			if (wcid->nan_dw)
+				timeout = HZ;
+
+			if (time_is_after_jiffies(cb->jiffies + timeout))
 				continue;
 		}
 
-- 
2.43.0

