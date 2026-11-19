Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795126171;
	b=XgpgBHKXmN2vxB9bKzHYhvsv24BIOb6pR9LQVUpPQWoqKj4LPRizF7rFMbpUA7mQv97e
	 C6Eib3wBTaD92bBXwS1fy+FHjeEGV4JSvsIsd8DTAbR6sU11tKo/hpdfSQyD7hEBxIqxP
	 RvPS3HMC5denaUMxw79qM2cLL7jpYJZqOxsTT6m9XGr0Cm+Y8QiTc1oUbJ5mAQgRaupKR
	 GNOJ4zFVWLgYttg5EqyQvmWMDkh6jDYOFMr2v1bkvdCgWpBp6rNFZBhGAEGF/eOOYvU4Y
	 3vu9W3xxD7F+ktHMAorsRU9pvj4qrDFv8D/zWK481p6WcOxlotFftrIzjfGilTiHTHA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795126171;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=OMjZMrhJv86Cng6vxv+Fe/VpQPBvZ92jIE9WWiWCjiI=;
	b=n3gypFYEKK6B+vUgW/Ql1v6P90YF2iF77kP/XyskYcn5Y2lc7YLaj6jrQDCwl2VBlgyU
	 ykIod6TFOuzhDAExWYV+zvJzOd/tMnhuCEv3NBH9kXZPmRQijKzTXSzQVmEGT3+UI6JP4
	 P2ZaehCiVXOPy5JhPdjWPSpYjHmH9jmyjotWb2MpOcrVlRZ/q3wdxDDv7NbnHLk91Fk+X
	 CNwk703C3YACToCLB0D9SK0KJQ0KdxLeXq3uEzw59TYNnLhIN9LZRynCn8uTi0T+RlN1Y
	 6xn5JBJ8b9xVVhGtl5knzfZOwn5Xv5zROoAB2UTS/Wd/PW7Rt1iJW66nRI6J0iGb9JQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QzNrrAcH;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA2DE60A260C;
	Thu, 19 Nov 2026 22:09:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QzNrrAcH
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795126171;
	b=0WGVF3RLNo7pv9NAHPyuceOTZPkyzdTgwgWFhdilEyLPj9bPzUTqSbcDUb1SOMAUuO0h
	 pJfjq5GrKABzQpgptcyrbt3KF7ZMuhTXRW3kO+1IOry8PorSJ7g8G7Ek0IIFL0FZv0IQp
	 KqbMfj+nSPEw1Z+v3h3OsqBSkm2UEaLdaYZd/AI/Vekf3/oo3JeM+fdF0kevsYFUqPZNW
	 EciokgLbC7CR8cK7rsPZxjiwcBkmckxwMfmdDlaHSqUoUU1C7EfH6jaNDtxmbb5iSEFFl
	 WzTd/H8XRH8/Rh0k7+g2REbRlgn/1xCsOndvIq2QgDOiz7azwscxgfEnSLE+kirAx/A==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795126171;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=OMjZMrhJv86Cng6vxv+Fe/VpQPBvZ92jIE9WWiWCjiI=;
	b=aD9ZWSwyou7nWS/cttBidp658ay+QSHyWyWN7Z0PMHwK10GLUAJLyGyFfcBhnkmOAD7O
	 z6lVGeXHhz5KsSJb6KRj+vbhS6D6yVF21nHi4oZMdQO2IbEK9X+MFrYipGd/t07n6X/4+
	 CDAnj/urDyq3jt6enmiR5T/t7pW+vouoY3UP+VeYQUxvyZsFUJ6tde7PVczH7FG9bnuFV
	 B+2gK8K4LWHbUTrvclRypMryZDj1HpeP7ol+R5MnpLlHRaKki7tavRtSHKhlgXclpTpv2
	 93zuTOi1PiY0yW0/mFVqRr38t4VWL/D0wdWuP+ylj8KqeprQSvxn5EMenr7LBkZOZiw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 97E511F000CA;
	Thu, 19 Nov 2026 22:09:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795126171;
	bh=OMjZMrhJv86Cng6vxv+Fe/VpQPBvZ92jIE9WWiWCjiI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=QzNrrAcHh3VyULJudeRFVikiIg+Deqk7xgbOo5iAGhFovJOHVC2WJ81a1IZ+yCqcI
	 fEXz9FcVjs1ZYzd/ztqQOkhOAnZBWCvMf0e5ckv9gZ90j4/lXt9I63zgCtNdwsYFl5
	 RqP9s2e+v0KXCcFWfGkVyusoxJ8xHPEUQevesoLz2snySb7k8ZIt4cmENdvnPuo8OB
	 AkjbY0RB9Zzqi/1VfYd0jatoGxzexTt4x7KkGGdXXnBO1J6nW4ma/+mcKONCwJV4jR
	 s+/tOjaXGB4nWwklLDXaUoDVIJm3j73quFZ34895Yb8ilwF9HWfaFMTKOqp2M4Onr7
	 1ZXGIHBJ38hYQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 23BF441B0C;
	Thu, 19 Nov 2026 22:09:30 +0000 (UTC)
