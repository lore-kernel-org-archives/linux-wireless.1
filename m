Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795126172;
	b=F+XzSEB5ZcMv9WWPXAEC73qKixsBPDLki7MLUfrWblhGzs0P6tsUIke5QV77EfiqAoR9
	 R0cm9NCZIvchIP6lwNshRXr+WHtI+s2J5By0q5+IJ/e//DkBYpJIsBfdNrAexjKt539k2
	 LKQljfJgxEPSx/geRllFujkJyFnWXqCk+8xU3dMhJHEXZXjFUb4aXtfr8c5EUoX4kpD8D
	 2ftSJwbjo85qP6YWfsSZWSIFuXRPrhokAXEhyUFBkog+N8LWf0lPbo/2qnNWQd9Z1tYt3
	 oXjGGps1L3wPKWzG30SFthcJLC9ddKOsDBrgbanRnWv6XHeb/+bA6wgx6aNWPOVfPfw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795126172;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=bXVEp1ninvZ6XD6MjL/l/xYnNXX4qHh7UMv14xrtqys=;
	b=mggg7+F46VSHRnPQUx4lN7WaMd+6Sdhb3+RXQAH0Mcg+xgnGoUEeO+xzCcks3TVMg2Fc
	 C1hLxIzod1ImHNmZT36s/WnFJTs1XHYrBTa2E22aJux5Xd3AWwhu9OCUoNQgJHZz3Nulk
	 TaIO80gArTNqiLfre/DtT53+IkqWgyf2k/3cfboQEUaKsuc8aqIb4ix4NndI2cI9ABk6t
	 7/j3JkjzVjIUSgBKXw9kADH41HeXqz+nQMPpSebmPUXae0xQ54tRxOgi4wNdEhcgvM3P2
	 wzWVfYS3/9Ul8aGntNMa6zBQTwrumYsSLgS3fZ5+q++pir9aFTMKqpKcH0mm2F0w6rA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eYXwYiNj;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20AB160A2618;
	Thu, 19 Nov 2026 22:09:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eYXwYiNj
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795126172;
	b=QBHYW5O5zDTmLuS9QbqnGS+rWiqBDPA7AIRUzXqLku2KvLSXb8kZ3coTdt3VHR/f/Rld
	 RBbtBxwt5ONzQhyagUV1OUN8EN0F2Zx57Dcs86pHB2digHpKOTihkKk8/yQjqRAXuuzwJ
	 MGclxo6SJZ/QHee5Ti1bsXIeZVEMOxe9LgrKojklAULnsrDwDzMAaeSdf1KafNNWjFv3x
	 15DBXuvSYus4yr+S6YTBfBs7zLdQTR9Y+bSqU6HQ0yH+E+6DLrdy1+4mz9jeJ/32rD4o6
	 8Ao8379YnJQjAnR8HHxMfhMOU08adc+Wbop7aPWI0CHju8+PwY4qXg09WOHcZQKd+vw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795126172;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=bXVEp1ninvZ6XD6MjL/l/xYnNXX4qHh7UMv14xrtqys=;
	b=a3Lo+jarolxrU7bGOZgMfhXu4N5L0Us79JlZlYyAGc9bEN7GGa9rRafVBDG687W/BRig
	 21SfDToLrm6TakiOKKH63o3JHJ9dmL1HY0+ulDWb5HyMytozE/ZIJuYs/7bZqx9cwOBDX
	 ZA0MXmb2++n887+3uDYCyc9kCVu7JOD1q7oyrrLSn4cjfaWU+MaKr1teGG/kXrSYOYcnI
	 7fbEfBjyBvGT2nzCUP7u9DsNNc8UXfHShmIHbhhXYN/cd05vdQjXnOO6J3feXaGQr7lcr
	 NBVvxALh9kNJ7SfRg6N8KtEkmV9X7UndsBBPXjXvUJdrQxSkml2MGczxXDfUwxUpxvA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B43861F000CF;
	Thu, 19 Nov 2026 22:09:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795126171;
	bh=bXVEp1ninvZ6XD6MjL/l/xYnNXX4qHh7UMv14xrtqys=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=eYXwYiNjjXbo2ylklgnBUe7IxRAu5UCu0GRtvKuaiZoD0DsIzUSCYK1PXOS7XGsfA
	 cqKE9+3IsmlZ0Gi70svMI998sYqNtJ5wik9b1i97oqjyrS6KNpUfNj0d/FoqwNCKdX
	 DQMXeBsrQMMBjJZOuqP2xhY2FFww7YWKbVLxQGY6HMfnr258XS62XOM8FYP8uS5dlW
	 gVdZexlnxCatD+oE9GOv+2eH3d7VI3r77LPPX/NLlb0ecOETqM72jKzNi324FQKzLj
	 LkcXcf0b+FALgQxjyRXeukBsZmf+0LNx8/8pzMtu0sqgCvyssXVST7nPGJKzcVMrHJ
	 GWyjnliDMx26Q==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 3FB4741B13;
	Thu, 19 Nov 2026 22:09:30 +0000 (UTC)
