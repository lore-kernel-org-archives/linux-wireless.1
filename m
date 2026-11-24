Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795509162;
	b=K/nNBA3fXmoVtz9alNqIG6ZSqUU+EDfIb0Jy6JHQOM0YtBpf6t8Tl35JH4C+ztfBjR3J
	 hzstSApfveMiigl5etZW1+ZZx9fT5LyCng81t4TpZhhhq91uFKgKpHEiJXiFQ/nSN3V1Q
	 hkNmG4GlxLykiRAYiuBiaBmnxaIOkpX+me5TNuzP6Mv7yPj8UZYfFFqKakVKO1OLQYtVz
	 mIuVZVFGzlsvxftEzlv3j2EYFizrlZ42HnElURVZmmhNkefmhTwF7mlIfgL6ttUxS6frR
	 5HKW1+GP5WPBkvdhVIO7jGnakVGVUIXxoTnFkA4F4IrZJvUkJxtUry5hasBivG8o37A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795509162;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=7RXJzpMXcdcjo84X4HdznRMPy8gn4lses3aXfVFi/aM=;
	b=1uQYv5E9qkvoEcp+frNLMHHDS+DVXjGCksHUV8pp0m9NsO7Adw+qqbsUdEJ0cCPxRBE8
	 CzG5aBu3xAAJNZOfHCKuN6ReT+SML0CiBl7i7fj92+eOA6gbPUJrZM6g4o/0w0bsb0BQ1
	 w5Aj3jIvd33FxklPybw3nqXx9FbU6WgQuLYpZ6NUFMEBja7M09goEuWU/tVCAUT4KtNTQ
	 Rs5es5WOo3J4Q03rL2D0M5UbQhwxeCEriPw8IiCkzOa+ZdjLoK3VpOs+rGacqCDvqzVBb
	 iQD1//wkfxbArSsYJgW6Fu0Knzb4R2icJkcmGX28toRfc1hC8DgHzvda9lDZfoJ/rPg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XOQ3Yuc1;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81868606A33C;
	Tue, 24 Nov 2026 08:32:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XOQ3Yuc1
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795509162;
	b=qrITRsx3bdDAGcZLofLW9JtajcSQrF3snG0welXx91gbM7eWWnW5UyYMvWtcxuLjsfhq
	 wdRsv6fVmyWtwsl7NSzii7YhTfPHR6ARymXfpwYNmgGm+uSnLkLUqu8g9mPzzs+mpL5xH
	 tojPnIJYVBQ+pbOLUEQQWZrindw5sLaUqjdOJtCW2PVFSv8y4wUxq8eBAfm+g89fbMQ+V
	 qy2/HQSmuK4UA8p9uj/uGRdL4WhjepZY/M1VhNfQNfD7xFq2ovdNk1zFy7GDU1mrN1yp1
	 YDH4Dr9xuhczkiN8XDGG412wNX5ntqwgm87hR3/Rwx41iPd2goE9ubWm0Pp0FrKFp+A==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795509162;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=7RXJzpMXcdcjo84X4HdznRMPy8gn4lses3aXfVFi/aM=;
	b=PFTCYyPOl6auCaNhjdhPgPmudEWddL9Tiz72oJldU08NtQ4+9SUcpJF/eX0HZLlNE/GB
	 /D7mw4b0WW38k0wJ37FeICCGha1KdIVic56D2XIVm0TQXJww2k0CD+x5YfTj2KxEsEDpO
	 Nmj9ibovLrAo57Ta26IVuc0oR6WjGpN/kxu6GrOGsp8QDZRdkVZvk2v68WcJWXOC/iy/6
	 NRZpO2pjzAw0gsavRjylOLpi1PeQhJQLT/10zXaVc1QX+UsFi59e/61ofyQLw+HqeZ25T
	 NuvbrRjbUYqO3lQmkpCZbNRyaWm2yVR9ee7eoXO9nAst6kOjXzzhGibPiSz1yhxQZ+g==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 989DE1F000D4;
	Tue, 24 Nov 2026 08:32:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795509162;
	bh=7RXJzpMXcdcjo84X4HdznRMPy8gn4lses3aXfVFi/aM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=XOQ3Yuc15NTimn+pqjzyQ5+EH5ruBI3n/XZk/SpmygR1cHXgJAy5jVbh+gcZKAP2x
	 MG9Uye86MdNXGD+eBqroWYQ6VVdGn+iEFhjs5lnFpIgkQMmTs82tx4e7dfjZ2oFywc
	 x7v5ozSNFU/lPwc9QfZSJgcqv/UkAU8lUkMqe/vnQYmkhrBTYmHDaaST8GuIDOgi3E
	 LLepnqLTAeaDDbbIJLWMPwC1m33ny/OfwEtcGW+crEnXO6g2Z/ew6SyMOINrolOGMB
	 UKZKJHi6QdJxWHI2u5/UatWYaFYuIRrI0Hq5RHrCYL4DkJYMzAhLTr+zjgMuA2tQfX
	 n0nGZkq03rT9w==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 24B054C94D;
	Tue, 24 Nov 2026 08:32:33 +0000 (UTC)
