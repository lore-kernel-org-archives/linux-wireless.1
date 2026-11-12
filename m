Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794479892;
	b=5Aq4UbZLW7RGBdGL+PyzaNCgxyebxFxZNf2d+fMJ1HPa8TkXH5IbDjD1TyQ9hyHZWzy2
	 /2xGUgFct9Sa/C44jyNaBAGGv00MEpQtFQTjS01C+D5rf9TlJROqDywU0UTX3aI7HKEOa
	 IuE6r7cOMeKLbT7CvYPxAVkygrb7JpWAZbvJlrVDOW/AXfWEmNt13qYBtbKTsAPeIcpu3
	 dICx9S0h5eqsdk7OiN9/G52PjrZAmoZm8Vu5vXXIZMQtqr04jeMb4awpyrIRID0hKoDvl
	 kF0MiAfbXHvAfUFzYgyxgkZdnJYmdxHKEFg5x+QrmUJRoGiJmJG6/OzC+zF1XbDbJkw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794479892;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=svk3BUiB5SInxHQd05EH3dNdM45cjspHM1/nqws3kGk=;
	b=hrC8HRSZpFtSE2AnZoPkUmy3toiIOVc28yB0tbLf8om4H7hDwgjnjFcHeunr66GPrfFW
	 CXNjh65O6G2DLbPtvDYqD0O0UZv3TNb8CeKaUax25hoE4AZ6HUtD1aPFqY4BmoI2C4rF7
	 vwyVs1Z1hY/4NaaI1tZLBMODnmjiDHjhjCg3Zywopmpy+TN/DYJKgCzC4c/kCFGpSNa0M
	 zUhabsbGnjBiTFoPGO6BbIHSPYAcV8qI/BE3DdG8BwzxF3L6UT6NZrrqKG3YD7H76L7Q8
	 QapCx7yweB19DlmKhpq/rFkpPK6vLILqx1gQUFQfbUuKye4bXd8I/edwXqa4bO457yQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kOFAZ93g;
	arc=none smtp.remote-ip=209.85.167.51
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CD8E606A31C
	for <linux-wireless@vger.kernel.org>; Thu, 12 Nov 2026 10:38:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6CD8E606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kOFAZ93g
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5be3ed646a5so4218036e87.1
        for <linux-wireless@vger.kernel.org>; Thu, 12 Nov 2026 02:38:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794479890; x=1795084690; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=svk3BUiB5SInxHQd05EH3dNdM45cjspHM1/nqws3kGk=;
        b=kOFAZ93guEfmqIL9i7j1zPVEuvVQpq24teyKMh3cJkk5/JZHl55Rw2N386//nV9sNl
         9u4mdiDfXYATYhmErnXOMaZctr0fUVmaQw+DZcBYH+unzU7AfXKZ0nZ8xdqU64ZRVLpJ
         f2g2PTea5y6yd2vQ2s7wRS4xPUISEQOIBc2je1fDrWkovdYeNOo1IL5nV2aNvmBKcpQ3
         jtP2K9ehwW5vuDjQ2UuJZfTM9jTZGcbg/LM6S4amW/K6C+cj2UiOBxUsTuBjLhvpGsmH
         +r8TXAalKAUwrso1iOJIzQa0BVaz+xvN5Kplp5YBELfVWztBBPKzieNBYgLFz4xr52ez
         z8og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794479890; x=1795084690;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=svk3BUiB5SInxHQd05EH3dNdM45cjspHM1/nqws3kGk=;
        b=Aul2L+AeSR6GkST+ikxjDW+xtQtVPXuOKe0MqEuKX3O9vRlO8AD93unHhf9mV9aLt5
         ez/V/Pk1Mffd8QPL22QcCKi7K0BX7O5tKyRzRZE4weY7I7+RCgGR8cqu4xatZpUL5MI8
         ya13DknSUPWIlBFuUFpi0WFpoOf88ImxtpMhDfmWpaHipdwU4sgbYHmrAJWqbTZ9HtSc
         vD4prhkx5h/Ble/2+UIMV59qysXD1cdWa6/ismBRIqhqX9BMop5F3M0Uw6cGSrko5wmt
         yNHm4ZR7SyhohAv2YDpR/t9xDr6FMz4uouR36bn6g/FIvh9/u7rnStLSVPuvvr4E4m6E
         JDfg==
