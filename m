Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795108166;
	b=c1I809knXOD8Vr/GUDUlKKdL5LWkhmyTJxmZvk2Z+EtyWVg0JuoGQjRDUcfDlFFJ9kut
	 h+dQAWF4sVxU3YJqEm6EagY0KE4QqzkazC8sH3Ocp1mEwbSEC/ngJ6a0hK+JKdvSKKS/f
	 8xr3WxvcXeHXMV1crEQ0LG/1mYO0bbQdUepjTN/zzqmavb1NKjNhhNuKqnOPiMMUmoQ2H
	 5UoPTo/3dVL/BDGByPJDz53TPcg7ItyBh7Irg5/n/osm3dFhj7EwLwV1hoEjQDybYd7k4
	 wGxIm4ItJtTI/b06FkKAEh9Iqo3wzSu0dYOkBhOF2g1KYC2yWuxZ5tb9Waz3X3YTcBA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795108166;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Received:Date:In-Reply-To:Mime-Version:
	 References:X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=9KvSqe4fcu2QYKtWaojecEyNvEdCRD/7r6L6KTVA3BY=;
	b=0zBVPvS3xqoAtgqTv8hJU6qqRx9oqC7VLmtV744o2LFPkT14HvcqYkadMm0gcMcJ2KX7
	 pe37KQ60OvAznOUdeyX/YG1A1ohl73XZcYWsajrZj8jgg+D10jpgzKMgqCr8h1VTqHKjm
	 +xKgosw9RPi8B3NSnxV3xWDIBsj0U+Xv4Kk92Y1F85OCcW0JLOLFY1O1CkUPoaDHKpjoT
	 BktijfctBTTmZIoF68froUxUeCElaSOpr1lEMlJGtlzEzXOS1YOx9b/iXPANTQg4e/L9D
	 BJKfa+aRo3HxuD60LpRVBiJGfoXanPU4nVtuB2sWujfzWlPQOvh443X4mtv9C6qMfCg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="SN/nyydJ";
	arc=none smtp.remote-ip=74.125.82.70
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 270FE60A262C
	for <linux-wireless@vger.kernel.org>; Thu, 19 Nov 2026 17:09:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 270FE60A262C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=SN/nyydJ
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-16bc6f3fdb1so1574871c88.0
        for <linux-wireless@vger.kernel.org>; Thu, 19 Nov 2026 09:09:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795108165; x=1795712965; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9KvSqe4fcu2QYKtWaojecEyNvEdCRD/7r6L6KTVA3BY=;
        b=SN/nyydJoUYPU9R4qeWA77rQv5dkMTk05II8XEmikiRHes0or+NYqwcqZOT1WQw9gL
         wyIwol4rwPKUgN46c6WjdrrVxDMpzU41+LEQOic1Pfh8G6usB5c8slvICyuqk6EV02Aq
         KAbshw0AlUNB+t1jaQ20J7v7oTpKDnsJEmnAtFXuuz3e4bUB8gfDmcP+j8bmibKCBRwK
         O49gHWJztpV4FKKxZnrXmrJHK4Eru3e4FPnndFaz1Ayrl3R7Df5FeA6epzNY6foh8q8n
         kCti/IncL2UdUypxAMQaq8d2RDXkNr4MqDVAJvAidm9esh5l9pRwu07ZtDfkNJEwEta3
         63mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795108165; x=1795712965;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9KvSqe4fcu2QYKtWaojecEyNvEdCRD/7r6L6KTVA3BY=;
        b=MpXl/Dftn97zmiIqbj0BIOStePReKRGjvckQZ8M4sTw9e8+axRcUu6mrQJO+o2KHTv
         32TEkboM0csCoC5BkEfqz+eyFmD9OoeKJeKYj1UkDovJTldDv1ZmLc8I1bB9HZNF8xyF
         K3W9LkYnMCh3WoaqMtMPdCphocXA6AHM0ZO3rvFn/m9OCcUTtA+UBJiPW46Ns3pbIqRV
         mkZJFvRxkz/BH/yNBL9FaVHUf+NsIYMA/FUu4DvnaAggu3pTP3epOjGZqrcj3DKgRA7C
         qJPbQmGTWWVXmFPVPMIPC3zCht7Vbx7jW/43Cpq6825bJdmUNBmkx1uZd23YlOdEWV44
         NB8w==
X-Gm-Message-State: APuU4Z9h9SOhu8FIAzOPNa0WHwhP3kq5c5mr0fn5PkrkMZn0DHJMYOj6
	eIts9+vTsgCYaE/pgBmRsMohPHfOecOD88Ygt/ZOkpIeZlnCyoF9ENM5axx2KKO9cyi0L0r+YXO
	OyFBkljWMrA==
X-Received: from dli28-n2.prod.google.com ([2002:a05:7022:29c:20b0:1b5:3561:2fe9])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:e80a:b0:1b5:4b48:b9fb
 with SMTP id a92af1059eb24-1b5567c0ea6mr264480c88.5.1795108164835; Thu, 19
 Nov 2026 09:09:24 -0800 (PST)
Date: Thu, 19 Nov 2026 09:09:11 -0800
In-Reply-To: <cover.1795106967.git.irogers@google.com>
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <cover.1795106967.git.irogers@google.com>
X-Mailer: git-send-email 2.56.1.708.g77570a6a1d-goog
Message-ID: <ae02ab481b5ce8259a22135255de5864777e37d9.1795106967.git.irogers@google.com>
Subject: [PATCH 2/2] wifi: mac80211: Return NEG_TTLM_RES_REJECT when sdata is
 not in driver
From: Ian Rogers <irogers@google.com>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, Elkin Cruz <elkin@google.com>, Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"

drv_can_neg_ttlm() returns enum ieee80211_neg_ttlm_res and initializes
res to NEG_TTLM_RES_REJECT, but returns -EIO if
!check_sdata_in_driver(sdata).

In ieee80211_process_neg_ttlm_req(), any return value other than
NEG_TTLM_RES_ACCEPT is passed to ieee80211_send_neg_ttlm_res(), where
an out-of-range -EIO value hits 'default: WARN_ON(1); return;'.

Return NEG_TTLM_RES_REJECT instead of -EIO when sdata is not in the
driver.

Found via Clang -Wimplicit-int-enum-cast on an x86_64 allyesconfig
build. Verified by building net/mac80211/mlme.o with LLVM=1 W=1
(-Werror) and -Wimplicit-int-enum-cast; not runtime-tested on MLO
hardware.

Fixes: 8f500fbc6c65 ("wifi: mac80211: process and save negotiated TID to Link mapping request")
Signed-off-by: Ian Rogers <irogers@google.com>
---
 net/mac80211/driver-ops.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/mac80211/driver-ops.h b/net/mac80211/driver-ops.h
index 9aefa55cbdfd..0558ba58f3fc 100644
--- a/net/mac80211/driver-ops.h
+++ b/net/mac80211/driver-ops.h
@@ -1740,7 +1740,7 @@ drv_can_neg_ttlm(struct ieee80211_local *local,
 
 	might_sleep();
 	if (!check_sdata_in_driver(sdata))
-		return -EIO;
+		return NEG_TTLM_RES_REJECT;
 
 	trace_drv_can_neg_ttlm(local, sdata, neg_ttlm);
 	if (local->ops->can_neg_ttlm)
-- 
2.56.1.708.g77570a6a1d-goog

