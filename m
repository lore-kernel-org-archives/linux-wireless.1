Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794986668;
	b=3T6aQxVb+fBlM9ZoHxvgRHxa49xT1L9yOSaKI5bizNnCLt1eFWu7hO+OUakcW/bA21zE
	 6wo9gbprZ2lVxatsrGz47cbgzQRUP7tOaNAhfdBgV9Ls4SdxP6tYRWqtcRKTsHtA4A2EE
	 1lZ9nQdb1+NHot8TgN71aKFdfugBRFQ7yL5+9B40jdQApRcn9O9DfRG3+3pVclnGMQVY6
	 k3Tgk7s97Qmr9N2K2k97gPrf3QbKFJwzukTmHFBWgRfB4zNTKGrFCLP4FqpQMznHDsQPp
	 TioWHg8ki+e+gSH/mTBs4fSQxmrLahPw+DWwRc3Gt5cfickglZ96NoVNtay0oWJBZgA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794986668;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=nWldKJH4ToQxxszIhmpTBzaHDyg4JETHklQ1vv7jvRs=;
	b=zxrmXnxW4ftPc8UKx7YJ2ldZ1taOxNNT+cfrRZv/5gL9gtY55oio5zR5NIF8lGJlx+sq
	 SIg0ZfwwnInjjvJm/IiPXcqtVGCCSRgaFyqTf9dF1JHs/+2ISU+OeHarXhcVrnCDNAvkf
	 /tZwmHkuJSAH7hD28fBD0UGAluusCm3XwY1Fx5e4NJefZGilsjSrtOHQMbpwV0KVl2QyC
	 zkM89bbsCNdJAT1OgjnpePSctBak9gah3XEWUn1LRBULi0EPasaBB1u4buoE9iNNcHfM3
	 uu/sonSAZyUUtv4VKPtvODYRGpkPaZoUWri1YHDzjK/bWxtxUvfS9l2eR+ANdXBxRKQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=optmKBhu;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ED18606A325
	for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 07:24:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3ED18606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=optmKBhu
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-3282db206d3so1892804eec.0
        for <linux-wireless@vger.kernel.org>; Tue, 17 Nov 2026 23:24:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794986667; x=1795591467; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=nWldKJH4ToQxxszIhmpTBzaHDyg4JETHklQ1vv7jvRs=;
        b=optmKBhusOrjDG69jg4Kw6QLVtpKWDX78kqzv3mPhfX5qbKGNxRR1TibCIDs7O8EV9
         3z4iKtcjBbS6ZAe9w5FhT98RQTWHR5PmplbO4tvYLIPtxgpHG5kQdshJkIWQHzq1LI+a
         JCIPr/G10qtfR4xiT6ZTB2VGsNouIRDgSmVz+nw36GIWTx486CaGLhQEcsWkQ3I7n9aB
         w1P+lJPvCHr6TlyEzxATkOF6vPgv5CJ64FIrBcpIMt5NKt/D/PaR2xFMTytjVMipDbDA
         eUNumuvsq9voFOu4z9CgQ+s+KmE3DTGKpD4NfFqdzjhS33FGkbAyV7x1e4GNZF+pbvyd
         0QJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794986667; x=1795591467;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nWldKJH4ToQxxszIhmpTBzaHDyg4JETHklQ1vv7jvRs=;
        b=TAWgOoJgEwhmB+RpJ2tDp2SXgL+tPsvpfKw/I5EF2XPBkos42IfoEIo0CegZnqCphW
         w9ZvJSA88b3ysvgsI5bmur5N3Ru3CRDytDaPOltqO/C0K25ZO33U/RNWXNW5qUhsTZi7
         DxfVNlm3eZsHmn6TW58J47zxSI4wyFlXL/gqHC6bKO5oE/lEEoR/3IoH5Nfp/WCbVZR5
         W49Pvtz4omfP+1wPKiz+c63DgrwxOkINhyVxBXcmtGS9E77gpBaHyPVpBFNaDb2dykUM
         /ttY0PNu1p1z5x1aJ0EwkndUnHR8hfk1O5M6q+OcYHkm21h0pQ6VUmI1Wqy6LjqKwPLH
         sNZg==
X-Forwarded-Encrypted: i=1; AL+hErGI0i01Hhut/PK/6OgJBhs28dcD4IeCA57AzZmRozQMSXfkFQ7w1y+4bYMx+3xQpbc0JZPhzK3K1Np2bzLMRw==@vger.kernel.org
X-Gm-Message-State: APuU4Z/gEBQ2uIS7Z2K7yZ/edR5RodWaUXVkg+OqumXYa8yghQO35lFj
	LY5jzTy/o5ku0f7Xmok0aOXDKu2sW3/DKx1hcOWMnkK0hWqUjPOAYRXo
X-Gm-Gg: AZFdTZeKKa14WYywNoc3A80sv7MGPx00NRVZateC6vWbsidVDy0NjBXXdi/9rxEQgMz
	kBzROK+P402bmsnBIIIP/vm+IxkMc+wR8hWxczkrHkn6tctU0VlCmrstNzBdhquvy5UPjuqtFXv
	Q+y1Me4xECN+7KcE9BIGx1K1JTETwlmshE3RwwrJ9acJi/3MK3ezCnsryjbbux1y5bIlvRQpH09
	tob55JOCvbMMgy911cFTr6m6PV4+y1GKDr+H9MQCo177AhsLFkZzNme+zb3Z5NJLJuw+c04/2b5
	ZibEFZppm6rummYSMav5ugsUT/NYb3jUijdCPyaGwpjY3EQPAqJSK3f6fj+162/4XqSaRE4p9om
	ZrpjU4JIvPHGg0o0eoewii2oC2/nXD1Dr9DzKd7KrwhF6BeR6yaSRX+5J6XghUQ6Xi0lxq5mnRl
	eVFpw2d6Wq0yTmA75b3ZyxEN27VP6X4NjZ0h2A1jFMJblHpcjxrmommIISbm6Nbk69t1/GsN7vg
	a4gXIYBfnMDmSYhQ7HYA/2hoR0xM1sI6/3F9hT+xYddMUQ5hfWpBhO9kJH/jhEO77zO9muEJZyO
	JkHZnAs2Ub0rN1lyHrNMA7+O+/E5E4xtnEGPoLhZxEU5yPofCrc1r1WqsmOnsTTg3J8bsI0OUoL
	R44KHmI4MRm+lq/o35FkhbjJbbcgRCSrBT/T+vSaA
