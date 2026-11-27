Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795805611;
	b=L078kGdsJ7tXii0PITpxGrYN9+08omXHaYYAlaTCIfegp7v5tjI5LqLFc0VHH3vgUJ4A
	 +kvo8NH8KkbgBKk5xzLUP4ExbHC5Z+gzCz13/RIIIdHhWhm2HTMoBzcNTTjoCVu9cUGM/
	 dMyvBWeG0COnkNgqgxTXrND1hu1f2Nwv+m+wWfvI5doxOlRhfqi7mT2MY8KIca8k386GZ
	 B0ZjJJUgO+2N6V16xXh3ukrpsJAafvceSU1FIh8eFwwvcuPNDjRPXDdO201vTAgtkYFCg
	 YDQnMX5tMjYNozfikldVCsjIMOrCbuYf37TT4nR3/qr2OloLT8tpDxKqPpPDnoKn+KA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795805611;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=MX2vpm7pqF7szoIWLCsrCnmJiyuCr2/xr71Zv57NqJo=;
	b=bktBsAmlX72cl9Pj0DgXs9lYKIGPgqU3/ftM6GTvazJHoj6ZcfFncIx7GTMoEeL26Fmw
	 EveTHelXRRHAvdYmKvwoK9iVjwCeIXBnSvdgRXYwr0HZklfHVB4AJX7mIJreThv9iOa7e
	 qzZuiKttHD83HzHZg8/JabycblVA40QalPh/sat9Hq0zf4CJDR8JepfVqcKhWnrzQvqDk
	 wkNkn8HSN1enn4l/4VidsYt9v4CNveCOCGPAvlvHOsp6/mbG8zxIzPMdazKKXQiSLAoUg
	 f4aYOMd1pYzZHinHBkrxWBu3WzYzdHvv5SbC3Mw9avudpinQfWk6645O+EyXu/0RnBw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LzXusI9M;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6C2D606A326
	for <linux-wireless@vger.kernel.org>; Fri, 27 Nov 2026 18:53:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LzXusI9M
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795805610;
	b=RutXFEiK1cdblAm6qJYcS+qKfT2hOYg7/cP1nLAb27Q1fVR3G1Unf2pOfDW7lUUBe676
	 D0JrRcVqaX7sgO2VJ3TAZFCEcWUXgMNJsiRIfY5+HmNDDJP4sC0yUGL8+WUSJrAsVhJUd
	 T5LKKc2riT7Q1oUrHbAtgv89YrdCc2HHOXJtNOzGLNJXZvvnD2hU+ymrhox32ABC0ZnpV
	 3tiv9WFngW/gSrNIAjGl3qi7YGXsR2Oj5vBURMiH1X2Bfc60D2f9FKNbnHxva1/CJPkGL
	 n7lgFew023gPp/tSrqivSSIC03rBUDVwraPgkRkrsI22NiFyFrc7yKUogJ25b2w9Vyw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795805610;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=MX2vpm7pqF7szoIWLCsrCnmJiyuCr2/xr71Zv57NqJo=;
	b=eQyzChv2uw6VP8fh8C9NU/X3irFZ0t8HG29UPyluqBpkqcHRupADy33IhIgDZor1AXfU
	 laq0p0WeBLAmr4PNYeWwKg1cBpyfG1VfGUfY3LhIuGtfjsEoak4CJKPUl6PN+fk+gOHlG
	 EsS3bFsPWfrBtUVp9msjs/GUmYCJLyKnx9N89ThrZesPKOJaN9b0axhe/uPbo7q/FRLmH
	 OeuOjsb2YIGuu3On9eKUObV1Gz2USwEwtm15f8WXMmOd3L0RgA+ZLeCu7TmIhBPKwQr+m
	 MfDDIVH48dnnrAaWMiRyxKLvTjBdfOlogtrf2ix4M8YtQ/a9BH0sSTR/RskzYINBbqw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id EC26E1F00897;
	Fri, 27 Nov 2026 18:53:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795805610;
	bh=MX2vpm7pqF7szoIWLCsrCnmJiyuCr2/xr71Zv57NqJo=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=LzXusI9MiY6t/K3mNltC/brN4cl4SjMIM96HMMr8jN/pgwn35Ts9zvCRDA5h5OY/c
	 rWqauAqxHfeD31LydLHDOT+fYAV4C0xdVTrlWDlWbrrlafhdXaiXQG3df4dQhefw+D
	 sqp690c17ekRRRiiawkjW34PghBIUfeuKIAKCIR/lewr3wSdj6kSVt5uuKXHWU+UCX
	 2D+MVdc2H1PGN90qdRsMFviPl4vBO65YYJ/OFRzjIUBqE9xm0weY6F6YhRUuY6kZxt
	 uXh2VlpTJYo+abYYTvnmQirVIE2IF1oszlx94EUYwbT+TVZfa4en4EfdlplydYQZoo
	 wiDOoNkXFKHnw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 7F8FB4DD62;
	Fri, 27 Nov 2026 18:53:27 +0000 (UTC)
