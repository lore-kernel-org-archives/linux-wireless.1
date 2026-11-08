Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794157516;
	b=MndaaxAS8+e70U5BzCZhXevwSY0Xb52n/o8R9G4o7dX4J+flsqNS5d5mX6msBovSFHvI
	 VIhDm8h5kFcXdUMfcewgho9C1dXCvH4cnRfHJK4ij+uHDs9wadwqxAHZl1hOLodzH8Psy
	 s2gumKPj2LGdAm+LWLTGn/GtkE9QYhfZCmgnzGiPMV7cPzAr53Vl9J0Ds2QhQci3d4Xi4
	 No3a1By0Sy5bp6LU3YMg3Mnw6ACpjGyQ9W/u/cGTxUrtUk4u0scTnmDUJ2iENoVDEbym1
	 TKLT+TN69bcj7+uVLp8jmmFiw+fwn0X2MqWGnZ1MsLqBspPypgA112O0yQd7VLXrhXw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794157516;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Sender:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=WtePlfKcf5Q5W8BQO3OBbxtLaEpMB2CPy+t2kWYGmdQ=;
	b=whBoBenD07X/AUjVBvKTqx26i4nKrHII752LtD39JgmpQ6riHzqwytLmYN4rR0gIKMyo
	 tA4klGsRSmXwJ49sGXKdvlFePHEeDSm9AxQ+FUs7kIfFSW9hJr2oqCPl5MrhBFbCwWCkl
	 QBQuanp9qwhgHVRz7qs5kYVK27FgwgkZwnCFHk8zDLpvg29JqWPo638b6njDW1Ivo4bWO
	 L4d8NC/W5+Cnud0s9fQ4WnA7u4B37qbQTraQ+tMx4PGuTiXTXamQn/TmvkPUGQ9KWIzoq
	 9vDmAtvqBqmDfxfTV+Pk4PKMGbaDZXGcMiEdSV6KVTRxKVAdoNE/PWhAsVFxn/QtlXQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ToML1uvw;
	arc=none smtp.remote-ip=209.85.128.181
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDFC0606A31C
	for <linux-wireless@vger.kernel.org>; Sun,  8 Nov 2026 17:05:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CDFC0606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ToML1uvw
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-8b0cf2c0785so1065037b3.3
        for <linux-wireless@vger.kernel.org>; Sun, 08 Nov 2026 09:05:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794157515; x=1794762315; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:sender:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=WtePlfKcf5Q5W8BQO3OBbxtLaEpMB2CPy+t2kWYGmdQ=;
        b=ToML1uvw2CuXaCIJWc1WWdJLOAfSnx9Rr47ToaQqwBNp6hIJ96xyTJ68sGIqCWHlLt
         ZUMP7lLWh4Vk2/3WdqNCoAu9Joqcvd7RH4If6zizutyoL4jhLhGKCdvsI2D2voSj7k5Q
         ZBSBS/PuRwM9zFdUUETzjR9iMMg/kRxD+gBmYvTlCbV2QObRJiH8iYGjuoo+wy35o4uS
         G6+prKgvcW+qDisNGgwdEZIVesSPzUlusBzzDizAcNFAodUmLuJB3netXxthJe8/R9Ym
         6fMh94wTW3/W6RWuiMk/Tzmcf2GEgcSRkdR2ZSsf/elqO8QiRmX91YPS9lzWTeygW+Zn
         ylIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794157515; x=1794762315;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=WtePlfKcf5Q5W8BQO3OBbxtLaEpMB2CPy+t2kWYGmdQ=;
        b=n9Xsdm/B1Nr3iewkir9F70YJwr5Y3a1XdX7uuMYfrEm4bJOH0SbC2A1x49Niyam7Au
         AmDww7+AeWowj1bhj81bOTu+0BqKm9hJEByWG0aOUzuhFqfBF5uYqG3fP377/gtGIG+U
         0vB2wp3D1ipO6fyO62FP/Q4KgK1hBoXr413k+dmIij8kGKBaUvd4JE/mBVqRE3coU9+e
         jKWuvfZ95GnOdPkon4W4uGGTwYKlRNZqKpxRTFQIcY+tMswhaP6+P1FMmQQaZLvYNvJs
         KPgr+L+x9lZO4HgBclWtVnz0Ou9F8kAQ+L9qpY8U+1AqvHHz31YmrnYnhBxq4u7mVQCL
         hekw==