X-Received: by 2002:a05:7301:4682:b0:36a:437a:4c00 with SMTP id 5a478bee46e88-382803787b6mr1855612eec.24.1794986667042;
        Tue, 17 Nov 2026 23:24:27 -0800 (PST)
Received: from lwq-System-Product-Name.. ([2602:feda:30:cafe:ec49:29ac:0:f6])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a7fbceffsm4894511eec.28.2026.11.17.23.24.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 23:24:26 -0800 (PST)
From: Yaohan Li <shunsheng1218@gmail.com>
To: briannorris@chromium.org
Cc: francesco@dolcini.it,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	patila@marvell.com,
	cluo@marvell.com,
	linville@tuxdriver.com
Subject: [PATCH] wifi: mwifiex: shut down the auto TDLS timer instead of deleting it
Date: Wed, 18 Nov 2026 15:24:19 +0800
Message-Id: <20261118072419.1259830-1-shunsheng1218@gmail.com>
X-Mailer: git-send-email 2.34.1
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

mwifiex_clean_auto_tdls() clears auto_tdls_timer_active and deletes the
timer, but the callback may already be past that check and rearm the
timer with mod_timer() before it returns.  timer_delete() does not wait
for a running callback, so the timer survives the cleanup.

The mwifiex_private structure is freed later by mwifiex_uninit_sw(), and
a timer that fires after that dereferences the freed structure in
timer_container_of() at the top of mwifiex_check_auto_tdls().

Use timer_shutdown_sync(), which waits for a running callback and
prevents the rearm.  A reconnect sets the timer up again with
timer_setup() in mwifiex_setup_auto_tdls_timer(), which restores the
callback, so the timer is not lost for the next association.

The cleanup also has to happen when the interface is no longer a
station.  The feature flags and priv->bss_type are re-read on every
call, so a bss_type change while the timer is armed skips the cleanup
entirely and leaves the timer running past the interface teardown.  Key
the timer shutdown on auto_tdls_timer_active instead, which is set only
by mwifiex_setup_auto_tdls_timer() and cleared here, so the timer is
stopped exactly when it was started.

The peer list is independent of the timer and is flushed unconditionally:
mwifiex_add_auto_tdls_peer() appends to it whenever adapter->auto_tdls
is set, whether or not this interface ever armed the timer, so guarding
the whole cleanup on the timer state would leave list entries behind.

Fixes: 9927baa3c724 ("mwifiex: add auto TDLS support")
Signed-off-by: Yaohan Li <shunsheng1218@gmail.com>
---
Prepared against v7.4-rc1-1969-g666539eecdf4.

AI assistance: the analysis, the change and its review notes were
prepared with Claude (Anthropic) as a coding assistant.  The author
reviewed the reasoning and takes responsibility for the content.

Testing: compile tested only (arm64, gcc 11.4).  No mwifiex hardware was
available, so the disconnect/unbind race was not run.
 drivers/net/wireless/marvell/mwifiex/tdls.c | 26 +++++++++++++++++----
 1 file changed, 21 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/marvell/mwifiex/tdls.c b/drivers/net/wireless/marvell/mwifiex/tdls.c
index c71ffe8399e4..99948db5bbdf 100644
--- a/drivers/net/wireless/marvell/mwifiex/tdls.c
+++ b/drivers/net/wireless/marvell/mwifiex/tdls.c
@@ -1483,13 +1483,29 @@ void mwifiex_setup_auto_tdls_timer(struct mwifiex_private *priv)
 
 void mwifiex_clean_auto_tdls(struct mwifiex_private *priv)
 {
-	if (ISSUPP_TDLS_ENABLED(priv->adapter->fw_cap_info) &&
-	    priv->adapter->auto_tdls &&
-	    priv->bss_type == MWIFIEX_BSS_TYPE_STA) {
+	/*
+	 * The timer itself records whether this interface set it up: the
+	 * feature flags and bss_type are re-read on every call and can have
+	 * changed since the association that armed the timer.
+	 */
+	if (priv->auto_tdls_timer_active) {
 		priv->auto_tdls_timer_active = false;
-		timer_delete(&priv->auto_tdls_timer);
-		mwifiex_flush_auto_tdls_list(priv);
+
+		/*
+		 * timer_delete() does not wait for a callback that is
+		 * already running, and that callback rearms the timer when
+		 * it finishes; timer_shutdown_sync() waits for it and
+		 * prevents the rearm.
+		 */
+		timer_shutdown_sync(&priv->auto_tdls_timer);
 	}
+
+	/*
+	 * The peer list does not depend on the timer: entries are added
+	 * whenever adapter->auto_tdls is set, so it has to be flushed even
+	 * when this interface never armed the timer.
+	 */
+	mwifiex_flush_auto_tdls_list(priv);
 }
 
 static int mwifiex_config_tdls(struct mwifiex_private *priv, u8 enable)
-- 
2.34.1

