Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795126373;
	b=0Q9Jqpjdy3jv+QaAv7u7ZFgSOPG+xq5GeLvXKHJDzlm/Nv9cmhHhkhxDlBRC/ArpXCfc
	 GxS/MYH6LZf82OC83qNhh1Bc2N07aM/kc9FA6+jDXyZLE0/j307DgDDvGkg9T/OOtFbmq
	 bBw/c5D8nUrrmV9quvXBbux67z98OE9xXQXkHq5p/+ZX3bsyrh5ZbviU1RVMk4uoE4cV5
	 nca+6eO01L72X/p62TA0CqgWhv1M2+W7lsIlw2A08a2WXPBTxWW11huNwdXbvqA6wQp8L
	 G5oER04FtyQH3JfmJUrVuvO2lT5hBnfiaU6ST48/gbYpns1sP83WbWVYroc/qa9I6vg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795126373;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=BYQ/wvwnme1lyjBOyIKtXNH7XqCWekNR0YG2bJbEs04=;
	b=MLTWx3EvS0vwj4o/JN51xZc1cABNvT5/K5nQq7zKmK9rE7GcgK/uwYi8PXkvONs5jKG1
	 Xtjlk405ajUnQrIkR/mM812M7uch2k5XXqRxySOWWSOKjMZGmakGhIURglVN2s6MDTSTi
	 5v9mNqGvo6/HlZ1QN2kS34WobtzCOdLj/HrnAW9JIOsD6AwifTRCsNCd6nODBh6Y0DFYl
	 PD/z/a4izV7A8d+jGyxLKQR6Ui5BKodo18dVR78raJ5jPnSZ0Fj8rw3YnFfMZStvaBpoK
	 C0O/584nzQH+aqgxgtSKSP+xFx7JCGMtaryYCpaKZ9qZsQIOgaO9S/EWEQLxqpoDcxg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jVAZVPSS;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 283E560A2600;
	Thu, 19 Nov 2026 22:12:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jVAZVPSS
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795126373;
	b=MQ6Rmnib2YQWwckeTqjRyjcXHn7DcDHZL7snSUyZDj8wA0EBDW7wS9j/Zf6K2El1Xkbg
	 HIhFpk5SvRL+XW9frVLBJnQ1DPneJO7lKr/iJhS7qRwI+jX9PKbr8Tl5Z9TBV553JeYyz
	 59Sbvz0/46nFYHQCa6dTciMClO4f9OgZwnCjxxQl4E9Z226puQksY+8WrILPf39AkE3vG
	 dk6lo7cfb+LSQd1qfobl+Ovrx8e7rjFj5jmlZWMEp5Kw5ZCDqrLrPBk0B4374iVTWSbaI
	 z5gxKlNeIYCqDzmcdAGiQgCNl1OABApW8s71XYk2RJy7rzsVSfERyZ/cUw4c7QvK7bg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795126373;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=BYQ/wvwnme1lyjBOyIKtXNH7XqCWekNR0YG2bJbEs04=;
	b=cAq5Y2V+GdRnAXP0+ppbcez+ozth0FbCP7Ihh4XqaGgLFpCI+QFngT8j2z2eIg0J/Im6
	 zXweRLxmvwBG5STGFdNlbsTapQgfsltyv6DznmfyVFBuNv9aBM7tR7R4+4A6Ts7eM6j19
	 WYuBqabVkZhpqzqjW2SJZ2YALyiMG/lYD6XI9za/WMeOnAlaNUGftlhscpsD1jlHuNiH0
	 ST9fqQ+zVVed8P1yHE7y3BOIicxtXCnjkPlao1i/sRfr7coXw8bEt7wHE4AKPx3r/l10G
	 d0cVwcXgToBLDK8sBt+gBSp/Wh/7ScwM6q65YilzQ//75hVcaR+3D5QqasKSCakI7/g==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 7743A1F000C4;
	Thu, 19 Nov 2026 22:12:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795126372;
	bh=BYQ/wvwnme1lyjBOyIKtXNH7XqCWekNR0YG2bJbEs04=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=jVAZVPSSrTZYyo0DDgapipfrnJ/D3U/Mlbhudig8/jeh0P8RAwbHjt/zgnum+/byo
	 M24qylgfAXKmLN9FbdoM4xHoNEh09l6V/sjwRjmLyZpNz9E1uxt/Py00u7oyTyWPIl
	 ojt991qZpSIaXaXEPKv8oKrfg6C37cffu9VzT9XI7oRnJRUppWhGbTIHWzTEwdusLS
	 +WAP+8e4xjkcGN8uT5P0Dk0iwogkxKx0d9woKxH8MjLDQsRAYkW19gBXwu4LH9mfiA
	 kGWyRKUe7GmTAQsyP9T6JBsC1kPFIb8ykHIbmK4vj5RqITDtszOU09wfoVMFHjqw19
	 yFnWbvTwA8mnw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 04DE741B1D;
	Thu, 19 Nov 2026 22:12:52 +0000 (UTC)
