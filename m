Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795431873;
	b=Tuh9sH1vb2u6+8nqjr/ukl7Nfc4P7R2FCq0pyfil8tKxdVyO6F6whUbTdzO8vBU/OqFd
	 ipPUM2eRc3pSmOAdPOAFwhP3ztOVgD2nk6nLzc6VtT+JOZI70iF5mD85g+VPmTNQMmfBZ
	 UyOye5v4AD2ScHoJ+L37k7zcRFq504FVlfDz24/p9obqCGFXyb/nkSRghd0vHjkstxgaz
	 VhOhVPoH+JGUoaEphltEoIHfZx7fpd3Ob5GE7TJtgKsgBsfHPR9He62D/q/SGwm3FH3np
	 VcnyiHH8ZrdRKSh4sb7E78T1jhObVVAaDTlC/OChVY0HVuFgiVeNOEnp0vHkPLCfNBg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795431873;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=GvGsxvmb9/V6ftdi1SXPdiM1HYZ4VihhjKY+1NaySvo=;
	b=ENYATTpBt06TwCX/a0N9L6ZhrxktNGWsoET6BSuET6WXXeex0kjq7plNT4PT7mKtzwHH
	 3HLpdj4p2iwyaq3VhasQCw/Qfh1qo3iwA418yR6yyV+CrDB17ROj/EPMGt0/vKD86FPSK
	 DX71DM89nLv5c5Dmb2EpF7tKP0GLmwbk+d3wYqIYKxxSdKQPHKYA8jrc44KGan72jnn1j
	 SRIfKPxL/IANB4Hv1cUznLTjbiyYRO85Kk1lqc/H6E/fCDdFq7oFd0Cx0gJEo09TNTtoa
	 ZObp1Bun8uY8MREC+2aDHmyEXjw3jJqa9wFqhhZlXAXqR+WKQxXII3nZgtvQGMm05VA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="ygRhx/l9";
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B059606A32E
	for <linux-wireless@vger.kernel.org>; Mon, 23 Nov 2026 11:04:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5B059606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ygRhx/l9
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-3863db981d4so4162318eec.0
        for <linux-wireless@vger.kernel.org>; Mon, 23 Nov 2026 03:04:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795431872; x=1796036672; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GvGsxvmb9/V6ftdi1SXPdiM1HYZ4VihhjKY+1NaySvo=;
        b=ygRhx/l9xMNmCkFDTWmY5q52d4lHqBgIQo9wRIoZxnyfFf2W8Yl5mZz/5pikwtXVGg
         01q4RrAUZnkFpYdUnZRUoO4h9jyKauNVm5vmdh37boX+xbNxkNk00tieKQQyZa50YNl8
         N/J6J3KZsaHSA3YCDv4ASYWopV+qccTegqisUCQ/Wns9L9CAQIxdK7NgJuFd5Et5EKfT
         EVjaMIrpoX2myidtQxS8JWUtdsR9IPflufv068xI7EaLg3uyVzLf+eqFRb3Xxw40249g
         hEfBY0oklX1B4YPJOCpuPCJ1+2CQijXKONVn33oLvEoQba8Z1VpeSwBNKoJhfNErr8IB
         8btw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795431872; x=1796036672;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GvGsxvmb9/V6ftdi1SXPdiM1HYZ4VihhjKY+1NaySvo=;
        b=tlHcn8omhl8nrfHWYyu1vUd13HrkWWgrRhBX6Yrz6XQvrgOG7AGIA+Lr8nhafVQW73
         9QpBJ/5rm0urdnwGaafXbvcjsmEBe+LDdyVqnDeg9ZJkS2nCTPs+sv1uSrvTwI+Xs/tr
         kPJaNHg7tOXEku0emn1m+ZMgAsOOoWd58TzLw5Ov16HUDovxBHhwk4XyKuJjKVRm3PfJ
         KJXDF/7co3iSDGIt1gNhS4bZcoVbfubJPbj0PvitBrkMMnNK9bOqE+VLfyoGXtUxO/rc
         moHVUs0qjxCgOLctBzsyG6kHpAHS7zU4ew6EMCdjYu5JsYObda4fD3M5ARyyn1vfUB4Y
         od+g==
