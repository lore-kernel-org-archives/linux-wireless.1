Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794501970;
	b=q5+JqS3sFIaFWcstHEIRFFvP+CJVtM0eRZLs3p+81De8sr722Ip5g2y8/wUtO8fG6dsV
	 gYFFFOF8ocMt9OsTpdwa4JlS66CaZqTG7wP00BFRZzEQM33M3oMpreq7uk9atHS9+dvec
	 pLL3Ui/Lfjw4R3wL7R21C2yOU1fuCVwJr4D73fQ6hljs/NbBaSl/ityrYW5iFky03Jhya
	 xjYBQtJzATFcA8p8pEslH1/bQdBONosmwUCjKZo69E2hYluyw/KPxO2zT7IJE9gHGbtnj
	 zJIoZW8jb25McWAIDFannKtsqABIK5SllAH129C/uQBiAcffi8SpiVgBrvzd2bVog4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794501970;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=yhQBP+6CMdb9Wj5EapIjlvPpI2vkMSvK5yEcWmZpYJA=;
	b=2QUl33jOvsrjVhNatki9U31tLET0G8+EEArWc1oytQ3h7OfQ6CcDr6dFAQ0xC4xwgzVl
	 uRXrDwX8+XOY07nqP/vMpko3pm+FoHODiIc3YG2b9lOJ5wZOuCjXq+NPImtvVQ6kJ0aI+
	 YtPKhC2FnoC1HNj6KX2Fc1oPsOC65gxizv/2HEMM2g6oKVjNLxa25rF0QJU1k8Pc4td2q
	 3PLgf0XzbwxzKTEPlhAD+oUCbWhSxQOp1CEbXKgj1wdUnVPF/JgKjUVKx9FmOurnPhYrX
	 HgI5sb2WoXlKMdyK/IMsTcMwkfZQSR2r9Hd4i60E3VvD3QKGXX+M+6CUNtAThMDrMiA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oikBrh3D;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55810606A32D
	for <linux-wireless@vger.kernel.org>; Thu, 12 Nov 2026 16:46:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 55810606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oikBrh3D
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso194265eec.0
        for <linux-wireless@vger.kernel.org>; Thu, 12 Nov 2026 08:46:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794501969; x=1795106769; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yhQBP+6CMdb9Wj5EapIjlvPpI2vkMSvK5yEcWmZpYJA=;
        b=oikBrh3DDBEvzfKdV6/bIVo/GToFgXf60OtSMB//nPGJfNUxVYF6twGnSDk8Jw+p4Y
         N4UWe//VCevNUdVxGiWOCDq7PyVkmV6YZ1EFMYmAej1TNr2hYMVdAWZaAeFCyuOdwEtK
         zw6E/HfCYHFhMts/U2U/sPVZ4iciyt3U/jXkc+yZ9TzQOV8WQ7cSbBuL98CoQUpoIiSw
         lzcPkv05JY5uBlmQLmGS/bhczlLtXjts4DUH8wCJ29qUI7tqJkgl2Zh01gJze+jWeT0L
         CoD7uQnsNzrVnaU7zH7RHecqk3PeLgjcfrQGVpllxmRzAxiVlNqkY1MEX0o1pBt+EXjm
         msOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794501969; x=1795106769;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yhQBP+6CMdb9Wj5EapIjlvPpI2vkMSvK5yEcWmZpYJA=;
        b=n3eqfwBBU8R9G5bwOZT+PKWBuGGhyWzw2knYCkZS/4GP1G7jyH4HKp6Q9G9JPkO2QD
         /kRsS9QTbOdQazJlYEiyaB7e6bcfLFAzS+uGYh/XUe5yqgQRgirZWp4IGeBm403+r8Dt
         OBucTOSJl0OfD9G/3/sGstU9jt2DenBr1bhoL8FSESoNtYzJMi5O+DXehlaxUNy3uvtL
         TFG7rN32rqtzNyFdbcKtySdRNP2cyKSNafOidDJxZV27jEfnCfVrINivoIMhrrSsoltZ
         4gPCpzYlwl9zFESmZyxVl6lgg3fEfBdtGJM1wEsZuhypOq0Z0y7b1SZ8DO2MCx/Aj9QX
         KiYg==
X-Gm-Message-State: APuU4Z/rlSoWWjyzOssP3ldiaSuPyye25iPyJPHOabBt5it9A/6We8dL
	muoaqYB9he+XLeqVg7IVNTGLT44v9j/ZHmGLrlckhaYeLCpAFJi9D6ZHRn2cuBX3
