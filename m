Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795431613;
	b=yOrPLKxwfVyLl7HhZBAIHasQYxDkI3MquOG8hKj6VtCK9h/bx61ZB1vWrQY6+MYqYNGT
	 FWqA2NTDtXQyyX+pp98/hcE3eRzTEhiGJKxq4VmfHRibpazA7cfnVnZtWZ+htalwI5xY3
	 /gMfl41dQn5Cj+CzMRiQWuptZ3qb3Fowao/67iVV0rR/CFktBnIzQeg6bBcdc3Meh5Lsi
	 l2x3xpCndlgn4oBspI5rvVxCIFkfZk1XNG26sX/0PjiOx14y1HVH54cd/yicvdhQGf7mn
	 wE1gNKnRyjf24YtQKTSHR+qdgELHb7oLR0cpKSMva6hE6fY/IKiHDbk4FHP1yLIGzLA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795431613;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=ECfYoY8F+lCFkeZwCo4IjOYP/BenjEtPYMmwZCiag6s=;
	b=YBzUnzt/49EBVWY8KCM1Y4egHjdIakzZ0m01+127jYXTewfukcS7pW57+ak6rjRzbVmw
	 f9p90/H20/zYoY9Jq81O9CnhiYD1361fvZtBr6Qs5OPIE96nBP+bOcurgCasAzBTrQDKM
	 TsT+A3m57ttuCmvwyAaADWFQylCriTOR2EEb5XZVgPYE5yimw9j5A4VOEdcakN+AW3nZd
	 DF6dcgnFFPlGI32eGSg3cGMEGC8PfTs027mfgQ6e6JIC8HYj0IxSZ4YzWrnQTn/i7hOD4
	 XuFpjjUDWy/A++Pi7Ded/HRLGCxWoPTvvUiGil790hI8Q/ko7cpX05mJnuYuQGxvWmA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="iaa/zBv4";
	arc=none smtp.remote-ip=74.125.82.41
Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C780A606A31E
	for <linux-wireless@vger.kernel.org>; Mon, 23 Nov 2026 11:00:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C780A606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iaa/zBv4
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-1b3a05f8b5bso3920820c88.1
        for <linux-wireless@vger.kernel.org>; Mon, 23 Nov 2026 03:00:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795431612; x=1796036412; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ECfYoY8F+lCFkeZwCo4IjOYP/BenjEtPYMmwZCiag6s=;
        b=iaa/zBv4ZxD4e02VGB+gofIFtiBaCgfFWKqayI8RE0gNU/5IPMRizuSn6ccN3mybRP
         IsLNYM9MCekVCcLudYHJl8B7fLlRwRRyFkg0X+a3DXlPawXApgEcdlswRKe3QSP9G/XW
         Yy5OxctgBtW+Lsjmo26SCtQk7YhOc149q33m4Fith45I/9SCMf2CKYRVC2CeSSoJeld0
         LANU9TW29CrHhoa1ibFdI8vtx+P4kjHcabUkAcAnOrwWJqfcmKe2KYoXHoEUpEOuMh0Q
         D9Z2Qtv5HWrppqGu7AULQe+YvKtENyE3KmaETwdQNj7KW/TMG07Y+57spL6K1NXoCgDx
         HHlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795431612; x=1796036412;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ECfYoY8F+lCFkeZwCo4IjOYP/BenjEtPYMmwZCiag6s=;
        b=D4IZk/B8EijbqONUjWBcNkIDXAjx1ZR48ZYi7up9Ymh+MJuyv+6ISr9HTiGx5l4y1c
         60w/Hq5EziMkM/hJpZxl/bcEyxODCjEkXVHwJncN8q1CCAya/ZtxSTyUE7Ij7H1/koa7
         Z1d0eI9mOgxHYF5kKnZv7fXPktkMKHg6fCB58mfPLmIYCUWq1ScTVbifsQeLUzTLtDkf
         BSNSPbopGP3MJWsb/ku1jN/6GQQSgKiScfC6VcrXHhl55sPij93uHmMoU9ej05W/Kou+
         hIIkJ4yBgYveTQ6A3lmDSOezKhFR10hr+L8cTjPg6bkaOdSWhKaD+MTKRSjbJaXEtC38
         we4A==
X-Forwarded-Encrypted: i=1; AL+hErFIug4Dv6dwp0217LaknZgceVPdI2pMJbzO2o61hm+IJ/+LlaICbjIVwZn61sE7admaI2quUxsqwC36kCziWA==@vger.kernel.org
X-Gm-Message-State: APuU4Z+EwCeoDJfk0HJLL0vxHF3zBVmkbKTTH56UVyyxm2xXMnOnis9X
	D6v8ucVvOsNmhAWkwUS+hIWEgpPCUKsBVB1AgruP8ojO7glV6xgBSgs1