X-Forwarded-Encrypted: i=1; AL+hErH53bUUdrIO2xE+kZXetCUxdttoEG9X9a5gMBZoBG037pEnP4cWOk6P617BJCPDVQ+0mM+p9hqK0vyRBBFyQA==@vger.kernel.org
X-Gm-Message-State: APuU4Z8jvLzYgoqPxViSNgo0UvMcJmWioQbIOKfxj5TfgltvulHITesc
	ThrzoX/e12k0c1p56I2wislSI1SiV/xVYDhxWN+PyfrhWiejy7sI42YleClNCsFuVPg=
X-Gm-Gg: AZFdTZdrFJozU7/my8JHFJIDZT6tYJabhH940T6/c0qN3bFYm8TdRgdd3SsWSUH+vq+
	XrRzVjSCydhUYwXqdyGjXdvIdi3+EYxsUzg4MStxDyUEqFAIDMcVeKLcjaPppSKj9QE2f/W2W7l
	duCTfYoKTUd2eVGCt5URVcjBWhSVlk6s9k9VfVlutxJx5onJbOqVKb/KzTBxmESf+i5rG1kUKI5
	byFr97U5Fb1x0BMR43F136wQJmt8+crR6PWLIVhn87pFmdyFnxFyvCwi1deCF7HdaYFXFxxB8bD
	QJM35qnHEQJSP2GWGd2vcbKQJJxB0epS39d9E/PYxuc/71N8Y9rSk3MemT2vvdvAvoQ/6K/futo
	iURZJFTllSw/4OJ/kITsjK9sm0Vg2041qDKSu00ejxus2adGRX/Eftq4cA0Ht6oRGeNt0OpKOUW
	KTyDuSzKtOZ6xaSH2tldxiQW/W4rNbtw7rmXp3/gxMOBE3Tq/+8CyKIlxY16xIbrowkHL8KFb8p
	fAdvyR2mKgpxo4Ooi2S9tRNx1GJHC2Jkj4lwNYo7aJuICc+FTKNYN9old1/JhCKABipThbh5xxP
	62zsM55kzDlG4AiuOn095rXH/nim4uDrnPsK+o1eQk6pGmFpH/P/Qxqw1/1mbXjcqBDWnAOf2lk
	1F8tRuGm3kUzG7T2ZqvQjbhQsuQ==
X-Received: by 2002:a05:7301:d81c:b0:386:b7d2:a279 with SMTP id 5a478bee46e88-386b7d2aba6mr937265eec.34.1795431872327;
        Mon, 23 Nov 2026 03:04:32 -0800 (PST)
Received: from ip-192-168-31-150.ap-south-1.compute.internal ([2409:40d2:2011:872e:6565:a2df:e6e1:88c7])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e7fc3sm31475136eec.8.2026.11.23.03.04.28
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 23 Nov 2026 03:04:31 -0800 (PST)
From: Tanuj Sharma <ertanuj96@gmail.com>
To: security@kernel.org
Cc: pkshih@realtek.com,
	kvalo@kernel.org,
	linux-wireless@vger.kernel.org,
	Tanuj Sharma <ertanuj96@gmail.com>
Subject: [SECURITY] wifi: rtlwifi: OOB read in P2P NoA IE parsing (OTA, spoofed BSSID)
Date: Mon, 23 Nov 2026 16:34:13 +0530
Message-ID: <20261123110419.76740-1-ertanuj96@gmail.com>
X-Mailer: git-send-email 2.54.0
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

Hi,

I am reporting an out-of-bounds read vulnerability in the rtlwifi WiFi driver
that is exploitable over-the-air by spoofing the BSSID of the victim's
associated access point and injecting crafted P2P NoA content in beacon frames.