X-Gm-Message-State: APuU4Z9wrlMsfTdaJrOdf9zyk+9faPoa7RPaZSZZmmV6YLReBm3Ih92J
	qPKU9vn8S3iLhEa7ycW0JmI8kbDPbCBWHculc43RBfO571OiDj7b6OTZ
X-Gm-Gg: AYBFou0nFaytu85s4BJHFKG1c6djE1YFAKf0v3hDuqAnK4PCr1mbEZUjEthA5rjL22E
	nXiHVselaaSCJK/SeR+3+C6P8LYnjub9WrasCTcifAMR4tdkdingAiPrjubybklvE0aBQTaWZWk
	6ZaajlF35Ae2+27+Dw6Fp49Te+L6TIHNMD2iDcgwB+zLQxEF4QvbduUMFDQlaO658uZPhtqlgX7
	vWtk7wQvFCAtbONBVvVhpUSzKTsKUp6gE//6ut3Q9iIvvpEIYFIOj2zbANjZEUbSqOd6jhmLY3f
	h3M0ZwlA3Qau28MNmb1D0v9MZ8c/AVbVm21jLMwPHxE62zQ+AhUX2CvZhHyUL+p1b6hsc16aEx4
	B6W8k/cS5+shbyjXoch0J5Ju0Qeoy/fFYnE9FFBwgEwn3TQmpw/UCb83K9vO9w5OeQejP4OZxkA
	8LIuERvMQTAGdwWC3VttL1ozFcvgs4p56Lz33WVe3wzAggLEuL7u4WOnwoaDBSghPvqIJxNioWv
	N/geNLaE1fU4kviNt0TNc0dUZpFHDF/+tkPrI8Jtqc0OOODegEVYP38KQPyohysA+kGMjC+zoX5
	U0PE3i2acg88qgMqrtZyUYabNaPYFah44YByfDbl1P/07YpMmLS5Goy+FffvwahniT110YRr25M
	pbQMTxGyCt686H2/xNrYAc8kK/q3xnZLK00473u3GvPJHM0olaj8pYdU6abY=
X-Received: by 2002:ac2:4e0b:0:b0:5bf:d2c5:a585 with SMTP id 2adb3069b0e04-5c15d7ad728mr1761203e87.66.1794479890258;
        Thu, 12 Nov 2026 02:38:10 -0800 (PST)
Received: from qblck ([188.130.155.185])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c157baf5aasm1529111e87.48.2026.11.12.02.38.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 02:38:09 -0800 (PST)
From: Artemii Mashanov <ralerrdirsardx@gmail.com>
To: johannes@sipsolutions.net
Cc: linux-wireless@vger.kernel.org,
	Artemii Mashanov <ralerrdirsardx@gmail.com>
Subject: [PATCH wireless-next] wifi: mac80211: initialize result for empty NAN function list
Date: Thu, 12 Nov 2026 13:37:59 +0300
Message-ID: <20261112103759.103891-1-ralerrdirsardx@gmail.com>
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
Content-Transfer-Encoding: 8bit

ieee80211_reconfig_nan_offload_de() may be called with no
registered NAN functions. In this case, the restoration loop
is skipped and res is returned without being initialized.

Initialize res to zero so that reconfiguration succeeds when
there are no NAN functions to restore.

This also fixes the uninitialized variable warning from Smatch.

Signed-off-by: Artemii Mashanov <ralerrdirsardx@gmail.com>
---
 net/mac80211/util.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/mac80211/util.c b/net/mac80211/util.c
index 69abd4e3f..155c4b66c 100644
--- a/net/mac80211/util.c
+++ b/net/mac80211/util.c
@@ -1772,7 +1772,7 @@ static int
 ieee80211_reconfig_nan_offload_de(struct ieee80211_sub_if_data *sdata)
 {
 	struct cfg80211_nan_func *func, **funcs;
-	int res, id, i = 0;
+	int res = 0, id, i = 0;
 
 	funcs = kzalloc_objs(*funcs, sdata->local->hw.max_nan_de_entries + 1);
 	if (!funcs)
-- 
2.56.0