X-Gm-Message-State: APuU4Z9tcqBLcTd72Vof8zYM2u82KaQZ8W3xmA1E3szY9vByUZmyZ5Wf
	27pqWMvokmTLyIm+emszJn+xWrQd9OVbDcOjdS+5lSW9CvqqwnrpMrRRjPJ4
X-Gm-Gg: AYBFou3SBM5Jej9pKh1+cOkAXRJtpev5bqqn3dPz2z3CDbxXESfnfKzUkBRGQVTxqXs
	9SlqGGw+mksskb1WKNCWsolzL+ix+GZuC550YeuNUlgGVuj/UCsABhjdKHDjfDrp2gJIVFcFK0C
	ZJK1qFH5U9LWdY03z+aBtzs4HuzlTlTnCuiJWwvD1oHkaaD/CrAkZxsu3MSRxNWBUnRqVteAyug
	F6HopnfN6U4cSXofcXbwOuI+VUEF6Yidho0c69jQMXoRQ5FESbWjwJcLIlibV2lK6mjlHaL8Jgl
	89kk2NhPISem6UHW7pCgfpmBqhHyvQ4bEQnj1D2zHx8oLBoHEspExJ3iKR6fHDwvTxMVSoP6CBh
	kxfvHdGSbevmAfe4Xep1XtB6XrHrfesi0bEbN4ITH+kBw4EjGY5dRePNTqzRQ41SLP8goXJhlPP
	j01QV4SlkUeTwoXFObL3ToTaegi40rDlt666xI+YINtz17g4b+UIuoplwEZGIvgFuIwuBRTLMSi
	IsI1+n/RAZjYY0ORRrR9Y/Omf29heA6NMlW7sNu/0dTehGoUAlOfbcAIPoFWyX+eO1HQKtE5RtZ
	BbnJIOfGn7QsiAmGFClxOIL77f0eZVml397TcviL/dm2rAycJHh4LzD5z91GTRTaOk39JrBjncg
	Fz2b39YZWMg3w6SlPn5Qm9gZMkQ6t3/IComoQWpaR9Hv+
X-Received: by 2002:a05:690c:800e:20b0:8b3:4a7a:599d with SMTP id 00721157ae682-8b36cbab0f2mr6790477b3.86.1794157514630;
        Sun, 08 Nov 2026 09:05:14 -0800 (PST)
Received: from nn ([2001:1ab8:1003:0:5454:f357:ba89:4e22])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b36b6349f6sm17346687b3.1.2026.11.08.09.05.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 09:05:14 -0800 (PST)
Sender: N B <gen.benner@gmail.com>
From: =?UTF-8?q?Nerijus=20Bend=C5=BEi=C5=ABnas?= <nerijus.bendziunas@gmail.com>
To: johannes@sipsolutions.net
Cc: linux-wireless@vger.kernel.org
Subject: [PATCH v3] wifi: mac80211: change the monitor channel in place under chanctx emulation
Date: Sun,  8 Nov 2026 19:04:57 +0200
Message-ID: <20261108170457.931324-1-nerijus.bendziunas@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Under channel context emulation a monitor retune releases the old
context, which configures the driver to the default channel, and then
adds a new one, which configures it again. On a device where every
channel change is a full chip reset, such as the AR9271 over USB, each
retune costs two resets.

When the monitor link is the sole user of its emulated context, replace
the context with one for the new channel and configure the driver once.
Removing the last context is unchanged, so the device still returns to
the default channel when the monitor goes away, and drivers with real
channel contexts keep their current sequence.

Signed-off-by: Nerijus Bendžiūnas <nerijus.bendziunas@gmail.com>
---
Changes since v2: the last-context removal is left untouched; the
retune replaces the monitor's own context with one for the new channel
and configures the driver once. The in-code comment is gone.

Tested on an AR9271 pair (ath9k_htc) with a 13-channel hop loop, 500
hops per arm, the same driver in both arms:

                   drv_config per hop   median hop   frame delivery
  stock mac80211         2.00            133.4 ms        97.1 %
  patched                1.00             92.6 ms        98.0 %

A regulatory domain change while the monitor sits on a channel the new
domain forbids (idle, right after a retune, and in the middle of a hop
loop) produces the same driver calls and the same final interface state
with and without the patch. 300 channel changes under a 500 frame/s
injection load on the retuned interface: no failures, no kernel
warnings.

On an Intel iwlwifi card, which has real channel contexts, a monitor hop
produces the same driver calls with and without the patch (200 hops
traced, identical sequence).

