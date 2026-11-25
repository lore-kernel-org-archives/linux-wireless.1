Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795640518;
	b=uuKHVrT/mzmQMcJbMFyTx17vqo8Qq4WKYZMbu6Aek1ZtYh5MwAvnhUS0HOZc/HMHsb0o
	 bEHSgxLnczkPqqVVWEH5rDHHQqGbdJGE3MrnJ4YuCt6yVUQM6ZoFjZEj37fYKESvmNMd0
	 mcBoIwANl34XxQPNfVns2cye/6/3/ddc6zn5xoSflPEvRSzZTd+nU2vbjQ27kSQt8JzD1
	 2qarXBqqXxzd1MjT/PGUEckrLXzOgtfj70EbWdV/AeUmihUaSGcxhtCg9O0/RhhgiiTKX
	 A0FmSYARzvv5QNPR0Vxf5fCHy6ejmwOV903OK+wOGQpirPMf4GrxNPeXBbyRmjAe0eA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795640518;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=rAeuXzOlCTRhm8c9AePoBHHIXKhwDESJdrRFhkUvSY0=;
	b=YYaCKn86Ovvhk786CgDPz/oPftS1c0Zk3YRt74Ol6HcAVh/ymx5DJiBQiM/Pv6WBtnX5
	 CfVMR0VXHr7nmbKTF9lJkGFkkr87RquvUU9gXN7S/wm8MwMeAkO3ECoWZQk4Yyzf+uJ60
	 GxDsamEtQR/9jXOBc0sFZ4vE5pAsynnWJwqX/cT8ojWH9rVccE8jc4FX7eqd+O2EYyeB0
	 3f3eyxJed7ykCu+Q3jgj7c29akushdlmtYWlRJW6nsBp9FHk8cBHurwe8yTkgXjLQAAqz
	 iVwz9xmKpC/Mtzd3UZB4L7P7uVAp+Wn6e1TDt/rHHKs5oJHXypLnV1n9w5bS6GvJ8sg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--elkin.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=lp4R2a8F;
	arc=none smtp.remote-ip=74.125.82.72
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37A4C606A329
	for <linux-wireless@vger.kernel.org>; Wed, 25 Nov 2026 21:01:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 37A4C606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--elkin.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=lp4R2a8F
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-139b62317d0so390933c88.0
        for <linux-wireless@vger.kernel.org>; Wed, 25 Nov 2026 13:01:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795640516; x=1796245316; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rAeuXzOlCTRhm8c9AePoBHHIXKhwDESJdrRFhkUvSY0=;
        b=lp4R2a8FRe4Jzh5GBlKmTB7KM/zji+OXsUnFdo9VPbYSW1/vAFwwdd0bjA9xJZe+TD
         Pp+K0qdeIwk3XCf4f7sBpTTqRkjXN/+onfZ35Jy4Yx5kQsyaNa360bnl6mrnWVcxdBdE
         D+/TH8Wn5LmZ9X5+0sssGg0XQanZiUPBMcFmHiAxmqhJekAijeD8RNwoJOwzp/EngXXo
         aoms+2u+8egAut+nWgO3AZhull00a7gi0Fzb5wuuPZnD6+iOmvxf6c3GvMMk0XK0ThgN
         rQVoYgg5h1UL/1j0T3e1WhL3wqaGj4drQkK8Svtj5Mzb76FbMxKL+89ovWABVnfRn1k8
         Eb1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795640516; x=1796245316;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rAeuXzOlCTRhm8c9AePoBHHIXKhwDESJdrRFhkUvSY0=;
        b=p45MXq0M5z+BqdXskODtjRH7HI3v/h/EXOZfctl2HVyJc66L3IzLz9PHEykttWhMP5
         jT7ZbOhZxbKTuOtgf5xfT2vFJkkwrKgoWgCzobdy/5+gNJwxZ9fhzNn1E+21h4zzfE6V
         0x+brUhz0rPvAzHygNV4axCo8eeOHkWmisZf4EkIxJBt4PjfnLQ+Qpe9RI8gWuPH0nMl
         MUmVnEJ8LdRlkvacLcjg7E9ixBgo1fePBGf7ihFasPnyiqMF3BL0EtJjoJ0QC/2m3S6b
         zpzntfEfI0kl79UCRKnRaWZgkEjcYYoL0xIMH+BzdKrqDbiaeqULOY1yr1fiZcsMElh/
         uY5g==