X-Gm-Gg: AZFdTZc5SatrGXthe4qWJWFXxjpWf0boOqtnim6KwVbFx7vxsIx/xVPEO3TsEQBOWiC
	FKDRntrPbQHSm/iNyLort0s/aA8tulvEXNQ7Ay+J65K8XtDnyzE6qn3WYW2kOF2MxVPX2sQILvo
	qxfrdP20HUfgISWiHVXwu6pIlhMA9sUod3lNWim6IZ7WKesVri9cq7i20RztEPMTRtALly9ogVY
	sQ7pXWxu5rSagozdZk0C/tqWNm2ZbpyajvazfYBd3C3zqAtxtHsXLFYuW6LVpcxj0+DWN5LdXg1
	5hjuEklYqVn96utQ9CSy5t+NVCMU6MLFMUMdHm9xd4sgzTlM2HJHq9tVkSlyPhSUG4G0cJljSmx
	CPLIC9vIhSMA1jjd5eeNq9/aQPbdD2oCTxjy0FNCgS3/HR/xw2Dndk8mn4+nMkqfQJ26fJ+KIST
	WYwxFcMozw4lgve6xsvq6LkBBtp+NPkFoA56tvKCy7gI8SA3TuNDE4wAIrFBUMWRqENCH6dfGV6
	mLbNDNapiU0MSwASyi+VMBaikU/IO5c8KwjSP59SH65j0hbx0w4ccfhnRPPIX43YYscOpjbUi/P
	2A/jyCkzWdRsBB6yeBzNu3KK4gn05gowSfE3zt+RZJf7e3szTNnf8EXdiLF83FOjVsnDg8LTqkr
	XX75M0bZ5c34xHjYEF6SdA0BrRDeOoUThugAbFxf2RHfgog==
X-Received: by 2002:a05:701b:260e:b0:1a7:e1c6:6f33 with SMTP id a92af1059eb24-1b5568d3ca9mr11253795c88.30.1795431611509;
        Mon, 23 Nov 2026 03:00:11 -0800 (PST)
Received: from ip-192-168-31-150.ap-south-1.compute.internal ([2409:40d2:2011:872e:6565:a2df:e6e1:88c7])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b55ff0e4e6sm20501075c88.11.2026.11.23.03.00.08
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 23 Nov 2026 03:00:10 -0800 (PST)
From: Tanuj Sharma <ertanuj96@gmail.com>
To: security@kernel.org
Cc: pkshih@realtek.com,
	kvalo@kernel.org,
	phhuang@realtek.com,
	gary.chang@realtek.com,
	linux-wireless@vger.kernel.org,
	Tanuj Sharma <ertanuj96@gmail.com>
Subject: Re: [SECURITY] wifi: rtw89: OOB read in beacon/probe-resp IE parsing (OTA, pre-auth)
Date: Mon, 23 Nov 2026 16:29:56 +0530
Message-ID: <20261123105958.75875-1-ertanuj96@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261123101028.58146-1-ertanuj96@gmail.com>
References: <20261123101028.58146-1-ertanuj96@gmail.com>
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

Attaching the proof-of-concept source code, full KASAN crash log, and a note
on why the production code path cannot be triggered on our test environment.

==========================================================================
1. Why no production KASAN crash
==========================================================================

The production code path in rtw89 is triggered ONLY when a physical
Realtek rtw89 WiFi adapter (RTL8852AE/BE/CE/RTL8922AE) receives a
beacon or probe response frame over the air. Our test environment is
a bare Linode VM (kernel 6.12.115, KASAN generic) with no WiFi hardware
— the rtw89 driver cannot be loaded without a PCI device match, and
there is no way to inject 802.11 management frames without a real
wireless interface.

The root cause is mechanically verifiable from source alone:
cfg80211_find_ie() receives `skb->len` (total frame length) instead
of `skb->len - ies_offset` (IE region length). This is an arithmetic
fact, not a behavioral claim — the OOB read is unavoidable when the
IE search reaches the end of the valid IE region and continues scanning
the remaining `ies_offset` bytes (36 for beacon, 28 for assoc_req)
past the skb data.

Verification approach: kernel test module that allocates a kmalloc(100)
buffer simulating an skb, places valid non-SSID IEs in the IE region
(offset 36..99), and calls the SAME cfg80211_find_ie() logic with the
SAME incorrect length calculation (skb->len instead of skb->len - 36).
KASAN fires when the scan crosses byte 100 (the allocation boundary).

==========================================================================
2. PoC — kernel test module (rtw89_kasan_trigger.c)
==========================================================================

Build: make -C /lib/modules/$(uname -r)/build M=$PWD modules
Load:  insmod rtw89_kasan_trigger.ko
Check: dmesg | grep -A30 "BUG: KASAN"

Makefile:
  obj-m += rtw89_kasan_trigger.o

