Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794813619;
	b=qPcGj3KhB3tw+TQjqxHg0ZM0IW1dIhKmzDDxqQcJ24nO4ONYkUYyL7XAOKKhGc7ku9WC
	 QLsYzS+LDPU5nm3xqFN6rpcQQTfyrGKNWKHyq5drHf0xRtfrvnTIIYBGpGnpPiD94mlYg
	 SJmuou7JfAtGksZbcrN/Sft/lP7GJxg/M3M+ZD+N7XnDbl3OI6UyPEvoe4UaeRW8fNddo
	 8QTbyBJKKEys1xrphK6CWuRV3rVdzQmKl2ktZ5V5kuAJ67dHitbKAzgaxcW/DyxPR6qbP
	 w9U/F5TV3Ne6R9jc8yANU6gvU6NRhJVlQrWLB6NJ/vgaTxs6XZyWzUFKtZxOcN1tTbQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794813619;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=XA/9oFJowkjJrzyOPt6JWQLdeTS8v2v+5BiRAILsqRo=;
	b=fLmuzpSx6pvFO9tQ/4Mn61hFLWWiCqCZ9q0qAdvx263HAjtccpqqfXT7lmcp97x4b2kF
	 dbS07R+wgPAhTgtnQIc0zNf6qhRYD7ZZCBZsJeEQ4J0+LR7wIM6jOL8LNCxgeSc9CbzOi
	 ibAXgLSVA5l5XDlRlRO/e6gIO/SeJuNNeWlFBPcHqSqJHlTJh1iD9rmFn+r4FOT8ruur9
	 tubAYUZfl4egP/W/X8dJl/eCosWDNF/xV7o3PjdnzYq1wbxZvX2KRcFPtjbs5FoP3TsSM
	 ycK9CvgvPNaEI7RYDsI4QQ4eYLF34rMzS6FKOd8eu7cmh1qG8qjGUg62mSZa2rpZCuQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PFREsfOC;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AB71606A333
	for <linux-wireless@vger.kernel.org>; Mon, 16 Nov 2026 07:20:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7AB71606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PFREsfOC
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a2153c8525so18020455e9.3
        for <linux-wireless@vger.kernel.org>; Sun, 15 Nov 2026 23:20:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794813618; x=1795418418; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XA/9oFJowkjJrzyOPt6JWQLdeTS8v2v+5BiRAILsqRo=;
        b=PFREsfOCeFYMfGzTmYfGW74TGfRj2TeVaJJglwobLRTmFEwHZqiUVHtoafiUP16PYd
         11ROQfYGEx2kwctCVAHewW+Q5yXlZpU10qYdepN2cibji7DD3FwIT3oCtaNX+Ly0gWtl
         rThvoH+GGDeV/wQjr8wA1SJ5GomF4095+F9R31W6vGvcTuxBjsvIz9h2kIKHgpY+5VJ8
         gv9I9FEQVUEM+BKvwJ8MJfoWtLWIp9Nw9cb8lHxwGKCEjEcnhBNRnG8OXVHWPXNkNnxL
         StHZWZkWLOeJQy4ewnkuGTbs8nPoPajANof0qXMqkoP3n0mGyygLefTwFjrnkkkNED3v
         qBig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794813618; x=1795418418;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XA/9oFJowkjJrzyOPt6JWQLdeTS8v2v+5BiRAILsqRo=;
        b=SR2ihYYexh/yyAQtr9sjbInJRjaFyxuNZsQ70gFbgtH28JCBwANZHTDZuxlllK3NHP
         9/Fe5txYF/Wjsjai9FnK1Ykc2mYDj6qw8265jliWAiirBVugaHs1vprTkLtdTZLucZue
         3tNziBGuYYmY31GpCvFr357UnyhZFTzliPpb0PfBGqU+OF47U2Z+vKm4kfg8nnbgIDtm
         Z9vTLT1pwq1f4njtORk7x8ZrzcsgyT0+m1H+isDvV/BMc8lp8vmMTtC+uRme6tLo5avb
         kYmQnPt8rcsnL6BgMzLFn/ffKha3smUhONeN7M+WLG7sTb7U/kkxJFXSPr5+UvjsVK2a
         0o8Q==
X-Forwarded-Encrypted: i=1; AL+hErFtddfLHYPzSc3teISwJB7+R+8IH9N5qXB+mpYWXruF5lx7DwM2AGu/G0AESsSSlnXO8bfkGyXMq6H83Gu09g==@vger.kernel.org
X-Gm-Message-State: APuU4Z/VVi+qvOhRZ/Nlcu/pl4BtaL/7YW5qVa+h6bRXSzRqRHTTeg4E
	2QPGPAv5Tw2ckA0IJL0snrXo2mAco20v2tOLqN+5IqbbnbHR7pJhUbw2
X-Gm-Gg: AYBFou0Of2jXhPk6uJcWDwjI/oSllLz9QVquHZgefzQhnGnkFGzRrEn+23/DeK1VnCl
	MyZ2QkIIZEldc6hWMScSwsTREGdeohexGiktjvVIEZ1fsdmfSXg1cKrMhYeI40EqLNHvnG8hdRG
	bdJHaogSbi9G2j++9DSeaZUeZqhINFD4/cqhOZSJ4S6VJ566K5M/NwlAj9h1/RSwVFAElKDuTR/
	hrf/JmHbFvpGCEKvfF6vsQCWwGFbtBnks/m6zJQdpxtYuFho4am4O2sky+5/wfa6F31F0k6MWbo
	qMQFbR/XYFQW8cG8t0SUOLg5jT+IHQZVmWf3ULqfuJU1g2DQsLJ5P7nObCyFL6eWTOvPpYovzaF
	KCJBB7cpBmf5tU71t6ySqduULl/r+5vkNiCEA2yeaAgRnu+IierLX3KHksfz0HgpviQ9yHeWhbk
	wq0EmjtGrwIoMaF502aZyh7jPDgZtmA5YIiMGanCv6w6s+RmsoZ56ZDXkTlnKQUS2YwZUC2CMmr
	k0WpW1wUZiax2wYwNqOUzxXxb/DP7CG7e9QRhz2bGP43LwluQ1zeQbToWOf/xqxXSMxw9muyrMg
	GnJ6q3vVEBDE2sqT7WkTCbjVdSs/8peo4XM=