X-Gm-Gg: AYBFou1Y1YVavu6jiI9AMi2X3s1TpwEfTQ2QLIHYv/VaVJrnII3ALD1kP6g/Vd2owOp
	bws8ERPjHwHi5toMaqaWo36clvvAafiDAkm5wXLvVRlr3SMme+3c9r1Lu68ivR2j2xYsC7yVSJB
	/IDsh22rDwR2I0mzRzEj9IDsABxh8HqksACb5Zb4b79KmwBly4BOB7ySTFtXW38BxDM1reuT818
	4pM0aUOyTRKt24nJuLzT0THcWHz3v7Pyq5UDrS9Igf3ClxUf6MJFf9VTiNsueZsk6sx0B4bWLMk
	fL2ZxIfbhBS13wUBhV5XTIlFF38o+xNOAZui3xmMX7CyKSaigRoWxQUepZSmdqUGCt7E5AObWe3
	/8rlFkf6oZD+/hz4aLDNRpHEzXeaDmljZbnAgugRne4waJQngLS+PAZ4xDiyo6ZxHAopVAepwKK
	+ljrhqM5hWav5UT4L7TfckWi3MTGvQSFfsmsEopDfC2RxYFW1/UmZmG6/U9YZ0A+/djrazJRYDW
	ovnFU0PKDg4H+7A/hL9yHQ72XTbJo4yt67kCJPpJ0Ujfog44GWuQNLLac6lEA/D7TUu0IglmoB6
	rxY3A1kHCvMX9LH3fCbkDQpaP1a8oomjy3a/38tO4Qq/ZQcXsaExMT2RBlDM9JKa87txvQnx2P4
	JUXKm78e4CrzQid+d/h23zR+VOxTN1ixAtd91J7G2IzDb
X-Received: by 2002:a05:7022:2513:b0:1ab:faad:cc9 with SMTP id a92af1059eb24-1b503115806mr156032c88.11.1794501969159;
        Thu, 12 Nov 2026 08:46:09 -0800 (PST)
Received: from acemagic-m1.tail4fb79.ts.net ([2401:7400:c804:b668:2c54:4647:b67e:c94c])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b50300e5dcsm287090c88.0.2026.11.12.08.46.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 08:46:08 -0800 (PST)
From: Ho Jie Feng <hjf3108@gmail.com>
To: Stanislaw Gruszka <stf_xl@wp.pl>
Cc: linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ho Jie Feng <hjf3108@gmail.com>
Subject: [PATCH wireless-next v3 1/7] wifi: rt2x00: start the link tuner when an interface is added
Date: Fri, 13 Nov 2026 00:45:35 +0800
Message-ID: <20261112164544.3176458-2-hjf3108@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261112164544.3176458-1-hjf3108@gmail.com>
References: <20261112164544.3176458-1-hjf3108@gmail.com>
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

rt2x00lib_start() enables the radio before mac80211 adds the first
interface, so rt2x00link_start_tuner(), called from
rt2x00lib_enable_radio(), finds no station or AP interface and returns.

Start the link tuner again when the first interface is added, and stop
it when the last interface is removed.

Fixes: d96324703ffa ("rt2x00: merge agc and vco works with link tuner")
Signed-off-by: Ho Jie Feng <hjf3108@gmail.com>
Acked-by: Stanislaw Gruszka <stf_xl@wp.pl>
---
 drivers/net/wireless/ralink/rt2x00/rt2x00mac.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/net/wireless/ralink/rt2x00/rt2x00mac.c b/drivers/net/wireless/ralink/rt2x00/rt2x00mac.c
index 3bc0c1c906..86547ce81c 100644
--- a/drivers/net/wireless/ralink/rt2x00/rt2x00mac.c
+++ b/drivers/net/wireless/ralink/rt2x00/rt2x00mac.c
@@ -264,6 +264,13 @@ int rt2x00mac_add_interface(struct ieee80211_hw *hw,
 	 */
 	rt2x00dev->packet_filter = 0;
 
+	/*
+	 * Start the link tuner again if the radio is enabled before the
+	 * first interface is added.
+	 */
+	if (rt2x00dev->intf_ap_count + rt2x00dev->intf_sta_count == 1)
+		rt2x00link_start_tuner(rt2x00dev);
+
 	return 0;
 }
 EXPORT_SYMBOL_GPL(rt2x00mac_add_interface);
@@ -289,6 +296,12 @@ void rt2x00mac_remove_interface(struct ieee80211_hw *hw,
 	else
 		rt2x00dev->intf_sta_count--;
 
+	/*
+	 * Stop the link tuner when the last interface is removed.
+	 */
+	if (!rt2x00dev->intf_ap_count && !rt2x00dev->intf_sta_count)
+		rt2x00link_stop_tuner(rt2x00dev);
+
 	/*
 	 * Release beacon entry so it is available for
 	 * new interfaces again.
-- 
2.53.0

