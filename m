Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795327175;
	b=anLzAW3L6PzNHqE2KOhyUYZM+fAdzACLxCh5NLQZFvnnoiYhx29utV0RZ8oaPKGwJdqu
	 xKBkc1dDeI2EtgEoJNKSmGHp/d0/88fkROUnoB53Yq8PQ+dibyvp7wkcfQMHNCPt4GTkA
	 uTVYTrdE6pvCk78w0tpSxYSngofvE50L8JwloH1IA8z+OHdcsNDbkx7Ewfz3FUXQKI0Q+
	 zLPAJPsxcSymO9zDbF4v8GoTxEXUJNovfg1urLpdY+v8is+mAz/V3r5UjGstG01FGza1x
	 e2iVLRvcW6WjOVnS0jCnAJ5+WPYWlW7k9rDYs9YYiybpnE0u7y5wU1LheIGeeqrMn/w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795327175;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=FzyW/JeqFmBU1+VELVgW1H90RaJMDqI+w29HScAYcG0=;
	b=kJ+lRHRjefkZoidAE6rTDSaXn9XCTx7LueaA0/P/YKteD8xRQurjO+liLiFE1UILb9hH
	 YYzUEKPI9urTEm9T9nc+VST59+x0Du4eR59c9xE8q3Z1fgIojSCqMVgxWaF2QURANpdrP
	 o5NR9yIPtnTd019ppBqZn4Vjbcdj648TneyF6bEZQGiLLeHNrMEoPmhn1172/ZydK2LfT
	 0ye3lbH5YBI9Q6d7HM3Lv7YaAd1HKdU5yiQQq/qnhfGRuBT5O/ncstSCCPFXihY0pCKVk
	 SoqjmFA23StDd+evRNUOqk6dJA6dAZ6smEU8zwc5atHhwpIchBE4CINx7qYku9g4xcQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=W1vhIP3q;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AA96606A332;
	Sun, 22 Nov 2026 05:59:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=W1vhIP3q
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795327175;
	b=l1a6CKeF6yw8zAbnbXZR9iPXeITe5lRS+HZWePkxmCpE+hfO2210OkaC+4ZH/XjapuNl
	 D/whYa/ecsWPwmnJXQIe0t8EiK7yECnkz/ppvgrk4bcfUSoIcQglZ3ypfdhnN5CPAns+c
	 y9LUoc+ZcNPDqmXKLB2P1Z4GFJf9xEdXXq91N7mDaUR+7nNk7VRy09+9fzU1d3G4dbjPb
	 0Uk+uXlT3bVNt4griCBOGQub3fLDuXjwY0rV+NYR02msQbku1rj/Xm2clQKFcAwF0dnNz
	 AxafOhqD41lmsnvz5w8YsAyB64LNYjjNYJJ5nPkDID3ZXjDCKI/iMVU4F9L+bOic41A==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795327175;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=FzyW/JeqFmBU1+VELVgW1H90RaJMDqI+w29HScAYcG0=;
	b=v8569zUc80mkV4iNe3e0WAZh03PwY70Kkm9D54CgawHeJhy8mPQ0RoBW2RYQAmute0oV
	 E3jYpzYa6n0L51a///Lk8MXL4a+yEp7urn0uRXiXgGYYI9JnkCjyFHkCWe1p5IkC8SlUK
	 ZtCdTpAukbokC7LKh3uEXUyB7dIia3dWcN7hOx3s+zwYnLwVuuF+UPkHyt4JbzLPtA3FX
	 sq1upwDHo4FxAEbze4MBYktLyiLWkKZQ+XTVVfairyk5ovkljXww5fRQbxnEfOkf3lm/Y
	 5svdQPqb0X3u0S9Tkks1KO//bndQK5kz7frAQqTV/+FYarf4uqtV9kIACnIMjdlZj7w==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 2BC711F000CF;
	Sun, 22 Nov 2026 05:59:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795327175;
	bh=FzyW/JeqFmBU1+VELVgW1H90RaJMDqI+w29HScAYcG0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=W1vhIP3qgPVNCR+WsV5VB1NZ/2trrDLjmd33rx5BRsAo1HsQyzjqjWzry/qVgmdRX
	 N2zE5g/7SIMUNk3uYL8aXZryX5Ck4wWQQnWc7iLXszoz5IuILgRzbn8D/DuZVXClfu
	 VnNds4rbMgkQcFSz4e82beVd9Vu3PJOa13235rSyRFwJyJ1g7LIoQd5qjOjKN+Uebi
	 rTqVmeRazFqylROWkEi2PyO/uvdo8kP3xMWMOyn3erIe0ikHcNKNARoiDlgL9cz/KT
	 GTcmM3CYhtze2KJFTY29Ldjslk2LwHQn8H6PVkZ6m3mmbsmWjeQ6FBO9EmI/6z6SEX
	 NAnLd4YxgtEzA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id AC8BF4BF6E;
	Sun, 22 Nov 2026 05:59:33 +0000 (UTC)