--- cut here: rtw89_kasan_trigger.c ---

#include <linux/module.h>
#include <linux/kernel.h>
#include <linux/slab.h>

#define WLAN_EID_SSID 0
#define BEACON_VARIABLE_OFFSET 36

/*
 * Exact reimplementation of cfg80211_find_ie from
 * include/net/cfg80211.h — scans 802.11 IEs: [type][len][data...]
 */
static noinline const u8 *find_ie_kern(u8 eid, const u8 *ies, int len)
{
	while (len >= 2 && ies[0] != eid) {
		int ie_len = 2 + ies[1];
		len -= ie_len;
		ies += ie_len;
	}
	if (len < 2)
		return NULL;
	if (len < 2 + ies[1])
		return NULL;
	return ies;
}

static int __init rtw89_kasan_init(void)
{
	int skb_len = 100;
	u8 *skb_data;
	const u8 *ies;
	const u8 *result;
	int ie_region_len;
	int off;

	pr_info("rtw89_kasan: === OOB Read KASAN Trigger ===\n");

	skb_data = kmalloc(skb_len, GFP_KERNEL);
	if (!skb_data)
		return -ENOMEM;
	memset(skb_data, 0, skb_len);

	ies = skb_data + BEACON_VARIABLE_OFFSET;
	ie_region_len = skb_len - BEACON_VARIABLE_OFFSET;

	/* Fill valid IE region with non-SSID IEs to force scan past buffer */
	off = 0;
	while (off + 2 < ie_region_len) {
		int remaining = ie_region_len - off;
		int ie_data_len = (remaining - 2 > 30) ? 30 : remaining - 2;
		skb_data[BEACON_VARIABLE_OFFSET + off] = 1;
		skb_data[BEACON_VARIABLE_OFFSET + off + 1] = ie_data_len;
		memset(skb_data + BEACON_VARIABLE_OFFSET + off + 2,
		       0x88, ie_data_len);
		off += 2 + ie_data_len;
	}

	pr_info("rtw89_kasan: skb_data=%px len=%d ies=%px ie_region=%d\n",
		skb_data, skb_len, ies, ie_region_len);

	/* CORRECT call — stays within bounds */
	pr_info("rtw89_kasan: CORRECT: find_ie(SSID, ies, %d)\n",
		ie_region_len);
	result = find_ie_kern(WLAN_EID_SSID, ies, ie_region_len);
	pr_info("rtw89_kasan: CORRECT result: %s\n",
		result ? "FOUND" : "NOT FOUND (expected)");

	/* BUGGY call — passes skb->len, reads 36 bytes OOB */
	pr_info("rtw89_kasan: BUGGY: find_ie(SSID, ies, skb->len=%d)\n",
		skb_len);
	pr_info("rtw89_kasan: Will read %d bytes past kmalloc end!\n",
		BEACON_VARIABLE_OFFSET);

	result = find_ie_kern(WLAN_EID_SSID, ies, skb_len);
	/* KASAN fires: reads past skb_data[0..99] */

	pr_info("rtw89_kasan: BUGGY result: %s\n",
		result ? "FOUND" : "NOT FOUND");

	kfree(skb_data);
	pr_info("rtw89_kasan: === Done ===\n");
	return 0;
}

static void __exit rtw89_kasan_exit(void)
{
	pr_info("rtw89_kasan: Module unloaded\n");
}

module_init(rtw89_kasan_init);
module_exit(rtw89_kasan_exit);
MODULE_LICENSE("GPL");
MODULE_DESCRIPTION("rtw89 OOB read KASAN trigger - defensive research");

--- end cut ---

==========================================================================
3. Full KASAN crash log (dmesg, kernel 6.12.115)
==========================================================================

[  222.600479] rtw89_kasan_trigger: loading out-of-tree module taints kernel.
[  222.604268] rtw89_kasan: === OOB Read KASAN Trigger ===
[  222.604294] rtw89_kasan: skb_data=ffff88810e1ab800 len=100 ies=ffff88810e1ab824 ie_region=64
[  222.604308] rtw89_kasan: CORRECT: find_ie(SSID, ies, 64)
[  222.604316] rtw89_kasan: CORRECT result: NOT FOUND (expected)
[  222.604325] rtw89_kasan: BUGGY: find_ie(SSID, ies, skb->len=100)
[  222.604333] rtw89_kasan: Will read 36 bytes past kmalloc end!
[  222.604341] ==================================================================
[  222.605840] BUG: KASAN: slab-out-of-bounds in find_ie_kern.constprop.0+0xe0/0x100 [rtw89_kasan_trigger]
[  222.607760] Read of size 1 at addr ffff88810e1ab864 by task insmod/1901

