Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.15.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795690694;
	b=ZA3xiR2L4ePQ0OZQUru9IOJ9ev5umzXi0me3Byf13wu0UC12INbGItrhWeKA4iMJ9IfD
	 LjhTr9jBvBFypP8QBz5Y9wMkjf61MdxlV/MkTkspBtcJRZC3GKsKX8VbX8KnP465xx4IZ
	 sM75MCJopMMYIMdwMmsHdegfzoxHAq7zsp1UJy8vvc//aBZWsivl+2ZQmIF561cn32nbK
	 yClLWx95QW7KnsJwGl/wUsPh7HhD+7dEl/qHrqObHubS3PoM/fsDmXLiRMc0Ax4RHgoTj
	 4+ZCIe17pVBKhwOwJ8cfEuJuMLYMXWhvGm2Oo1s/hnMisg4GwjgqpLJKAiNkuCRrdOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795690694;
	h=DMARC-Filter:DKIM2-Signature:Message-Instance:DKIM-Signature:
	 X-UI-Sender-Class:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
	bh=Mk6XpCjGt4QtKSyUMCtut2Bm3q6Kvg8CZ77GcAEV2zc=;
	b=SRbs/b9yQBAI7hlmjMyiZKu4DWflBn4R/lQ63egFG/dtkAuX3R2/h/7bcHhIbNSmJsA5
	 T6jHUnAjHTELEyCum52VK55QO65tgsq+5hnhO+gU3UFLPrVru6Qevr6pJRcl5VYt9HjzY
	 Uw7tqXh5loxoZmuiovDa+TJSIDUROq4SNGTjLtEQ8dias+oOgkQklFkQRaLqjNOp4Y+rP
	 lbjcCjSd1ASQU8mA+e/LQyFnlxLS+9rS9B6qDZOPKH5p7sXAmgJl0VtFhDN+ij47FkFyg
	 R8z8X+I2bBaEBE6VgGAldCaVniao2XHhkUjdKZSM4XB+WARnK5jkeU1wCxL0L7QNWHg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmx.net;
	spf=pass smtp.mailfrom=gmx.net;
	dkim=pass header.d=gmx.net header.i=georgmueller@gmx.net header.a=rsa-sha256 header.s=s31663417 header.b=ZP+oljMf;
	arc=none smtp.remote-ip=212.227.15.19
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BF93606A338
	for <linux-wireless@vger.kernel.org>; Thu, 26 Nov 2026 10:58:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8BF93606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=georgmueller@gmx.net header.a=rsa-sha256 header.s=s31663417 header.b=ZP+oljMf
DKIM2-Signature:  i=1; m=1; t=1795690691;
 mf=PGdlb3JnbXVlbGxlckBnbXgubmV0Pg==;
 rt=PGxpbnV4LXdpcmVsZXNzQHZnZXIua2VybmVsLm9yZz4=;
 d=gmx.net;
 s=s31663417:rsa-sha256:gadScfOAMmr7q9yiVwk0mjnidadx
   WPRpoxVf+/QvB97o2rzrC29rtvif2PJGssLAPoJmjb6lF9nYrTToieFVQLYfjeTTcvPtpKn/J3V
   xLoqMWD4OMxLlF7mrarCAyguqQlT59TkQ+fyTJ7iZf06rCL0XAfzylcv5mMUw0f03hRjB6M9nF0
   klh6r246q3rpOaSDhAKHWqJVgqBSEu/oru25mTjn8jL+afgaawkIuILaop8+yM7yZcl1bzC14ZS
   2qtbdc0cx7zspHTTO+W6eM6w4pqVCpGJ8ddMD+fm4Q29qE7xXDvzlWCj1FNERWzZD1L0I8+ZWP7
   UTdF9MgvjuMuiQ==;
Message-Instance:  m=1;
 h=sha256:
   Vygv8kJk0jiVXRE0wJQp+8fHSnaeyCyl2k84mtqvSV0=:
   33mZxq8AxS5CvdU+V9qBLhGowZKWEcIzJk4vEx+JWe0=,
  sha512:
   RymC9RKHpvY1w7WghIjPF50MObLMPCTfaRFAMsyW/S8p5Bpr70rCBCJV4lmjBp1+XDwhlKrAcJ1SrqyZ4N+vJQ==:
   qc8/vjWNKe7zSiGHCq1MDC5rOabCwm4CrS9cio018IK3khgRCJmxAjiY9xooJR4lsCSKb2L56sWSTZCxwEekSg==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1795690673; x=1796295473; i=georgmueller@gmx.net;
	bh=Mk6XpCjGt4QtKSyUMCtut2Bm3q6Kvg8CZ77GcAEV2zc=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=ZP+oljMfCIg+iIk3e3V6LIE/B0XoXSxan63nfehROusbKcfj1P9xpxHwioq/Ufyu
	 5lY+ujE676haTDKTBdfRFI/I0XaQC/bymjKIAVk+xUW2zRJ9a7UXrWdUyXOFFBCTn
	 xE/Jxzo++PJdB70NBz1t6Pf9LiE7O0SPtfn9I8y8iANIK6DQYlhMQSCD7Gm8JiiHG
	 XtPUJavn/heTOUNkgu4yvrtDeUlCNXc5jx4zyJwOL0tFpLcqAbmhknLbFIxhEeBVq
	 kbLVNUA6flwafhCtUYKkNvK1Hh9IeYOlYKOtNEiuQpVfyTSrFj5abxRRcppKbZTdN
	 sI5sh9io9Jf5ZIXDwQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MFKKh-1xhppg11Pl-0041VF; Thu, 26
 Nov 2026 11:57:53 +0100