From: Ahmet Zeren via B4 Relay <devnull+niko3x.proton.me@kernel.org>
Date: Tue, 24 Nov 2026 11:32:31 +0300
Subject: [PATCH RFT rtw-next 2/2] wifi: rtw88: honour the retry count and
 NO_ACK of injected frames
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261124-b4-rtw88-inject-v1-2-f7457e496924@proton.me>
References: <20261124-b4-rtw88-inject-v1-0-f7457e496924@proton.me>
In-Reply-To: <20261124-b4-rtw88-inject-v1-0-f7457e496924@proton.me>
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: linux-wireless@vger.kernel.org, Luka Gejak <luka.gejak@linux.dev>, 
 Bitterblue Smith <rtl8821cerfe2@gmail.com>, linux-kernel@vger.kernel.org, 
 Ahmet Zeren <niko3x@proton.me>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795509151; l=4592;
 i=niko3x@proton.me; s=20261119; h=from:subject:message-id;
 bh=P8lvRCzG6fpHi/tqzMoNPdSQh0NV1CjvLgpbMPnKJpo=;
 b=5KYeBfscB6H6QeenrOPz0zeTLUR/0k2y6p2x8t6m6L1DnW+vQzWO8mCIg2FiPQcRFwEgT4eH9
 ZaHaXiUrEONCYRjXJocz8XtxVsU7rr0AfX25MwznYYBf+JKPXXjwM1z
X-Developer-Key: i=niko3x@proton.me; a=ed25519;
 pk=J4zNm2pudzQ/wF+pQ8xO+wW6jpcNa9EJ2C1g4DUAjhM=
X-Endpoint-Received: by B4 Relay for niko3x@proton.me/20261119 with
 auth_id=1575
X-Original-From: Ahmet Zeren <niko3x@proton.me>
Reply-To: niko3x@proton.me
Content-Transfer-Encoding: 7bit

From: Ahmet Zeren <niko3x@proton.me>

max_rate_tries is not set, so mac80211 clamps the radiotap retry count
of injected frames to zero, and the TX descriptor retry limit is never
programmed. Injected unicast frames, even NO_ACK ones, are retried up to
the default limit, so frames to an absent station stall injection. The
TX report path also reports NO_ACK frames as not acked.