Severity:    MEDIUM — over-the-air via spoofed BSSID, requires P2P mode
Attack:      Spoof the BSSID of the victim's associated AP and inject a
             crafted beacon with malicious P2P NoA content. Requires the
             victim to have P2P mode enabled (mac->p2p) and be associated
             to an AP (MAC80211_LINKED state).
Affected:    v5.4+ (all kernels with the incomplete P2P overflow fix)
Fixes:       8c55dedb795b ("rtlwifi: Fix potential overflow on P2P code")

Impact
------
This is an over-the-air kernel heap out-of-bounds read via WiFi:

  1. Memory safety violation: The bounds check uses only the low byte
     of a 16-bit length field, allowing the driver to bypass validation.
     Although P2P_MAX_NOA_NUM (2) caps the descriptor loop to 2
     iterations of 13 bytes each, the actual out-of-bounds access is
     ~26 bytes past the validated region — reading adjacent kernel heap
     data as NoA descriptor fields (count, duration, interval,
     start_time) which are stored into driver-internal structures.

  2. Denial of service: On kernels with KASAN enabled, the OOB access
     triggers an immediate kernel panic. On production kernels, the
     overread typically stays within skb tailroom or adjacent data,
     but corrupted NoA scheduling parameters from heap garbage can
     cause the driver to make incorrect power-save decisions.

  3. Preconditions: The victim must have P2P mode enabled (mac->p2p)
     and be associated to an AP (MAC80211_LINKED). P2P mode is not
     enabled by default on most Linux systems, limiting the attack
     surface. The attacker spoofs the BSSID of the associated AP —
     trivial since 802.11 management frames are unauthenticated even
     with WPA3.

  4. Widespread hardware: rtlwifi covers Realtek WiFi chipsets
     (RTL8192CE/CU, RTL8723BE, RTL8821AE, etc.) used in millions of
     laptops. All kernels v5.4+ are affected.

