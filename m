Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795768688;
	b=bMIaQLn05T3x+VfbiGOR81sARftmhibUp2jF4mw2kwO1qIl/6BGn97qnQ/e08ZUOx76w
	 6HMN09MK0FKXiEzoa2iEutZdqC3SgVBYdiWO24Cd2mTXJ1a+8Z/JDvYMCQ/XwPS28A2Ie
	 rPsULV9iZsazhWt9buL9yauySQBU9DKyz1G7ps70fWRulm1ZPaozPZoHs1CpncR27vIla
	 sVmMZy57kGDX6xcI5uFy8Y57iICLXIAWEAwCM5VY4WUUcoOvGG8MNoCsAl9hz+Jb5I1c3
	 IvRdx0GqbA3OeDtrc301Qej+GifSpA7j2Of4z8SGPU2v9/3BmFbEVFO1fyEdWIDOYeA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795768688;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=JpYk4m7u55uBxRHVd1S/r6n3Zj8g95nbpdebQK3UB/Y=;
	b=m7by/CY6P3yPF/o/UiVYCPdxYRPmldEMNvqUKX0vvENZy8rnSGP+cgfr03Dwr8pah9+z
	 hcOHYHI85UI3z+3c6CI5bxIKbXP/eYpZUdZ8k1jCspqdd3XHAqT2jlNktTsLViJ3dNc6H
	 raDCAd2t615Gc3nmt2yHEW6SASogictF1gIqcx0b5CeMsGY8RRAFEq1s622VH4aKEj2z3
	 bGpfWK5rd6N0D1UzmwOdiqjw6tFgNv75S9wwPcYqvGs1hgedgxpktC8L+wlRSSLzi9Z6L
	 NmYFUhtiO7xPJzfQtZLHgl3axXbZkYNMPFdE2OiqfvvtkuAvd83fHxq89t7AuCQYz4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tNRqIf1s;
	arc=none smtp.remote-ip=74.125.82.51
Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 804E4606A324
	for <linux-wireless@vger.kernel.org>; Fri, 27 Nov 2026 08:38:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 804E4606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tNRqIf1s
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-1ae58d17cd9so8893499c88.1
        for <linux-wireless@vger.kernel.org>; Fri, 27 Nov 2026 00:38:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795768687; x=1796373487; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JpYk4m7u55uBxRHVd1S/r6n3Zj8g95nbpdebQK3UB/Y=;
        b=tNRqIf1sjQlfAZe1ySVZiu1K2Y1XjHcGVQ3L8NG4R2HmlEkVnNJa2B7JUha285HPZg
         /SvLgzNEKoDliF+GIyIPMZYQKFn1Ab63SOKtPYsYhQYhxlr0MKUB6DEXbwrp9BGOwQ/2
         3k6spwYQGObRvGMERhqU2+uog9qLp2mgTIvSLawb97rIPr9IXihR0LqNq+Zp0vcEQmye
         SEXARI6bK7lUJwgeb2bZ/OupJL47QzvM2UVcKe78b0Eggqma8QSWATmfOwQ63qXE7Y5o
         n74ZPOruBU7ISpC+duzcP5Z+KF/865kkXgtbtpeDcjgqxzp5IN5rH3h1S4FB4RLgjsIg
         TTcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795768687; x=1796373487;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JpYk4m7u55uBxRHVd1S/r6n3Zj8g95nbpdebQK3UB/Y=;
        b=AYqr3EqyfbS+DuVv3tZ3T5o0u2o5n27Ul/doZfnLHEbfOr0FOP7ynYiD60m//9Xz4n
         4LGADiOlpS8mOuJUkA9jfrRhrilUBi03BHWQIj1uLyPmmih2jf85uw20NjYFms2aKMcs
         5KOICV6+PFMfy1fjZsd57hcx83AUq+VtBcq+CvT7FjTiDhXadh4s/vzHqVpbBWMVDjWK
         N43KNdShTuVMQOsCAFpjoFMf4xVULhQz3l8kpSt9NJrEuHSYH6NJkStkI28AF+zkdLxY
         n9q+svOa3en2jelexv1VZvgesY46L6VqXHG4IUqoJ68VmeJDoIjPPaSgz6txhW0L5DAK
         WjzA==
X-Gm-Message-State: APuU4Z8QzT6NOguJiTcAI0tRYHTl6Z3d+DeHecXhvdkF/5lzstfPgX3h
	/TvFob6fZMzS4uQf5dNwJkqo0QwhF0VKrOLaj/otmMNRlYbxFGpbnGGrOlKKfOhL