Set max_rate_tries to IEEE80211_MAX_TX_RETRY, the most mac80211 can
pass, and program the TX descriptor retry limit for injected frames: no
retries for NO_ACK frames, otherwise the radiotap retry count. Report
NO_ACK frames as IEEE80211_TX_STAT_NOACK_TRANSMITTED, like rtw89 does
since commit 92608bb5f14f ("wifi: rtw89: honor ASSIGN_SEQ, retries, and
NO_ACK for injected frames"). The retry limit fields are at the same
place as TXDESC40_RETRY_LIMIT_* in the RTL8192EU/RTL8723BU TX descriptor
of rtl8xxxu.

Signed-off-by: Ahmet Zeren <niko3x@proton.me>
---
 drivers/net/wireless/realtek/rtw88/main.c |  1 +
 drivers/net/wireless/realtek/rtw88/main.h |  2 ++
 drivers/net/wireless/realtek/rtw88/tx.c   | 14 +++++++++++++-
 drivers/net/wireless/realtek/rtw88/tx.h   |  2 ++
 4 files changed, 18 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/realtek/rtw88/main.c b/drivers/net/wireless/realtek/rtw88/main.c
index 826e1bc3724..dd7197380ad 100644
--- a/drivers/net/wireless/realtek/rtw88/main.c
+++ b/drivers/net/wireless/realtek/rtw88/main.c
@@ -2273,6 +2273,7 @@ int rtw_register_hw(struct rtw_dev *rtwdev, struct ieee80211_hw *hw)
 		max_tx_headroom += RTW_SDIO_DATA_PTR_ALIGN;
 
 	hw->extra_tx_headroom = max_tx_headroom;
+	hw->max_rate_tries = IEEE80211_MAX_TX_RETRY;
 	hw->queues = IEEE80211_NUM_ACS;
 	hw->txq_data_size = sizeof(struct rtw_txq);
 	hw->sta_data_size = sizeof(struct rtw_sta_info);
diff --git a/drivers/net/wireless/realtek/rtw88/main.h b/drivers/net/wireless/realtek/rtw88/main.h
index 525f17590ad..9c809544113 100644
--- a/drivers/net/wireless/realtek/rtw88/main.h
+++ b/drivers/net/wireless/realtek/rtw88/main.h
@@ -625,6 +625,8 @@ struct rtw_tx_pkt_info {
 	bool stbc;
 	bool ldpc;
 	bool dis_rate_fallback;
+	bool rty_lmt_en;
+	u8 data_rty_lmt;
 	bool bmc;
 	bool use_rate;
 	bool ls;
diff --git a/drivers/net/wireless/realtek/rtw88/tx.c b/drivers/net/wireless/realtek/rtw88/tx.c
index dd5537d0cf1..f0ff8c70a1f 100644
--- a/drivers/net/wireless/realtek/rtw88/tx.c
+++ b/drivers/net/wireless/realtek/rtw88/tx.c
@@ -66,7 +66,9 @@ void rtw_tx_fill_tx_desc(struct rtw_dev *rtwdev,
 		      le32_encode_bits(pkt_info->nav_use_hdr, RTW_TX_DESC_W3_NAVUSEHDR) |
 		      le32_encode_bits(pkt_info->ampdu_factor, RTW_TX_DESC_W3_MAX_AGG_NUM);
 
-	tx_desc->w4 = le32_encode_bits(pkt_info->rate, RTW_TX_DESC_W4_DATARATE);
+	tx_desc->w4 = le32_encode_bits(pkt_info->rate, RTW_TX_DESC_W4_DATARATE) |
+		      le32_encode_bits(pkt_info->rty_lmt_en, RTW_TX_DESC_W4_RTY_LMT_EN) |
+		      le32_encode_bits(pkt_info->data_rty_lmt, RTW_TX_DESC_W4_DATA_RTY_LMT);
 
 	if (rtwdev->chip->old_datarate_fb_limit)
 		tx_desc->w4 |= le32_encode_bits(0x1f, RTW_TX_DESC_W4_DATARATE_FB_LIMIT);
@@ -224,6 +226,8 @@ static void rtw_tx_report_tx_status(struct rtw_dev *rtwdev,
 
 	info = IEEE80211_SKB_CB(skb);
 	ieee80211_tx_info_clear_status(info);
+	if (info->flags & IEEE80211_TX_CTL_NO_ACK)
+		info->flags |= IEEE80211_TX_STAT_NOACK_TRANSMITTED;
 	if (acked)
 		info->flags |= IEEE80211_TX_STAT_ACK;
 	else
@@ -412,6 +416,14 @@ static void rtw_tx_injected_pkt_info_update(struct rtw_dev *rtwdev,
 	struct ieee80211_tx_rate *rate = &info->control.rates[0];
 	u8 nss, mcs;
 
+	if (info->flags & IEEE80211_TX_CTL_NO_ACK) {
+		pkt_info->rty_lmt_en = true;
+		pkt_info->data_rty_lmt = 0;
+	} else if (rate->count) {
+		pkt_info->rty_lmt_en = true;
+		pkt_info->data_rty_lmt = rate->count - 1;
+	}
+
 	if (!(info->control.flags & IEEE80211_TX_CTRL_RATE_INJECT))
 		return;
 
diff --git a/drivers/net/wireless/realtek/rtw88/tx.h b/drivers/net/wireless/realtek/rtw88/tx.h
index 168f48e8785..b6c687d33db 100644
--- a/drivers/net/wireless/realtek/rtw88/tx.h
+++ b/drivers/net/wireless/realtek/rtw88/tx.h
@@ -46,6 +46,8 @@ struct rtw_tx_desc {
 #define RTW_TX_DESC_W3_MAX_AGG_NUM GENMASK(21, 17)
 #define RTW_TX_DESC_W4_DATARATE GENMASK(6, 0)
 #define RTW_TX_DESC_W4_DATARATE_FB_LIMIT GENMASK(12, 8)
+#define RTW_TX_DESC_W4_RTY_LMT_EN BIT(17)
+#define RTW_TX_DESC_W4_DATA_RTY_LMT GENMASK(23, 18)
 #define RTW_TX_DESC_W4_RTSRATE GENMASK(28, 24)
 #define RTW_TX_DESC_W5_DATA_SHORT BIT(4)
 #define RTW_TX_DESC_W5_DATA_BW GENMASK(6, 5)

-- 
2.56.1