X-Forwarded-Encrypted: i=1; AL+hErHP/j8V1IqA5ggKgf0E1kFKlieuvca9j9mtForMQTpQmK+fOO6LjGCThbqMsh2/FNU8oK6PmqcmXMeCMSzmfQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z/co/dEwyhGBfsxR4+eX9nYkXQzYio2L5jrxVIyAzLm7z5vmuo3
	iLMAVbr575n+KZLiHf0KoxY4II/BDRAM5H5+FzLuPfvNHJdyOWGCEnCqSWOGJ0t7Y5Sk084lV9O
	7hw==
X-Received: from dled8-n1.prod.google.com ([2002:a05:701b:42c8:10b0:1b5:3444:f158])
 (user=elkin job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:3b8e:b0:1b5:32d7:7d73
 with SMTP id a92af1059eb24-1b5568f3283mr23214323c88.30.1795640515933; Wed, 25
 Nov 2026 13:01:55 -0800 (PST)
Date: Wed, 25 Nov 2026 21:00:37 +0000
In-Reply-To: <20261125210038.1277960-1-elkin@google.com>
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261125210038.1277960-1-elkin@google.com>
X-Mailer: git-send-email 2.56.1.839.g22a8290db9-goog
Message-ID: <20261125210038.1277960-3-elkin@google.com>
Subject: [PATCH wireless 2/3] wifi: mwifiex: check TLV header size in ext scan report
From: Elkin Cruz <elkin@google.com>
To: Brian Norris <briannorris@chromium.org>
Cc: Francesco Dolcini <francesco@dolcini.it>, linux-wireless@vger.kernel.org, 
	Johannes Berg <johannes@sipsolutions.net>, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, irogers@google.com, Elkin Cruz <elkin@google.com>, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

mwifiex_handle_event_ext_scan_report() loops while bytes_left is
non-zero and immediately dereferences tlv->header.type and
tlv->header.len (4 bytes) before checking whether bytes_left can hold a
complete struct mwifiex_ie_types_header. When 1 <= bytes_left < 4, this
reads past the end of the firmware event buffer.

Require bytes_left >= sizeof(struct mwifiex_ie_types_header) in the
outer loop condition, matching the inner TLV loop directly below.

Fixes: 21f58d200388 ("mwifiex: implement extended scan feature")
Cc: stable@vger.kernel.org
Signed-off-by: Elkin Cruz <elkin@google.com>
---
 drivers/net/wireless/marvell/mwifiex/scan.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/marvell/mwifiex/scan.c b/drivers/net/wireless/marvell/mwifiex/scan.c
index bdd4b8465863..53aa16c1df33 100644
--- a/drivers/net/wireless/marvell/mwifiex/scan.c
+++ b/drivers/net/wireless/marvell/mwifiex/scan.c
@@ -2649,7 +2649,8 @@ int mwifiex_handle_event_ext_scan_report(struct mwifiex_private *priv,
 
 	tlv = (struct mwifiex_ie_types_data *)scan_resp;
 
-	for (idx = 0; idx < num_of_set && bytes_left; idx++) {
+	for (idx = 0; idx < num_of_set &&
+	     bytes_left >= sizeof(struct mwifiex_ie_types_header); idx++) {
 		type = le16_to_cpu(tlv->header.type);
 		len = le16_to_cpu(tlv->header.len);
 		if (bytes_left < sizeof(struct mwifiex_ie_types_header) + len) {
-- 
2.56.1.839.g22a8290db9-goog