The patch was written with the help of an LLM coding assistant (Claude);
the author reviewed the code and ran the tests above.

 net/mac80211/cfg.c         |  7 +++++
 net/mac80211/chan.c        | 54 ++++++++++++++++++++++++++++++++++++++
 net/mac80211/ieee80211_i.h |  3 +++
 3 files changed, 64 insertions(+)

diff --git a/net/mac80211/cfg.c b/net/mac80211/cfg.c
index 08ee5ae64939..ed313298161f 100644
--- a/net/mac80211/cfg.c
+++ b/net/mac80211/cfg.c
@@ -1104,7 +1104,14 @@ static int ieee80211_set_monitor_channel(struct wiphy *wiphy,
 				       &chanreq.oper))
 		return 0;
 
+	ret = ieee80211_link_retune_chanctx(&sdata->deflink, &chanreq);
+	if (!ret)
+		goto done;
+
 	ieee80211_link_release_channel(&sdata->deflink);
+	if (ret < 0)
+		return ret;
+
 	ret = ieee80211_link_use_channel(&sdata->deflink, &chanreq,
 					 IEEE80211_CHANCTX_SHARED);
 	if (ret)
diff --git a/net/mac80211/chan.c b/net/mac80211/chan.c
index 9cba79507767..12cd850814bf 100644
--- a/net/mac80211/chan.c
+++ b/net/mac80211/chan.c
@@ -2513,6 +2513,60 @@ int ieee80211_link_change_chanreq(struct ieee80211_link_data *link,
 	return 0;
 }
 
+int ieee80211_link_retune_chanctx(struct ieee80211_link_data *link,
+				  const struct ieee80211_chan_req *chanreq)
+{
+	struct ieee80211_local *local = link->sdata->local;
+	struct ieee80211_chanctx_user_iter iter;
+	struct ieee80211_chanctx *old_ctx, *new_ctx;
+	int ret;
+
+	lockdep_assert_wiphy(local->hw.wiphy);
+
+	if (!local->emulate_chanctx)
+		return 1;
+
+	old_ctx = ieee80211_link_get_chanctx(link);
+	if (!old_ctx)
+		return 1;
+
+	if (old_ctx->replace_state != IEEE80211_CHANCTX_REPLACE_NONE ||
+	    old_ctx->will_be_used)
+		return 1;
+
+	for_each_chanctx_user_all(local, old_ctx, &iter) {
+		if (iter.link != link || iter.reserved)
+			return 1;
+	}
+
+	new_ctx = ieee80211_alloc_chanctx(local, chanreq, old_ctx->mode,
+					  old_ctx->conf.radio_idx);
+	if (!new_ctx)
+		return -ENOMEM;
+
+	new_ctx->conf.rx_chains_static = old_ctx->conf.rx_chains_static;
+	new_ctx->conf.rx_chains_dynamic = old_ctx->conf.rx_chains_dynamic;
+
+	ret = drv_add_chanctx(local, new_ctx);
+	if (ret) {
+		kfree(new_ctx);
+		return ret;
+	}
+
+	list_replace_rcu(&old_ctx->list, &new_ctx->list);
+	rcu_assign_pointer(link->conf->chanctx_conf, &new_ctx->conf);
+	ieee80211_link_update_chanreq(link, chanreq);
+	old_ctx->driver_present = false;
+
+	ieee80211_remove_wbrf(local, &old_ctx->conf.def);
+	ieee80211_add_wbrf(local, &new_ctx->conf.def);
+	ieee80211_recalc_chanctx_min_def(local, new_ctx);
+	ieee80211_recalc_txpower(link, false);
+	kfree_rcu(old_ctx, rcu_head);
+
+	return 0;
+}
+
 void ieee80211_link_release_channel(struct ieee80211_link_data *link)
 {
 	struct ieee80211_sub_if_data *sdata = link->sdata;
diff --git a/net/mac80211/ieee80211_i.h b/net/mac80211/ieee80211_i.h
index d186d1274303..74b08320e692 100644
--- a/net/mac80211/ieee80211_i.h
+++ b/net/mac80211/ieee80211_i.h
@@ -2877,6 +2877,9 @@ int __must_check
 ieee80211_link_change_chanreq(struct ieee80211_link_data *link,
 			      const struct ieee80211_chan_req *req,
 			      u64 *changed);
+int __must_check
+ieee80211_link_retune_chanctx(struct ieee80211_link_data *link,
+			      const struct ieee80211_chan_req *chanreq);
 void __ieee80211_link_release_channel(struct ieee80211_link_data *link,
 				      bool skip_idle_recalc);
 void ieee80211_link_release_channel(struct ieee80211_link_data *link);
-- 
2.56.0