X-Gm-Gg: AZFdTZfvW4S4VCsLZSvyhbMpP9et/KItT8QDkj1CegeKfnNvlPpmXwUlsJtcOtc3V/m
	GtUTx2PcP0CuN/m+QG0HtkryIxTBK4i9x4ZzOJz4XefjPH1fFd80SUEYrTl3gAToVAE6eWqt0eu
	JbxS0l6UWkJ6bH+Zm0ui6B0HrKXb5qWzmwBA0GXAjOk+ZGpr0xSVh66wXXdsKlGd8tMtEWg15wS
	uuy6BeeRAvjDpHrga5YH519TgMqpDLG8gDZIzQRkl2BfPPO3xhMIvEqCXdcnMgL9ZqNx0u8sRb5
	or4/wveJ6yTcGUmZKBnNPB8Fuff0ETUH43QZ9KvM+jBt/xAb9JPISZxhX7CI9USqxFPC5L86Uum
	kXixuynQo9rilZDE00QkxtXt+jdMFZ5lhaW4WfUD1KNyjkRuefa6ftkoI0D9sz8HGeYu6ibGsmI
	0JZ+peXgdu4/p4hTxIrAHc/FLvMaXUJImwV2ZsGb7brC0bIXC/Fj9V2tvjFrlusS/H3BY7yrMj2
	n2/bZDw0Rdu/d3C9eBx5NPnUU8SxO0FvtZGJm5lgqxDPRDKNPxhk2fGfiMSJ/9ff8aslGkC8fXo
	e1Pz/sv9SPk7hR12XsJ49Bm0Oez8tsU=
X-Received: by 2002:a05:7301:160c:b0:382:c1cf:163b with SMTP id 5a478bee46e88-38571419d38mr22380158eec.32.1795768687424;
        Fri, 27 Nov 2026 00:38:07 -0800 (PST)
Received: from penguine ([157.15.89.58])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e96bdsm65793244eec.7.2026.11.27.00.38.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 00:38:06 -0800 (PST)
From: Swapnil Shinde <shindeswapnil028@gmail.com>
To: pkshih@realtek.com,
	kvalo@kernel.org
Cc: linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Swapnil Shinde <shindeswapnil028@gmail.com>
Subject: [PATCH v2] wifi: rtw88: pci: Enter IPS before PCI_D3hot on shutdown
Date: Fri, 27 Nov 2026 14:07:29 +0530
Message-ID: <20261127083729.7030-1-shindeswapnil028@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261127004822.8536-1-shindeswapnil028@gmail.com>
References: <20261127004822.8536-1-shindeswapnil028@gmail.com>
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

Currently rtw_pci_shutdown() invokes chip->ops->shutdown() and
immediately transitions the device to PCI_D3hot without stopping the
firmware/MAC or notifying Bluetooth coexistence when RTW_FLAG_POWERON
is active.

On RTL8723DE combo cards, leaving the MAC active across a warm reset
causes REG_APS_FSMCO polling (offset 0x5, mask 0x1) to time out with
-EBUSY (-16) on the next boot. Export rtw_enter_ips() and invoke it
under rtwdev->mutex before entering PCI_D3hot so the driver notifies
COEX_IPS_ENTER, stops the core/MAC, and enters PCIe link power save.

---
Changes in v2:
- Call rtw_enter_ips() under rtwdev->mutex instead of manually clearing
  internal flags and calling rtw_power_off() (suggested by Ping-Ke Shih).
- Export rtw_enter_ips() in ps.c so rtw88_pci can invoke it.
- Note on commits 05202746ed70 and 44492e70adc8: neither alone resolves
  the warm-reboot failure on RTL8723DE because 05202746ed70 only sets
  BIT_USB_SUS_DIS in REG_HCI_OPT_CTRL without powering down the Wi-Fi
  MAC, and 44492e70adc8 puts PCI into PCI_D3hot while the MAC is still
  powered on. Calling rtw_enter_ips() before PCI_D3hot fixes the MAC
  shutdown cleanly while keeping both commits intact.

Signed-off-by: Swapnil Shinde <shindeswapnil028@gmail.com>
---
 drivers/net/wireless/realtek/rtw88/pci.c | 4 ++++
 drivers/net/wireless/realtek/rtw88/ps.c  | 1 +
 2 files changed, 5 insertions(+)

diff --git a/drivers/net/wireless/realtek/rtw88/pci.c b/drivers/net/wireless/realtek/rtw88/pci.c
index 66d2e5f..ecf954d 100644
--- a/drivers/net/wireless/realtek/rtw88/pci.c
+++ b/drivers/net/wireless/realtek/rtw88/pci.c
@@ -1960,6 +1960,10 @@ void rtw_pci_shutdown(struct pci_dev *pdev)
 	if (chip->ops->shutdown)
 		chip->ops->shutdown(rtwdev);
 
+	mutex_lock(&rtwdev->mutex);
+	rtw_enter_ips(rtwdev);
+	mutex_unlock(&rtwdev->mutex);
+
 	pci_set_power_state(pdev, PCI_D3hot);
 }
 EXPORT_SYMBOL(rtw_pci_shutdown);
diff --git a/drivers/net/wireless/realtek/rtw88/ps.c b/drivers/net/wireless/realtek/rtw88/ps.c
index add5a20..41a13d9 100644
--- a/drivers/net/wireless/realtek/rtw88/ps.c
+++ b/drivers/net/wireless/realtek/rtw88/ps.c
@@ -36,6 +36,7 @@ int rtw_enter_ips(struct rtw_dev *rtwdev)
 
 	return 0;
 }
+EXPORT_SYMBOL(rtw_enter_ips);
 
 static void rtw_restore_port_cfg_iter(void *data, struct ieee80211_vif *vif)
 {
-- 
2.56.0