From: =?UTF-8?q?Georg=20M=C3=BCller?= <georgmueller@gmx.net>
To: mehmet.fide@gmail.com,
	Jes.Sorensen@gmail.com
Cc: rtl8821cerfe2@gmail.com,
	pkshih@realtek.com,
	hi@shreyan.sh,
	mehmet.fide@screeningeagle.com,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Georg=20M=C3=BCller?= <georgmueller@gmx.net>
Subject: [RFC PATCH v4 1/5] wifi: rtl8xxxu: move dynamic_tx_rpt_timing_counter from ra_info to priv
Date: Thu, 26 Nov 2026 11:57:38 +0100
Message-ID: <20261126105742.1086282-2-georgmueller@gmx.net>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261126054350.2893087-1-mehmet.fide@gmail.com>
References: <20261126054350.2893087-1-mehmet.fide@gmail.com>
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
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:N3+CgKoxFS7va1r0vNpCyHCl4YDCCxHHgndggbphLZ9IWZcjNwO
 mCwK8faX3lMCuSaNbgd3o3ZW3kaZW2JCaf6LuThe1ACn6jcDb/GIgMwPEe82vPq6EFoqFoE
 QJVdnIS1xPEAA0vXwnDF5m/OeCvDO1+8prYElX1BklDmebXSP3qoS2xRurTiEt+X+zF6y3U
 tNZpFdz0yl+puff8NHw+A==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:OnKOlbjMTno=;GQImepWjQWltv730bh04sNceJ5s
 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
 g==

dynamic_tx_rpt_timing_counter is not per mac_id, but used across all
mac_ids.

This is the same as it is handled in other upstream drivers [1][2] which
support AP mode.

This is a preparation for having one ra_info per mac_id. It does not
change anything for station mode.

[1] https://github.com/lwfinger/rtl8188eu/blob/master/hal/Hal8188ERateAdap=
tive.c#L248
[2] https://github.com/lwfinger/rtl8188eu/blob/v5.2.2.4/hal8188erateadapti=
ve.c#L285

Signed-off-by: Georg M=C3=BCller <georgmueller@gmx.net>
=2D--
 drivers/net/wireless/realtek/rtl8xxxu/8188e.c    | 8 ++++----
 drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.h | 4 ++--
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/realtek/rtl8xxxu/8188e.c b/drivers/net/w=
ireless/realtek/rtl8xxxu/8188e.c
index fea5aec9ced9..d6f50e72d2ce 100644
=2D-- a/drivers/net/wireless/realtek/rtl8xxxu/8188e.c
+++ b/drivers/net/wireless/realtek/rtl8xxxu/8188e.c
@@ -1550,14 +1550,14 @@ static void rtl8188e_rate_decision(struct rtl8xxxu=
_ra_info *ra)
 	}
=20
 	if (ra->decision_rate =3D=3D ra->pre_rate)
-		ra->dynamic_tx_rpt_timing_counter++;
+		priv->dynamic_tx_rpt_timing_counter++;
 	else
-		ra->dynamic_tx_rpt_timing_counter =3D 0;
+		priv->dynamic_tx_rpt_timing_counter =3D 0;
=20
-	if (ra->dynamic_tx_rpt_timing_counter >=3D 4) {
+	if (priv->dynamic_tx_rpt_timing_counter >=3D 4) {
 		/* Rate didn't change 4 times, extend RPT timing */
 		rtl8188e_set_tx_rpt_timing(ra, INCREASE_TIMING);
-		ra->dynamic_tx_rpt_timing_counter =3D 0;
+		priv->dynamic_tx_rpt_timing_counter =3D 0;
 	}
=20
 	ra->pre_rate =3D ra->decision_rate;
diff --git a/drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.h b/drivers/ne=
t/wireless/realtek/rtl8xxxu/rtl8xxxu.h
index c6953051d9c4..debaaad217e0 100644
=2D-- a/drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.h
+++ b/drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu.h
@@ -1756,7 +1756,6 @@ struct rtl8xxxu_ra_info {
 	u16 drop;
 	u16 rpt_time;
 	u16 pre_min_rpt_time;
-	u8 dynamic_tx_rpt_timing_counter;
 	u8 ra_waiting_counter;
 	u8 ra_pending_counter;
 	u8 ra_drop_after_down;
@@ -1922,7 +1921,8 @@ struct rtl8xxxu_priv {
 	struct rtl8xxxu_btcoex bt_coex;
 	struct rtl8xxxu_ra_report ra_report;
 	struct rtl8xxxu_cfo_tracking cfo_tracking;
-	struct rtl8xxxu_ra_info ra_info;
+	struct rtl8xxxu_ra_info ra_info; /* 8188e specific */
+	u8 dynamic_tx_rpt_timing_counter; /* 8188e specific */
=20
 	bool led_registered;
 	char led_name[32];
=2D-=20
2.56.1