From: Ahmet Zeren via B4 Relay <devnull+niko3x.proton.me@kernel.org>
Date: Fri, 20 Nov 2026 01:09:30 +0300
Subject: [PATCH rtw-next 3/3] wifi: rtl8xxxu: honour the bandwidth of
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
Message-Id: <20261120-b4-inject-v1-3-1e1693af0c6b@proton.me>
References: <20261120-b4-inject-v1-0-1e1693af0c6b@proton.me>
In-Reply-To: <20261120-b4-inject-v1-0-1e1693af0c6b@proton.me>
To: Jes Sorensen <Jes.Sorensen@gmail.com>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ping-Ke Shih <pkshih@realtek.com>, Ahmet Zeren <niko3x@proton.me>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795126169; l=2279;
 i=niko3x@proton.me; s=20261119; h=from:subject:message-id;
 bh=cgDO+n3WV6Vh8wxRWJUQAqpyeDXdpbygJIebL2kFlww=;
 b=Mml2AAdezEQOS6oiWzbjcmSCJUOd/wjJRJUNijHDfICoUpvRObKvdXJGT6DmvxCgv0/5gNrtf
 Cn8TTWDTh18C1t/jifxC3xagTYhcF0EcesW3C3bDa9L8AfRPfqyZA3S
X-Developer-Key: i=niko3x@proton.me; a=ed25519;
 pk=J4zNm2pudzQ/wF+pQ8xO+wW6jpcNa9EJ2C1g4DUAjhM=
X-Endpoint-Received: by B4 Relay for niko3x@proton.me/20261119 with
 auth_id=1575
X-Original-From: Ahmet Zeren <niko3x@proton.me>
Reply-To: niko3x@proton.me
Content-Transfer-Encoding: 7bit

From: Ahmet Zeren <niko3x@proton.me>

Injected frames are always sent at 20 MHz, even when they ask for 40 MHz
on a 40 MHz channel, because only QoS data frames get the 40 MHz bits in
the TX descriptor.

Set them for injected frames with IEEE80211_TX_RC_40_MHZ_WIDTH.

Tested on RTL8192CU (0bda:8178) on channel 6 HT40+ and HT40-, received
by a second radio sniffing at 40 MHz: MCS 0 and 7 requested at 40 MHz
arrive at 40 MHz (without this patch: 20 MHz), requested at 20 MHz they
stay at 20 MHz.

Signed-off-by: Ahmet Zeren <niko3x@proton.me>
---
 drivers/net/wireless/realtek/rtl8xxxu/core.c | 23 ++++++++++++++---------
 1 file changed, 14 insertions(+), 9 deletions(-)

diff --git a/drivers/net/wireless/realtek/rtl8xxxu/core.c b/drivers/net/wireless/realtek/rtl8xxxu/core.c
index b159d9b64c..2eef4585a8 100644
--- a/drivers/net/wireless/realtek/rtl8xxxu/core.c
+++ b/drivers/net/wireless/realtek/rtl8xxxu/core.c
@@ -5281,7 +5281,7 @@ rtl8xxxu_fill_txdesc_v1(struct ieee80211_hw *hw, struct ieee80211_hdr *hdr,
 	u32 rate = 0;
 	u16 seq_number;
 	int retries;
-	bool inject;
+	bool inject, bw40;
 
 	inject = rtl8xxxu_tx_rate_inject(tx_info, &rate, &sgi);
 	retries = rtl8xxxu_tx_retry_inject(tx_info);
@@ -5311,17 +5311,22 @@ rtl8xxxu_fill_txdesc_v1(struct ieee80211_hw *hw, struct ieee80211_hdr *hdr,
 		tx_desc->txdw5 |= cpu_to_le32(TXDESC32_RETRY_LIMIT_ENABLE);
 	}
 
-	if (ieee80211_is_data_qos(hdr->frame_control)) {
+	if (ieee80211_is_data_qos(hdr->frame_control))
 		tx_desc->txdw4 |= cpu_to_le32(TXDESC32_QOS);
 
-		if (conf_is_ht40(&hw->conf)) {
-			tx_desc->txdw4 |= cpu_to_le32(TXDESC_DATA_BW);
+	if (inject)
+		bw40 = tx_info->control.rates[0].flags & IEEE80211_TX_RC_40_MHZ_WIDTH;
+	else
+		bw40 = ieee80211_is_data_qos(hdr->frame_control) &&
+		       conf_is_ht40(&hw->conf);
 
-			if (conf_is_ht40_minus(&hw->conf))
-				tx_desc->txdw4 |= cpu_to_le32(TXDESC_PRIME_CH_OFF_UPPER);
-			else
-				tx_desc->txdw4 |= cpu_to_le32(TXDESC_PRIME_CH_OFF_LOWER);
-		}
+	if (bw40) {
+		tx_desc->txdw4 |= cpu_to_le32(TXDESC_DATA_BW);
+
+		if (conf_is_ht40_minus(&hw->conf))
+			tx_desc->txdw4 |= cpu_to_le32(TXDESC_PRIME_CH_OFF_UPPER);
+		else
+			tx_desc->txdw4 |= cpu_to_le32(TXDESC_PRIME_CH_OFF_LOWER);
 	}
 
 	if (short_preamble)

-- 
2.56.1