From: Ahmet Zeren via B4 Relay <devnull+niko3x.proton.me@kernel.org>
Date: Fri, 20 Nov 2026 01:12:45 +0300
Subject: [PATCH rtw-next 1/2] wifi: rtl8xxxu: don't report frames sent
 without ACK as acked
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
Message-Id: <20261120-b4-tx-status-v1-1-abdab21c77fe@proton.me>
References: <20261120-b4-tx-status-v1-0-abdab21c77fe@proton.me>
In-Reply-To: <20261120-b4-tx-status-v1-0-abdab21c77fe@proton.me>
To: Jes Sorensen <Jes.Sorensen@gmail.com>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ping-Ke Shih <pkshih@realtek.com>, Ahmet Zeren <niko3x@proton.me>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795126366; l=1066;
 i=niko3x@proton.me; s=20261119; h=from:subject:message-id;
 bh=4nTmHPGR7iLtAHTLFXXQzLy8duSl4o0+8WyF/8dmXhA=;
 b=jBoTLsc2fFyN0SNXky+4ebR1ue0dbb2q/e8Co86WNwNcJd7IFRrkEGPBAZJGsKWrc3kAE141d
 8H7s9MrJ3HbDgKGkS2eDknFVTM1mf/7PdqtnYaTDLHpUwgHtGFl8kBf
X-Developer-Key: i=niko3x@proton.me; a=ed25519;
 pk=J4zNm2pudzQ/wF+pQ8xO+wW6jpcNa9EJ2C1g4DUAjhM=
X-Endpoint-Received: by B4 Relay for niko3x@proton.me/20261119 with
 auth_id=1575
X-Original-From: Ahmet Zeren <niko3x@proton.me>
Reply-To: niko3x@proton.me
Content-Transfer-Encoding: 7bit

From: Ahmet Zeren <niko3x@proton.me>

Every frame whose USB transfer succeeded is reported as acked, including
those sent with IEEE80211_TX_CTL_NO_ACK. Report these as
IEEE80211_TX_STAT_NOACK_TRANSMITTED instead.

Signed-off-by: Ahmet Zeren <niko3x@proton.me>
---
 drivers/net/wireless/realtek/rtl8xxxu/core.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/realtek/rtl8xxxu/core.c b/drivers/net/wireless/realtek/rtl8xxxu/core.c
index 604bb1e5b0..ab2818986c 100644
--- a/drivers/net/wireless/realtek/rtl8xxxu/core.c
+++ b/drivers/net/wireless/realtek/rtl8xxxu/core.c
@@ -5167,8 +5167,12 @@ static void rtl8xxxu_tx_complete(struct urb *urb)
 	tx_info->status.rates[0].idx = -1;
 	tx_info->status.rates[0].count = 0;
 
-	if (!urb->status)
-		tx_info->flags |= IEEE80211_TX_STAT_ACK;
+	if (!urb->status) {
+		if (tx_info->flags & IEEE80211_TX_CTL_NO_ACK)
+			tx_info->flags |= IEEE80211_TX_STAT_NOACK_TRANSMITTED;
+		else
+			tx_info->flags |= IEEE80211_TX_STAT_ACK;
+	}
 
 	ieee80211_tx_status_irqsafe(hw, skb);
 

-- 
2.56.1


