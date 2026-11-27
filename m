Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795800037;
	b=sjXCGVBzdcYXMbsH5So2hjDQpMYgTwB/Dth6VWrW30IJuPv7gOEyY23IHyZJiB9ma4Vc
	 rEROGfkkd4TRaRvkqQFLIDyzIQLrJ5fjGxehzzQ3Fu8q0uzGNqPWuVfYJbZ6oQ9zu8GDW
	 M33rKj/KLWAPXn0QELHFslqiNPEhqpDulEcujAHb2CZLgZbn+rPz7lRrqRK4QHoQ5fu93
	 8UFI9XTh62ugFjj+0QepZKVVucKgoGR3bkKNWfhwwX9N9SwoiXVoxGUWjCrfV1S9OFFpz
	 2r2tiwvvNfQX8zUBxpi0kLwsnzAxwq/aZXmeZimTbj8T/BoYE9YMcGTIel87n/2Os5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795800037;
	h=DMARC-Filter:Received:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Rspamd-Pre-Result:X-Rspamd-Server:
	 X-Spamd-Result:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Rspamd-Queue-Id:X-Rspamd-Pre-Result:X-Rspamd-Action;
	bh=4OguRMGdAm4Ve4RxSaUFRoN3pO2yCoU1/zlHX5Av2aM=;
	b=T5eyEYTs6mCJQlPnlqrNsJtKJNOQwLAkscdCSA/81y9zyOOMBA14jpYeTQ1bhJxmknrx
	 KeKFSCNAHqyHf8c+7ryVq99GUVqH2Re/sP27eWi8Q+1y/9ZRCicJ4xyGUAQSJG2oGAtA0
	 VNw3z77gfq5UUVz1ORmYx4bpZWIdpQYW/PF706sVtjUIkra+8anOlbTjgqMkXvxGNXhqS
	 3POj23IWJPtwoXWL/U7nEqx2JiF50YBR6GzBcOH1Lgjk0mniNNkoEsJoGjr5GtjRc9Htk
	 ayb8M8fK7U9lJbE8Jia4X6dlXc8zwT+A3l5OA2P+LyXZ4DhrLXFT0SIw5EVvWxmv06g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	arc=none smtp.remote-ip=195.135.223.131
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A1AB606A327;
	Fri, 27 Nov 2026 17:20:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9A1AB606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id DD8B21F7F2;
	Fri, 27 Nov 2026 17:20:34 +0000 (UTC)
Authentication-Results: smtp-out2.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3E60013432;
	Fri, 27 Nov 2026 17:20:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id /Yb1MH67CWuMAwAAD6G6ig:T15
	(envelope-from <fmancera@suse.de>); Fri, 27 Nov 2026 17:20:34 +0000
From: Fernando Fernandez Mancera <fmancera@suse.de>
To: netdev@vger.kernel.org
Cc: davem@davemloft.net,
	kuba@kernel.org,
	edumazet@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	Fernando Fernandez Mancera <fmancera@suse.de>,
	Johannes Berg <johannes@sipsolutions.net>,
	linux-wireless@vger.kernel.org
Subject: [PATCH net-next v4 14/16] wifi: mac80211: replace CONFIG_INET with CONFIG_IPV4 guards
Date: Fri, 27 Nov 2026 18:17:59 +0100
Message-ID: <20261127171824.27362-15-fmancera@suse.de>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20261127171824.27362-1-fmancera@suse.de>
References: <20261127171824.27362-1-fmancera@suse.de>
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
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[]
X-Spam-Flag: NO
X-Spam-Score: -4.00
X-Spam-Level: 
X-Rspamd-Queue-Id: DD8B21F7F2
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Rspamd-Action: no action

Historically, the mac80211 subsystem used CONFIG_INET to guard
IPv4-specific address notifiers, assuming that if IP networking was
enabled, IPv4 was guaranteed to be present. As part of the effort to
make CONFIG_IPV4 optional, this assumption is no longer valid.

Update the conditional compilation guards around the IPv4 address change
notifier and its associated registration routines to explicitly check
for IS_ENABLED(CONFIG_IPV4). This ensures the mac80211 subsystem
compiles successfully without undefined references when building an
IPv6-only kernel.

Signed-off-by: Fernando Fernandez Mancera <fmancera@suse.de>
---
 net/mac80211/main.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/net/mac80211/main.c b/net/mac80211/main.c
index e03c2dbf4fb8..5e10ea3c7601 100644
--- a/net/mac80211/main.c
+++ b/net/mac80211/main.c
@@ -559,7 +559,7 @@ void ieee80211_restart_hw(struct ieee80211_hw *hw)
 }
 EXPORT_SYMBOL(ieee80211_restart_hw);
 
-#ifdef CONFIG_INET
+#if IS_ENABLED(CONFIG_IPV4)
 static int ieee80211_ifa_changed(struct notifier_block *nb,
 				 unsigned long data, void *arg)
 {
@@ -1660,7 +1660,7 @@ int ieee80211_register_hw(struct ieee80211_hw *hw)
 	wiphy_unlock(hw->wiphy);
 	rtnl_unlock();
 
-#ifdef CONFIG_INET
+#if IS_ENABLED(CONFIG_IPV4)
 	local->ifa_notifier.notifier_call = ieee80211_ifa_changed;
 	result = register_inetaddr_notifier(&local->ifa_notifier);
 	if (result)
@@ -1678,11 +1678,11 @@ int ieee80211_register_hw(struct ieee80211_hw *hw)
 
 #if IS_ENABLED(CONFIG_IPV6)
  fail_ifa6:
-#ifdef CONFIG_INET
+#if IS_ENABLED(CONFIG_IPV4)
 	unregister_inetaddr_notifier(&local->ifa_notifier);
 #endif
 #endif
-#if defined(CONFIG_INET) || defined(CONFIG_IPV6)
+#if IS_ENABLED(CONFIG_IPV4)
  fail_ifa:
 #endif
 	rtnl_lock();
@@ -1710,7 +1710,7 @@ void ieee80211_unregister_hw(struct ieee80211_hw *hw)
 	tasklet_kill(&local->tx_pending_tasklet);
 	tasklet_kill(&local->tasklet);
 
-#ifdef CONFIG_INET
+#if IS_ENABLED(CONFIG_IPV4)
 	unregister_inetaddr_notifier(&local->ifa_notifier);
 #endif
 #if IS_ENABLED(CONFIG_IPV6)
-- 
2.56.1