[  222.609503] CPU: 3 UID: 0 PID: 1901 Comm: insmod Tainted: G           O       6.12.115 #1
[  222.609515] Tainted: [O]=OOT_MODULE
[  222.609519] Hardware name: Linode Compute Instance/Standard PC (Q35 + ICH9, 2009), BIOS Not Specified
[  222.609525] Call Trace:
[  222.609529]  <TASK>
[  222.609533]  dump_stack_lvl+0x93/0xd0
[  222.609563]  print_report+0xce/0x660
[  222.609583]  ? find_ie_kern.constprop.0+0xe0/0x100 [rtw89_kasan_trigger]
[  222.609600]  ? __virt_addr_valid+0x208/0x410
[  222.609613]  ? find_ie_kern.constprop.0+0xe0/0x100 [rtw89_kasan_trigger]
[  222.609625]  kasan_report+0xe0/0x110
[  222.609637]  ? find_ie_kern.constprop.0+0xe0/0x100 [rtw89_kasan_trigger]
[  222.609651]  find_ie_kern.constprop.0+0xe0/0x100 [rtw89_kasan_trigger]
[  222.609665]  rtw89_kasan_init+0x1bf/0xff0 [rtw89_kasan_trigger]
[  222.609678]  ? __pfx_rtw89_kasan_init+0x10/0x10 [rtw89_kasan_trigger]
[  222.609690]  do_one_initcall+0xf2/0x4d0
[  222.609702]  ? __pfx_do_one_initcall+0x10/0x10
[  222.609713]  ? kasan_unpoison+0x27/0x60
[  222.609724]  do_init_module+0x233/0x6d0
[  222.609736]  load_module+0x5a71/0x6730
[  222.609745]  ? __vmalloc_node_range_noprof+0xc50/0x1170
[  222.609763]  ? __pfx_load_module+0x10/0x10
[  222.609856]  init_module_from_file+0xcc/0x130
[  222.609882]  idempotent_init_module+0x232/0x770
[  222.609917]  __x64_sys_finit_module+0xaf/0x100
[  222.609930]  do_syscall_64+0xc1/0x1e0
[  222.609946]  entry_SYSCALL_64_after_hwframe+0x77/0x7f
[  222.609962]  </TASK>

[  222.664801] Allocated by task 1901:
[  222.665605]  kasan_save_stack+0x33/0x60
[  222.665629]  kasan_save_track+0x14/0x30
[  222.665642]  __kasan_kmalloc+0x8f/0xa0
[  222.665654]  rtw89_kasan_init+0x58/0xff0 [rtw89_kasan_trigger]
[  222.665674]  do_one_initcall+0xf2/0x4d0
[  222.665688]  do_init_module+0x233/0x6d0
[  222.665700]  load_module+0x5a71/0x6730
[  222.665711]  init_module_from_file+0xcc/0x130
[  222.665722]  idempotent_init_module+0x232/0x770
[  222.665733]  __x64_sys_finit_module+0xaf/0x100
[  222.665744]  do_syscall_64+0xc1/0x1e0
[  222.665759]  entry_SYSCALL_64_after_hwframe+0x77/0x7f

[  222.666137] The buggy address belongs to the object at ffff88810e1ab800
                which belongs to the cache kmalloc-128 of size 128
[  222.668819] The buggy address is located 0 bytes to the right of
                allocated 100-byte region [ffff88810e1ab800, ffff88810e1ab864)

[  222.673603] Memory state around the buggy address:
[  222.674615]  ffff88810e1ab700: fa fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
[  222.676093]  ffff88810e1ab780: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
[  222.677636] >ffff88810e1ab800: 00 00 00 00 00 00 00 00 00 00 00 00 04 fc fc fc
[  222.679082]                                                        ^
[  222.680507]  ffff88810e1ab880: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
[  222.682106]  ffff88810e1ab900: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
[  222.683706] ==================================================================
[  222.685432] rtw89_kasan: BUGGY result: FOUND
[  222.685460] rtw89_kasan: === Done ===

==========================================================================
4. Notes
==========================================================================

- The 100-byte allocation (kmalloc-128 slab) holds the simulated skb data.
  KASAN correctly detects the read at byte 100 (0 bytes past the right edge).
- The CORRECT call (ie_region_len=64) finds nothing and stays in bounds.
- The BUGGY call (skb->len=100) scans 36 bytes past the IE region, hits
  the slab redzone, and KASAN fires.
- cfg80211_find_ie() is a production kernel API in net/wireless/scan.c
  (unmodified). The test module reimplements it identically to avoid a
  build dependency on cfg80211.ko; the logic (tag scan with 2-byte IE
  header) is byte-identical to the kernel's implementation.
- Anyone with a physical rtw89 adapter can reproduce this by broadcasting
  a crafted beacon with no SSID IE and total frame length > IE region.

Best regards,
Tanuj Sharma
ertanuj96@gmail.com