X-Received: by 2002:a05:600c:3ba4:b0:4bb:741d:ea8 with SMTP id 5b1f17b1804b1-4bb741d1220mr24878165e9.7.1794813617856;
        Sun, 15 Nov 2026 23:20:17 -0800 (PST)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5d03b10fsm22953761f8f.1.2026.11.15.23.20.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 23:20:17 -0800 (PST)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: Luka Gejak <luka.gejak@linux.dev>,
	Zong-Zhe Yang <kevin_yang@realtek.com>,
	Tzu-En Huang <tehuang@realtek.com>,
	Yan-Hsuan Chuang <yhchuang@realtek.com>,
	Kalle Valo <kvalo@kernel.org>,
	Stanislaw Gruszka <sgruszka@redhat.com>,
	Brian Norris <briannorris@chromium.org>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mehmet.fide@screeningeagle.com
Subject: [PATCH rtw-next v2 1/3] wifi: rtw88: free the reserved pages of an interface on firmware recovery
Date: Mon, 16 Nov 2026 08:20:12 +0100
Message-ID: <20261116072014.1142494-2-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261116072014.1142494-1-mehmet.fide@gmail.com>
References: <20261116072014.1142494-1-mehmet.fide@gmail.com>
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

From: Mehmet Fide <mehmet.fide@screeningeagle.com>

The recovery after a firmware crash resets the driver state of every
interface, and mac80211 then adds the interfaces again without removing
them first. rtw_ops_add_interface() starts with an empty reserved page
list, so the pages the interface had before the crash are lost: the
next page build takes them off the build list and nothing frees them.

kmemleak after a firmware crash with an AP interface:

unreferenced object 0xffff0000cbe22c60 (size 96):
  comm "hostapd", pid 25545, jiffies 4296463067
  backtrace (crc cbdc21c4):
    kmemleak_alloc+0xcc/0xe4
    __kmalloc_cache_noprof+0x234/0x3bc
    rtw_add_rsvd_page+0x38/0xa8 [rtw88_core]
    rtw_add_rsvd_page_bcn+0x30/0x58 [rtw88_core]
    rtw_ops_add_interface+0x144/0x2cc [rtw88_core]
    rtw_ops_change_interface+0x6c/0x80 [rtw88_core]
    drv_change_interface+0x100/0x258 [mac80211]

Free the pages where the recovery resets the interface.

rtw_ops_set_tim() can queue the beacon update work between this reset
and the reconfiguration, for a frame buffered for a dozing station. The
work would then find no page to build and warn about an empty reserved
page. Let it do nothing while RTW_FLAG_RESTARTING is set: the
reconfiguration downloads the beacon again.

Fixes: 5c831644e1f4 ("rtw88: handle and recover when firmware crash")
Signed-off-by: Mehmet Fide <mehmet.fide@screeningeagle.com>
---

Notes:
    v2: the beacon update work does nothing while RTW_FLAG_RESTARTING is set
        (Luka Gejak): rtw_ops_set_tim() can queue it between the reset and the
        reconfiguration, where it found no page and warned

 drivers/net/wireless/realtek/rtw88/fw.c   | 6 ++++--
 drivers/net/wireless/realtek/rtw88/main.c | 1 +
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/realtek/rtw88/fw.c b/drivers/net/wireless/realtek/rtw88/fw.c
index 945fedcd375b..c9224749826d 100644
--- a/drivers/net/wireless/realtek/rtw88/fw.c
+++ b/drivers/net/wireless/realtek/rtw88/fw.c
@@ -1800,8 +1800,10 @@ void rtw_fw_update_beacon_work(struct work_struct *work)
 					      update_beacon_work);
 
 	mutex_lock(&rtwdev->mutex);
-	rtw_fw_download_rsvd_page(rtwdev);
-	rtw_send_rsvd_page_h2c(rtwdev);
+	if (!test_bit(RTW_FLAG_RESTARTING, rtwdev->flags)) {
+		rtw_fw_download_rsvd_page(rtwdev);
+		rtw_send_rsvd_page_h2c(rtwdev);
+	}
 	mutex_unlock(&rtwdev->mutex);
 }
 
diff --git a/drivers/net/wireless/realtek/rtw88/main.c b/drivers/net/wireless/realtek/rtw88/main.c
index f7708ad17b6f..adc54b063382 100644
--- a/drivers/net/wireless/realtek/rtw88/main.c
+++ b/drivers/net/wireless/realtek/rtw88/main.c
@@ -627,6 +627,7 @@ static void rtw_reset_vif_iter(void *data, u8 *mac, struct ieee80211_vif *vif)
 	rtw_bf_disassoc(rtwdev, vif, NULL);
 	rtw_vif_assoc_changed(rtwvif, NULL);
 	rtw_txq_cleanup(rtwdev, vif->txq);
+	rtw_remove_rsvd_page(rtwdev, rtwvif);
 
 	rtw_release_macid(rtwdev, rtwvif->mac_id);
 }
-- 
2.56.0

