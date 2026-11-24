Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=46.4.11.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795509794;
	b=y+8C9J67Kz4am+olWY0xV/DODJmxUaLnzbQENq3yOhsrWHgeQbOQBfuPv0UPqDKWWInd
	 U4ydBDM2jbpjaCyp0/pw+Wum93EDrLaG2vObyTFI+5vBgk8VSqb2QIH1wWkou3p6tVWnC
	 G+wjwHCnlbYFKo07lDCNqwibsAiVY+LuJ4YoWWcz1IAMbXBYwQyIg27hyMS+QLRZXVNMa
	 Wikc52vxawEoHZ/DOScE9qOkDl3PetS1pKzKEUqfP+MKU4LLnPRGOpdnTLeoZL+l6w8V8
	 SZOyc1DUlTRLPc8p9gGmskqTEr4hq11hPgikRUvKzVx9CcefGGN7U+Q2KCQeL/c+bzQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795509794;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=WPO+47pX9O/ZW9BIBSxCKp1UpEQ0vowED4G23xS+iVQ=;
	b=IExmwJsbNSZ3SekbS3f6PQc7TnRM0w8Et3eoKnU6OfSZTZC1PgGk1XW8OZ3x96K8FNYx
	 Crc8scvCTHJUiaa07NZh/sUKKnVx22Xo1mqawpR/7WmpYCRoeUue8rvRxwJmwKQl/srS9
	 AQSdqoURZzUpUSq2iiufu7pbW1fCr3lqWcOhClfhyIdBckYR1mv91c8aMJOWpPt7Ig07q
	 I+ktuY/96o9nE9PJOa+uEjFxPUsa7c52QVd+tjbvxYnpWkFNuvDXjFBVznN521GrtbR0P
	 LsPTSbJwtb2bi1F3oiPut74tbN0Yq930hH5h1FRPTZDdoUuC77H6JjB1yB9EzJxZVDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nbd.name;
	spf=pass smtp.mailfrom=nbd.name;
	dkim=pass header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=Sa0lXWbm;
	arc=none smtp.remote-ip=46.4.11.11
Received: from nbd.name (nbd.name [46.4.11.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49176606A338
	for <linux-wireless@vger.kernel.org>; Tue, 24 Nov 2026 08:43:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 49176606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nbd.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nbd.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=Sa0lXWbm
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
	s=20160729; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=WPO+47pX9O/ZW9BIBSxCKp1UpEQ0vowED4G23xS+iVQ=; b=Sa0lXWbmN3Jw//Mdzs4CrkWui8
	ibUNyxoTdTl2XrRPV80pdUpGvhvYOZyAECqxeKLytSldcAy56C1i9ot0a6JBdYCmz5WTMks7zh/s4
	5TVTpx55mWzTodyb21pyDkQCbaMkjXIwAn4NRE/1zTM6mnJj0PuqzKhZUgq/BqYPXvy8=;
Received: from p200300cadf0ca80000000000000005bb.dip0.t-ipconnect.de ([2003:ca:df0c:a800::5bb] helo=localhost.localdomain)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <nbd@nbd.name>)
	id 1xVm7M-007dJf-2i
	for linux-wireless@vger.kernel.org;
	Tue, 24 Nov 2026 09:43:12 +0100
From: Felix Fietkau <nbd@nbd.name>
To: linux-wireless@vger.kernel.org
Subject: [PATCH mt76-next 10/20] wifi: mt76: mt7915: hold the device mutex in the rate control work
Date: Tue, 24 Nov 2026 09:42:59 +0100
Message-ID: <20261124084309.1981968-10-nbd@nbd.name>
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

mt7915_mac_sta_rc_work() sends its rate control and SMPS updates
without dev->mt76.mutex. The L1 SER work holds the mutex while
MT76_MCU_RESET keeps commands from the firmware. The rate control work
can still run in that window, so its update does not reach the
firmware.

Hold the mutex across the updates, as mt7996_mac_sta_rc_work() does.
The work then waits for the end of the L1 SER.

Fixes: e57b7901469f ("mt76: add mac80211 driver for MT7915 PCIe-based chipsets")
Signed-off-by: Felix Fietkau <nbd@nbd.name>
---
 drivers/net/wireless/mediatek/mt76/mt7915/mac.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mac.c b/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
index e9b1704d1289..110d5368a8ee 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
@@ -2008,6 +2008,8 @@ void mt7915_mac_sta_rc_work(struct work_struct *work)
 	u32 changed;
 	LIST_HEAD(list);
 
+	mutex_lock(&dev->mt76.mutex);
+
 	spin_lock_bh(&dev->mt76.sta_poll_lock);
 	list_splice_init(&dev->sta_rc_list, &list);
 
@@ -2033,6 +2035,8 @@ void mt7915_mac_sta_rc_work(struct work_struct *work)
 	}
 
 	spin_unlock_bh(&dev->mt76.sta_poll_lock);
+
+	mutex_unlock(&dev->mt76.mutex);
 }
 
 void mt7915_mac_work(struct work_struct *work)
-- 
2.47.3