From: Ahmet Zeren via B4 Relay <devnull+niko3x.proton.me@kernel.org>
Date: Fri, 20 Nov 2026 01:09:29 +0300
Subject: [PATCH rtw-next 2/3] wifi: rtl8xxxu: honour the retry count of
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
Message-Id: <20261120-b4-inject-v1-2-1e1693af0c6b@proton.me>
References: <20261120-b4-inject-v1-0-1e1693af0c6b@proton.me>
In-Reply-To: <20261120-b4-inject-v1-0-1e1693af0c6b@proton.me>
To: Jes Sorensen <Jes.Sorensen@gmail.com>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ping-Ke Shih <pkshih@realtek.com>, Ahmet Zeren <niko3x@proton.me>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795126169; l=3183;
 i=niko3x@proton.me; s=20261119; h=from:subject:message-id;
 bh=fY2p1RTdbGheeMu1sRky+i/mlFLrUXt2vgIPxb2pbA0=;
 b=1JE4sXPcxnUa9P/HS2a4uPiH3uMYeB0ELqmCa4bzpQ7PcSDJ0CsuQ8BI2J60/XEk2GkG5yWHj
 gcBcq5ASuS1AfznFr3gUr0SpkykXwV6WMcnu//WXuDtAiK3WwmalKjU
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
 drivers/net/wireless/realtek/rtl8xxxu/core.c | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/drivers/net/wireless/realtek/rtl8xxxu/core.c b/drivers/net/wireless/realtek/rtl8xxxu/core.c
index 969875fd54..b159d9b64c 100644
--- a/drivers/net/wireless/realtek/rtl8xxxu/core.c
+++ b/drivers/net/wireless/realtek/rtl8xxxu/core.c
@@ -5245,6 +5245,24 @@ static bool rtl8xxxu_tx_rate_inject(struct ieee80211_tx_info *tx_info,
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
@@ -5262,9 +5280,11 @@ rtl8xxxu_fill_txdesc_v1(struct ieee80211_hw *hw, struct ieee80211_hdr *hdr,
 	u8 tid = qc[0] & IEEE80211_QOS_CTL_TID_MASK;
 	u32 rate = 0;
 	u16 seq_number;
+	int retries;
 	bool inject;
 
 	inject = rtl8xxxu_tx_rate_inject(tx_info, &rate, &sgi);
+	retries = rtl8xxxu_tx_retry_inject(tx_info);
 
 	if (rtl8xxxu_debug & RTL8XXXU_DEBUG_TX)
 		dev_info(dev, "%s: TX rate: %d, pkt size %u\n",
@@ -5314,6 +5334,12 @@ rtl8xxxu_fill_txdesc_v1(struct ieee80211_hw *hw, struct ieee80211_hdr *hdr,
 		tx_desc->txdw4 |= cpu_to_le32(TXDESC32_USE_DRIVER_RATE |
 					      TXDESC_DISABLE_DATA_FB);
 
+	if (retries >= 0) {
+		tx_desc->txdw5 &= ~cpu_to_le32(TXDESC32_RETRY_LIMIT_MASK);
+		tx_desc->txdw5 |= cpu_to_le32(retries << TXDESC32_RETRY_LIMIT_SHIFT |
+					      TXDESC32_RETRY_LIMIT_ENABLE);
+	}
+
 	/*
 	 * rts_rate is zero if RTS/CTS or CTS to SELF are not enabled
 	 */
@@ -7979,6 +8005,8 @@ static int rtl8xxxu_probe(struct usb_interface *interface,
 	SET_IEEE80211_PERM_ADDR(hw, priv->mac_addr);
 
 	hw->extra_tx_headroom = priv->fops->tx_desc_size;
+	/* The TX descriptor retry limit is 6 bits wide */
+	hw->max_rate_tries = 64;
 	ieee80211_hw_set(hw, SIGNAL_DBM);
 
 	/*

-- 
2.56.1