From: Ahmet Zeren via B4 Relay <devnull+niko3x.proton.me@kernel.org>
Date: Sun, 22 Nov 2026 08:59:30 +0300
Subject: [PATCH rtw-next v2 2/3] wifi: rtl8xxxu: honour the retry count of
 injected frames on gen1 chips
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
Message-Id: <20261122-b4-inject-v2-2-0ee720fe706d@proton.me>
References: <20261122-b4-inject-v2-0-0ee720fe706d@proton.me>
In-Reply-To: <20261122-b4-inject-v2-0-0ee720fe706d@proton.me>
To: Jes Sorensen <Jes.Sorensen@gmail.com>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ping-Ke Shih <pkshih@realtek.com>, Ahmet Zeren <niko3x@proton.me>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795327172; l=3823;
 i=niko3x@proton.me; s=20261119; h=from:subject:message-id;
 bh=yewKtZbOqiVYEC6A4BqBFsXNHbOn+2HnCr+UJYQVgPo=;
 b=D6zkB2jmTTpgLJ8ErJv9qZKFf5p9VjLsJnh64bkAJ+jNqnxxccgwufuRPQDJnsCaLbYYIlDwd
 ougwPO+IpQZCQuvqLFyEkF5N28F6qgLJcsCcxZzUYEsx5Uq5JymDrb3
X-Developer-Key: i=niko3x@proton.me; a=ed25519;
 pk=J4zNm2pudzQ/wF+pQ8xO+wW6jpcNa9EJ2C1g4DUAjhM=
X-Endpoint-Received: by B4 Relay for niko3x@proton.me/20261119 with
 auth_id=1575
X-Original-From: Ahmet Zeren <niko3x@proton.me>
Reply-To: niko3x@proton.me
Content-Transfer-Encoding: 7bit

From: Ahmet Zeren <niko3x@proton.me>

max_rate_tries is never set, so mac80211 clamps the retry count of every
injected frame to zero and the radiotap retries field has no effect.
Injected frames also ignore IEEE80211_TX_CTL_NO_ACK and use the default
hardware retry limit of 48. Unicast frames to an absent station then
take seconds each, which stalls all injection behind them.

Advertise the 6-bit retry limit of the TX descriptor, and on gen1 chips
program the retry limit of injected frames: none when no ACK is
expected, otherwise the radiotap retry count.

Tested on RTL8192CU (0bda:8178): 40 unicast frames at 1 Mbps to an
absent station drain in ~0.13 s with NOACK or 0 retries, ~0.45 s with
2, ~1.1 s with 4 and ~3.3 s with 6 retries. Without this patch the same
frames had not drained after 100 s, even with NOACK.

Signed-off-by: Ahmet Zeren <niko3x@proton.me>
---
 drivers/net/wireless/realtek/rtl8xxxu/core.c     | 29 +++++++++++++++++++++++-
 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.h |  1 +
 2 files changed, 29 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/realtek/rtl8xxxu/core.c b/drivers/net/wireless/realtek/rtl8xxxu/core.c