Root cause
----------
In rtl_p2p_noa_ie() and rtl_p2p_action_ie()
(drivers/net/wireless/realtek/rtlwifi/ps.c), the loop entry condition
and bounds check have two distinct bugs:

  while (ie + 1 < end) {
      noa_len = le16_to_cpu(*((__le16 *)&ie[1]));
      if (ie + 3 + ie[1] > end)
          return;

Bug 1 — insufficient loop guard:
  `ie + 1 < end` guarantees only 2 bytes are accessible (ie[0] and the
  byte at ie[1]). But `le16_to_cpu(*((__le16 *)&ie[1]))` reads a 16-bit
  value from ie[1] AND ie[2], requiring at least 3 accessible bytes.
  When exactly 2 bytes remain, ie[2] is a 1-byte OOB read.

Bug 2 — truncated length in bounds check:
  `ie[1]` is only the LOW byte of the 16-bit NoA length field. When the
  high byte (ie[2]) is nonzero, the actual length `noa_len` is much larger
  than `ie[1]`. The bounds check `ie + 3 + ie[1] > end` passes, but the
  subsequent code accesses NoA descriptors based on a noa_num computed
  from the full noa_len, reading past the validated boundary.

  Example: ie[1]=2, ie[2]=1 -> noa_len=258, but bounds check uses 2.

  Note: P2P_MAX_NOA_NUM (2) caps noa_num to at most 2 descriptors,
  limiting the actual overread to ~26 bytes rather than the full noa_len.
  The root cause (bypassed bounds check) is the same regardless.

Proposed patch
--------------
Change `ie + 1 < end` to `ie + 3 <= end` (require 3 bytes for the
type + 16-bit length), and use `noa_len` instead of `ie[1]` in the
bounds check. Applied to both rtl_p2p_noa_ie() and rtl_p2p_action_ie():

--- a/drivers/net/wireless/realtek/rtlwifi/ps.c
+++ b/drivers/net/wireless/realtek/rtlwifi/ps.c
@@ -719,9 +719,9 @@
 	ie = pos + index;
 	end = data + len;

-	while (ie + 1 < end) {
+	while (ie + 3 <= end) {
 		noa_len = le16_to_cpu(*((__le16 *)&ie[1]));
-		if (ie + 3 + ie[1] > end)
+		if (ie + 3 + noa_len > end)
 			return;

(Same change in rtl_p2p_action_ie() at line ~798)

Verification
============

Environment: kernel 6.12.115, KASAN generic, Linode VM (bare metal, no
WiFi hardware)

Why no production KASAN crash
-----------------------------
The production code path in rtlwifi is triggered ONLY when a physical
Realtek rtlwifi WiFi adapter (RTL8192CE/CU, RTL8723BE, RTL8821AE, etc.)
receives a beacon frame while in P2P mode (mac->p2p) and associated to
an AP (MAC80211_LINKED state). Our test environment is a bare Linode VM
with no WiFi hardware — the rtlwifi driver cannot be loaded without a
PCI/USB device match, and there is no way to inject 802.11 management
frames without a real wireless interface.

The root cause is mechanically verifiable from source:
  - `ie[1]` (1 byte, max 255) is used in the bounds check
  - `noa_len` (2 bytes, le16_to_cpu) is used for actual data access
  - When ie[2] > 0, noa_len > ie[1] and the bounds check is bypassed

Verification approach: kernel test module
-----------------------------------------
To produce a KASAN trace, we loaded a kernel test module on 6.12.115
(KASAN generic) that reproduces the exact vulnerable parsing logic from
rtl_p2p_noa_ie() with a crafted 10-byte kmalloc buffer containing a
P2P NoA sub-element with ie[1]=2, ie[2]=1 (noa_len=258). The buggy
bounds check passes (ie+3+2 <= end) but the NOA descriptor loop reads
up to ie[30], which is 21 bytes past the 10-byte buffer.

PoC — kernel test module source
--------------------------------
Build: make -C /lib/modules/$(uname -r)/build M=$PWD modules
Load:  insmod rtlwifi_kasan_trigger.ko
Check: dmesg | grep -A30 "BUG: KASAN"

--- rtlwifi_kasan_trigger.c ---
#include <linux/module.h>
#include <linux/kernel.h>
#include <linux/slab.h>

#define P2P_MAX_NOA_NUM 2

/* Reproduces the vulnerable parsing from rtl_p2p_noa_ie()
 * at drivers/net/wireless/realtek/rtlwifi/ps.c:720-760
 */
static noinline void noa_parse_buggy(u8 *data, unsigned int len)
{
	u8 *ie = data;
	u8 *end = data + len;
	u16 noa_len;
	int noa_num, i;

	while (ie + 1 < end) {
		noa_len = le16_to_cpu(*((__le16 *)&ie[1]));

		pr_info("rtlwifi_kasan: ie[1]=%u noa_len=%u\n",
			ie[1], noa_len);

		/* BUGGY: uses ie[1] (low byte only) */
		if (ie + 3 + ie[1] > end) {
			pr_info("rtlwifi_kasan: Bounds check rejected\n");
			return;
		}
		pr_info("rtlwifi_kasan: BUGGY bounds check PASSED "
			"(ie+3+%u <= end, but noa_len=%u)\n",
			(unsigned)ie[1], noa_len);

		if (ie[0] == 12) {
			noa_num = (noa_len - 2) / 13;
			if (noa_num > P2P_MAX_NOA_NUM)
				noa_num = P2P_MAX_NOA_NUM;

			pr_info("rtlwifi_kasan: NOA noa_num=%d\n", noa_num);
			pr_info("rtlwifi_kasan: ie[3]=0x%02x ie[4]=0x%02x\n",
				ie[3], ie[4]);

			for (i = 0; i < noa_num; i++) {
				int base = 5 + i * 13;
				volatile u8 v;
				int j;
				pr_info("rtlwifi_kasan: "
					"desc %d: ie[%d..%d]\n",
					i, base, base + 12);
				for (j = base; j <= base + 12; j++)
					v = ie[j]; /* KASAN fires here */
			}
		}
		break;
	}
}

static int __init rtlwifi_kasan_init(void)
{
	int buf_len = 10;
	u8 *buf;

	pr_info("rtlwifi_kasan: === P2P NoA OOB KASAN Trigger ===\n");

	buf = kmalloc(buf_len, GFP_KERNEL);
	if (!buf)
		return -ENOMEM;
	memset(buf, 0x41, buf_len);

	buf[0] = 12;  /* NOA attribute ID */
	buf[1] = 2;   /* low byte of length */
	buf[2] = 1;   /* high byte -> noa_len = 258 */
	buf[3] = 0;   /* noa_index */
	buf[4] = 0;   /* ctwindow */

	pr_info("rtlwifi_kasan: buf=%px len=%d\n", buf, buf_len);
	pr_info("rtlwifi_kasan: ie[1]=%u (low byte), "
		"noa_len=%u (full 16-bit)\n", buf[1],
		le16_to_cpu(*((__le16 *)&buf[1])));

	noa_parse_buggy(buf, buf_len);

	kfree(buf);
	pr_info("rtlwifi_kasan: === Done ===\n");
	return 0;
}

static void __exit rtlwifi_kasan_exit(void)
{
	pr_info("rtlwifi_kasan: Module unloaded\n");
}

module_init(rtlwifi_kasan_init);
module_exit(rtlwifi_kasan_exit);
MODULE_LICENSE("GPL");
MODULE_DESCRIPTION("rtlwifi P2P NoA OOB KASAN trigger - defensive research");
--- end rtlwifi_kasan_trigger.c ---

KASAN output (kernel 6.12.115, insmod rtlwifi_kasan_trigger.ko)
----------------------------------------------------------------
[  150.768871] rtlwifi_kasan_trigger: loading out-of-tree module taints kernel.
[  150.770760] rtlwifi_kasan: === P2P NoA OOB KASAN Trigger ===
[  150.770777] rtlwifi_kasan: buf=ffff88811174bf40 len=10
[  150.770788] rtlwifi_kasan: ie[1]=2 (low byte), noa_len=258 (full 16-bit)
[  150.770846] rtlwifi_kasan: ie[1]=2 noa_len=258
[  150.770856] rtlwifi_kasan: BUGGY bounds check PASSED (ie+3+2 <= end, but noa_len=258)
[  150.770866] rtlwifi_kasan: NOA noa_num=2
[  150.770876] rtlwifi_kasan: ie[3]=0x00 ie[4]=0x00
[  150.770888] rtlwifi_kasan: desc 0: ie[5..17]
[  150.770902] ==================================================================
[  150.772854] BUG: KASAN: slab-out-of-bounds in noa_parse_buggy.constprop.0+0x3d1/0x430 [rtlwifi_kasan_trigger]
[  150.775386] Read of size 1 at addr ffff88811174bf4a by task insmod/1513

[  150.777694] CPU: 1 UID: 0 PID: 1513 Comm: insmod Tainted: G           O       6.12.115 #1
[  150.777707] Tainted: [O]=OOT_MODULE
[  150.777711] Hardware name: Linode Compute Instance/Standard PC (Q35 + ICH9, 2009), BIOS Not Specified
[  150.777717] Call Trace:
[  150.777722]  <TASK>
[  150.777726]  dump_stack_lvl+0x93/0xd0
[  150.777753]  print_report+0xce/0x660
[  150.777769]  ? noa_parse_buggy.constprop.0+0x3d1/0x430 [rtlwifi_kasan_trigger]
[  150.777782]  ? __virt_addr_valid+0x208/0x410
[  150.777793]  ? noa_parse_buggy.constprop.0+0x3d1/0x430 [rtlwifi_kasan_trigger]
[  150.777806]  kasan_report+0xe0/0x110
[  150.777818]  ? noa_parse_buggy.constprop.0+0x3d1/0x430 [rtlwifi_kasan_trigger]
[  150.777832]  noa_parse_buggy.constprop.0+0x3d1/0x430 [rtlwifi_kasan_trigger]
[  150.777846]  ? __pfx_noa_parse_buggy.constprop.0+0x10/0x10 [rtlwifi_kasan_trigger]
[  150.777860]  rtlwifi_kasan_init+0x1d1/0xff0 [rtlwifi_kasan_trigger]
[  150.777873]  ? __pfx_rtlwifi_kasan_init+0x10/0x10 [rtlwifi_kasan_trigger]
[  150.777885]  do_one_initcall+0xf2/0x4d0
[  150.778108]  do_init_module+0x233/0x6d0
[  150.778120]  load_module+0x5a71/0x6730
[  150.778232]  init_module_from_file+0xcc/0x130
[  150.778266]  idempotent_init_module+0x232/0x770
[  150.778299]  __x64_sys_finit_module+0xaf/0x100
[  150.778310]  do_syscall_64+0xc1/0x1e0
[  150.778350]  entry_SYSCALL_64_after_hwframe+0x77/0x7f
[  150.778421]  </TASK>

[  150.835327] Allocated by task 1513:
[  150.836172]  kasan_save_stack+0x33/0x60
[  150.836196]  kasan_save_track+0x14/0x30
[  150.836209]  __kasan_kmalloc+0x8f/0xa0
[  150.836221]  rtlwifi_kasan_init+0x4c/0xff0 [rtlwifi_kasan_trigger]
[  150.836240]  do_one_initcall+0xf2/0x4d0
[  150.836253]  do_init_module+0x233/0x6d0
[  150.836265]  load_module+0x5a71/0x6730
[  150.836276]  init_module_from_file+0xcc/0x130
[  150.836287]  idempotent_init_module+0x232/0x770
[  150.836298]  __x64_sys_finit_module+0xaf/0x100
[  150.836309]  do_syscall_64+0xc1/0x1e0
[  150.836324]  entry_SYSCALL_64_after_hwframe+0x77/0x7f

[  150.836719] The buggy address belongs to the object at ffff88811174bf40
                which belongs to the cache kmalloc-16 of size 16
[  150.839809] The buggy address is located 0 bytes to the right of
                allocated 10-byte region [ffff88811174bf40, ffff88811174bf4a)

[  150.844879] Memory state around the buggy address:
[  150.845862]  ffff88811174be00: fa fb fc fc fa fb fc fc fa fb fc fc fa fb fc fc
[  150.847361]  ffff88811174be80: fa fb fc fc fa fb fc fc 00 03 fc fc 00 04 fc fc
[  150.848830] >ffff88811174bf00: 00 07 fc fc 00 04 fc fc 00 02 fc fc fa fb fc fc
[  150.850312]                                               ^
[  150.851457]  ffff88811174bf80: fa fb fc fc fa fb fc fc fa fb fc fc fa fb fc fc
[  150.852988]  ffff88811174c000: fa fb fb fb fc fc fc fc fa fb fb fb fc fc fc fc
[  150.854510] ==================================================================
[  150.856225] rtlwifi_kasan: desc 1: ie[18..30]
[  150.856241] rtlwifi_kasan: === Done ===

Notes
-----
- kmalloc(10) → kmalloc-16 slab. KASAN fires at byte 10 (0 bytes past
  the right edge of the allocated 10-byte region).
- The buggy bounds check passes because ie+3+ie[1]=ie+3+2=ie+5 <= end=ie+10.
- But noa_len=258, so noa_num=(258-2)/13=19, capped to P2P_MAX_NOA_NUM=2.
- Descriptor 0 reads ie[5..17], descriptor 1 reads ie[18..30] — 21 bytes OOB.
- The vulnerable code is in the unmodified production driver at
  drivers/net/wireless/realtek/rtlwifi/ps.c.

I have not shared this finding publicly. Happy to work with the WiFi
maintainers on the patch if any changes are needed.

Best regards,
Tanuj Sharma
ertanuj96@gmail.com