From: Ahmet Zeren via B4 Relay <devnull+niko3x.proton.me@kernel.org>
Date: Fri, 27 Nov 2026 21:53:25 +0300
Subject: [PATCH wireless-next] wifi: mac80211: don't mark NO_ACK frames as
 failed in TX status radiotap
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
Message-Id: <20261127-b4-mac80211-noack-v1-1-c7e6f7c56d3c@proton.me>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWMSQ7CMAwAv1L5jKU6LaTwFcQhcQ2YJUVxgUpV/
 06A42g0M4NJVjHYVTNkeanpkArQqgI+h3QS1L4wuNptiJzH2OI9cFc7IkxD4Cs2fdfw1nO79hF
 K98hy1On33MNbs9zEDJNMIxz+2p7xIjx+v7AsH+LMv8eEAAAA
X-Change-ID: 20261127-b4-mac80211-noack-3d83c97c457b
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org, Luka Gejak <luka.gejak@linux.dev>, 
 Ahmet Zeren <niko3x@proton.me>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795805607; l=2102;
 i=niko3x@proton.me; s=20261119; h=from:subject:message-id;
 bh=M1kdcetf79sRn55NV0lLAtC+P4wolqACj8MViFJSKg0=;
 b=A4kx9IBIzRJ8nRev7m+QjAeLwq5A825LhA+TsgTAw4Gn5FUpfecrf4Aws2w9cDfNvgv4NzUYw
 kpceCAtOKpzDAJJZ/jc1WgPF41jExgtVhFgaGD/IdqVwi+4xLT9spZo
X-Developer-Key: i=niko3x@proton.me; a=ed25519;
 pk=J4zNm2pudzQ/wF+pQ8xO+wW6jpcNa9EJ2C1g4DUAjhM=
X-Endpoint-Received: by B4 Relay for niko3x@proton.me/20261119 with
 auth_id=1575
X-Original-From: Ahmet Zeren <niko3x@proton.me>
Reply-To: niko3x@proton.me
Content-Transfer-Encoding: 7bit

From: Ahmet Zeren <niko3x@proton.me>

ieee80211_add_tx_radiotap_header() sets IEEE80211_RADIOTAP_F_TX_FAIL for
every unicast frame without IEEE80211_TX_STAT_ACK. That includes NO_ACK
frames that the driver reported with IEEE80211_TX_STAT_NOACK_TRANSMITTED,
i.e. frames that were sent successfully, so monitor interfaces show them
as failed.

Don't set TX_FAIL when IEEE80211_TX_STAT_NOACK_TRANSMITTED is set.

Tested with rtl8xxxu on an RTL8192CU (0bda:8178), on Linux 7.3.4 where
this code is the same: injected unicast NO_ACK frames were shown as
failed on the monitor interface and no longer are, and acked and unacked
frames are shown as before.

Reported-by: Luka Gejak <luka.gejak@linux.dev>
Closes: https://lore.kernel.org/linux-wireless/20261127115929.40205-1-luka.gejak@linux.dev/
Signed-off-by: Ahmet Zeren <niko3x@proton.me>
---
Luka noticed this while reviewing rtw88 injection patches, which now
report sent NO_ACK frames with IEEE80211_TX_STAT_NOACK_TRANSMITTED;
rtl8xxxu and rtw89 do the same.

AI tool use (Documentation/process/generated-content.rst): the patch was
written with help from Claude Code (Claude Opus 5.5). It was asked to
make the change Luka suggested and to test it on the RTL8192CU with a
patched mac80211 module. I have reviewed and tested the change and take
responsibility for it.
---
 net/mac80211/status.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/net/mac80211/status.c b/net/mac80211/status.c
index 5d1807ab46e..48db461d8da 100644
--- a/net/mac80211/status.c
+++ b/net/mac80211/status.c
@@ -315,7 +315,8 @@ ieee80211_add_tx_radiotap_header(struct ieee80211_local *local,
 
 	/* IEEE80211_RADIOTAP_TX_FLAGS */
 	txflags = 0;
-	if (!(info->flags & IEEE80211_TX_STAT_ACK) &&
+	if (!(info->flags & (IEEE80211_TX_STAT_ACK |
+			     IEEE80211_TX_STAT_NOACK_TRANSMITTED)) &&
 	    !is_multicast_ether_addr(hdr->addr1))
 		txflags |= IEEE80211_RADIOTAP_F_TX_FAIL;
 

---
base-commit: 18d0bedbb5f0538396cb7f763ed9cd1dd69c5b23
change-id: 20261127-b4-mac80211-noack-3d83c97c457b

Best regards,
--  
Ahmet Zeren <niko3x@proton.me>