index 3b77a7ce884..7d6f5243f64 100644
--- a/drivers/net/wireless/realtek/rtl8xxxu/core.c
+++ b/drivers/net/wireless/realtek/rtl8xxxu/core.c
@@ -5241,6 +5241,24 @@ static bool rtl8xxxu_tx_rate_inject(struct ieee80211_tx_info *tx_info,
 	return true;
 }
 
+/*
+ * Retry limit of an injected frame: none if no ACK is expected, else the
+ * radiotap retry count. -1 leaves it to the hardware.
+ */
+static int rtl8xxxu_tx_retry_inject(struct ieee80211_tx_info *tx_info)
+{
+	if (!(tx_info->flags & IEEE80211_TX_CTL_INJECTED))
+		return -1;
+
+	if (tx_info->flags & IEEE80211_TX_CTL_NO_ACK)
+		return 0;
+
+	if (tx_info->control.flags & IEEE80211_TX_CTRL_RATE_INJECT)
+		return tx_info->control.rates[0].count - 1;
+
+	return -1;
+}
+
 /*
  * Fill in v1 (gen1) specific TX descriptor bits.
  * This format is used on 8188cu/8192cu/8723au
@@ -5258,9 +5276,11 @@ rtl8xxxu_fill_txdesc_v1(struct ieee80211_hw *hw, struct ieee80211_hdr *hdr,
 	u8 tid = qc[0] & IEEE80211_QOS_CTL_TID_MASK;
 	u32 rate = 0;
 	u16 seq_number;
+	int retries;
 	bool inject;
 
 	inject = rtl8xxxu_tx_rate_inject(tx_info, &rate, &sgi);
+	retries = rtl8xxxu_tx_retry_inject(tx_info);
 
 	if (rtl8xxxu_debug & RTL8XXXU_DEBUG_TX)
 		dev_info(dev, "%s: TX rate: %d, pkt size %u\n",
@@ -5283,7 +5303,13 @@ rtl8xxxu_fill_txdesc_v1(struct ieee80211_hw *hw, struct ieee80211_hdr *hdr,
 	if (ieee80211_is_mgmt(hdr->frame_control)) {
 		tx_desc->txdw5 = cpu_to_le32(rate);
 		tx_desc->txdw4 |= cpu_to_le32(TXDESC32_USE_DRIVER_RATE);
-		tx_desc->txdw5 |= cpu_to_le32(6 << TXDESC32_RETRY_LIMIT_SHIFT);
+		if (retries < 0)
+			retries = 6;
+	}
+
+	if (retries >= 0) {
+		tx_desc->txdw5 |= le32_encode_bits(retries,
+						   TXDESC32_RETRY_LIMIT_MASK);
 		tx_desc->txdw5 |= cpu_to_le32(TXDESC32_RETRY_LIMIT_ENABLE);
 	}
 
@@ -7975,6 +8001,7 @@ static int rtl8xxxu_probe(struct usb_interface *interface,
 	SET_IEEE80211_PERM_ADDR(hw, priv->mac_addr);
 
 	hw->extra_tx_headroom = priv->fops->tx_desc_size;
+	hw->max_rate_tries = TXDESC32_RETRY_LIMIT_MAX + 1;
 	ieee80211_hw_set(hw, SIGNAL_DBM);
 
 	/*
diff --git a/drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.h b/drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.h
index 8cbadcf7190..8f75be83e9e 100644
--- a/drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.h
+++ b/drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.h
@@ -575,6 +575,7 @@ struct rtl8xxxu_txdesc40 {
 #define TXDESC32_RETRY_LIMIT_ENABLE	BIT(17)
 #define TXDESC32_RETRY_LIMIT_SHIFT	18
 #define TXDESC32_RETRY_LIMIT_MASK	0x00fc0000
+#define TXDESC32_RETRY_LIMIT_MAX	63
 
 /* Word 6 */
 #define TXDESC_MAX_AGG_SHIFT		11

-- 
2.56.1


