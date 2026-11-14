Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=77.75.76.210
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794647387;
	b=VDAHREWeXtSky3zcqY+55FAY8qCuLhdNSXrLORUHxbFFfTOlh3yF1NMtOlaf1jYrXOqB
	 P2TJewLoemY6yRhriHna3LlL0No1YADfzCmgU6AICCClIulJ0sXPox/L58Rd6P0adHyCg
	 xYHDfrFQJpa8WgRb/xmHDceP0NNML/++wWxSklldUxuZ/ExMsv2SuGBrvpal/IA7IovEJ
	 JfI039YDVfBPjhv8utbN8uCS0zlVaiDrSUiQ4TuBzxa4XSE7opsqt9Itt82cbj5/58mYS
	 DTSqJEowvUKnHr2ydck6j2Evyl4xBUon38wWEBJ3xdiiiC8CuAAb/sDANJaMtKy8UGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794647387;
	h=DMARC-Filter:Received:DKIM-Signature:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Z1m+wCqfRc6yC2z02XkTNzfDCbRaUtJzcrHeI4jswJU=;
	b=WWr1dYW2IJfVZlZhuX/s9kuKTEM0AoC8hbA6SbddJ800ZkJRLxodQEwIFe0gI35z9Rc8
	 ZKBabW//TYfwfAPtbksDBLzFvaCZ1TkfRbXFuS+hYpGlRgb39grR8EULf1cluefaUhOhE
	 t2sP8CmYkCed2gV4egayDVKTznMBGGIak5D7FR7QQAvhm+eaYxne+Ef3HV5jNlJ7E+qaP
	 o5gx1LoRvB15UOTNyP5Ny3aEl/nRhtV7/OYRq2UWvO9e8ZCu3PqYAaahOq1StxdfvmrbJ
	 nMO7sIDBIW5/6LM8Er4drcCxCt3bDKgKtJ/8DFZn2UYecO8IYaWms9NZQa6HN31/b8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=email.cz;
	spf=pass smtp.mailfrom=email.cz;
	dkim=pass header.d=email.cz header.i=@email.cz header.a=rsa-sha256 header.s=szn1 header.b=XasKCF7t;
	arc=none smtp.remote-ip=77.75.76.210
Received: from mxd.seznam.cz (mxd.seznam.cz [77.75.76.210])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB5CB606A32D
	for <linux-wireless@vger.kernel.org>; Sat, 14 Nov 2026 09:09:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DB5CB606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=email.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=email.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=email.cz header.i=@email.cz header.a=rsa-sha256 header.s=szn1 header.b=XasKCF7t
Received: from email.seznam.cz
	by smtpc-mxd-5f46658f7f-chpkt
	(smtpc-mxd-5f46658f7f-chpkt [2a02:598:128:8a00::1000:a3b])
	id 089f44fdf66bf6570811cae5;
	Sat, 14 Nov 2026 10:08:58 +0100 (CET)
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed; d=email.cz; s=szn1;
	t=1794647338; bh=Z1m+wCqfRc6yC2z02XkTNzfDCbRaUtJzcrHeI4jswJU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding;
	b=XasKCF7tsDXHOXsufmswD2y9oE4QDeEpfEwXdoYK2gs3sOhHnC3IkwpuMKWO0ClGj
	 JP5lFQOxMcIlQ/55LnJJRIurmJUR4Xiqjnwmndrn+BP+R5BjWWOug9mdVodqKMI5GQ
	 w1hyrN6uUs88HePsH9hkquPPoFr6KyeZNTopmXqA/gQEi7JRBaI0hQrBZ/urnr9Z2d
	 VK3peeiVMmuefyDH+BmBh9rHnOsMqZiE/twrTKXIv9k091FhaOY2rqcJxlGbqujugq
	 xTp10Ys2slNCiQd6kiv2VV3DvEW0j+TK3PrOo2V08SwMZ5G99Sn2l9Fqlh1sACwKv9
	 qinwOpFHJ99Cg==
Received: from localhost.localdomain (184-143.ktuo.cz [82.144.143.184])
	by smtpd-relay-5bf55fdf87-n6z6s (szn-email-smtpd/2.0.97) with ESMTPA
	id 706da668-fb19-4e8c-ba24-b3755945c05a;
	Sat, 14 Nov 2026 10:08:03 +0100
From: Tomas Paukrt <tomaspaukrt@email.cz>
To: jjohnson@kernel.org
Cc: linux-wireless@vger.kernel.org,
	ath10k@lists.infradead.org,
	Tomas Paukrt <tomaspaukrt@email.cz>
Subject: [PATCH ath-next 3/6] wifi: ath10k: usb: start the firmware only once
Date: Sat, 14 Nov 2026 10:07:34 +0100
Message-ID: <20261114090737.64348-4-tomaspaukrt@email.cz>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261114090737.64348-1-tomaspaukrt@email.cz>
References: <20261114090737.64348-1-tomaspaukrt@email.cz>
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

The ath10k core starts the firmware during the registration to read the
capabilities and again whenever the interface is brought up. A QCA9377
USB target cannot do that. The running firmware does not accept BMI
commands and only a cold reset brings the target back to the boot
loader, but the reset makes it leave the bus and enumerate again as a
new device. A warm reset keeps it on the bus, but the OTP program hangs
when it is executed again.

Add start_once to struct ath10k_bus_params. The firmware started during
the registration is then kept running until the device is unregistered.
It is not suspended before it is stopped, because a suspended target
ignores the reset.

Set start_once for USB and reset the target in power_down. Wait for the
disconnect, otherwise a driver loaded right after the unload binds to
the stale device and fails to probe it. As the firmware cannot be
restarted in place, reset the target also on a firmware crash and when
the interface fails to start, and let the device be probed again. The
same applies to a failure during the registration. Refuse the UTF mode
for the same reason and reset the target on shutdown, so that the
firmware does not keep running across a reboot.

Tested-on: QCA9377 hw1.1 USB 0.0.0.111
Signed-off-by: Tomas Paukrt <tomaspaukrt@email.cz>
---
 drivers/net/wireless/ath/ath10k/core.c     | 35 +++++++++++++-
 drivers/net/wireless/ath/ath10k/core.h     |  5 ++
 drivers/net/wireless/ath/ath10k/hw.h       |  1 +
 drivers/net/wireless/ath/ath10k/mac.c      | 12 +++--
 drivers/net/wireless/ath/ath10k/testmode.c |  6 +++
 drivers/net/wireless/ath/ath10k/usb.c      | 55 ++++++++++++++++++++++
 drivers/net/wireless/ath/ath10k/usb.h      |  1 +
 7 files changed, 111 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
index 7c2939cbde5f..0741b7ee073c 100644
--- a/drivers/net/wireless/ath/ath10k/core.c
+++ b/drivers/net/wireless/ath/ath10k/core.c
@@ -2603,6 +2603,12 @@ static void ath10k_core_restart(struct work_struct *work)
 
 	switch (ar->state) {
 	case ATH10K_STATE_ON:
+		if (ar->bus_param.start_once) {
+			ar->state = ATH10K_STATE_WEDGED;
+			ath10k_warn(ar, "firmware cannot be restarted, resetting the target\n");
+			ath10k_hif_power_down(ar);
+			break;
+		}
 		ar->state = ATH10K_STATE_RESTARTING;
 		ath10k_halt(ar);
 		ath10k_scan_finish(ar);
@@ -2982,6 +2988,10 @@ int ath10k_core_start(struct ath10k *ar, enum ath10k_firmware_mode mode,
 
 	lockdep_assert_held(&ar->conf_mutex);
 
+	/* the firmware started during the registration is still running */
+	if (ar->bus_param.start_once && ar->state != ATH10K_STATE_OFF)
+		return 0;
+
 	clear_bit(ATH10K_FLAG_CRASH_FLUSH, &ar->dev_flags);
 
 	ar->running_fw = fw;
@@ -3333,7 +3343,8 @@ void ath10k_core_stop(struct ath10k *ar)
 
 	/* try to suspend target */
 	if (ar->state != ATH10K_STATE_RESTARTING &&
-	    ar->state != ATH10K_STATE_UTF)
+	    ar->state != ATH10K_STATE_UTF &&
+	    !ar->bus_param.start_once)
 		ath10k_wait_for_suspend(ar, WMI_PDEV_SUSPEND_AND_DISABLE_INTR);
 
 	ath10k_hif_stop(ar);
@@ -3345,6 +3356,18 @@ void ath10k_core_stop(struct ath10k *ar)
 }
 EXPORT_SYMBOL(ath10k_core_stop);
 
+static void ath10k_core_stop_once(struct ath10k *ar)
+{
+	if (!ar->bus_param.start_once)
+		return;
+
+	mutex_lock(&ar->conf_mutex);
+	ath10k_core_stop(ar);
+	mutex_unlock(&ar->conf_mutex);
+
+	ath10k_hif_power_down(ar);
+}
+
 /* mac80211 manages fw/hw initialization through start/stop hooks. However in
  * order to know what hw capabilities should be advertised to mac80211 it is
  * necessary to load the firmware (and tear it down immediately since start
@@ -3479,6 +3502,13 @@ static int ath10k_core_probe_fw(struct ath10k *ar)
 	}
 
 	ath10k_debug_print_boot_info(ar);
+
+	/* keep the firmware running if it cannot be started a second time */
+	if (ar->bus_param.start_once) {
+		mutex_unlock(&ar->conf_mutex);
+		return 0;
+	}
+
 	ath10k_core_stop(ar);
 
 	mutex_unlock(&ar->conf_mutex);
@@ -3564,6 +3594,7 @@ static void ath10k_core_register_work(struct work_struct *work)
 err_unregister_mac:
 	ath10k_mac_unregister(ar);
 err_release_fw:
+	ath10k_core_stop_once(ar);
 	ath10k_core_free_firmware_files(ar);
 err:
 	/* TODO: It's probably a good idea to release device from the driver
@@ -3605,6 +3636,8 @@ void ath10k_core_unregister(struct ath10k *ar)
 	 */
 	ath10k_mac_unregister(ar);
 
+	ath10k_core_stop_once(ar);
+
 	ath10k_testmode_destroy(ar);
 
 	ath10k_core_free_firmware_files(ar);
diff --git a/drivers/net/wireless/ath/ath10k/core.h b/drivers/net/wireless/ath/ath10k/core.h
index dfee432615eb..7a09244bb3f2 100644
--- a/drivers/net/wireless/ath/ath10k/core.h
+++ b/drivers/net/wireless/ath/ath10k/core.h
@@ -1006,6 +1006,11 @@ struct ath10k_bus_params {
 	enum ath10k_dev_type dev_type;
 	bool link_can_suspend;
 	bool hl_msdu_ids;
+
+	/* The target cannot be reset without leaving the bus, so the firmware
+	 * is kept running from the registration to the unregistration.
+	 */
+	bool start_once;
 };
 
 struct ath10k {
diff --git a/drivers/net/wireless/ath/ath10k/hw.h b/drivers/net/wireless/ath/ath10k/hw.h
index cd468b24bd33..6196a11b77d1 100644
--- a/drivers/net/wireless/ath/ath10k/hw.h
+++ b/drivers/net/wireless/ath/ath10k/hw.h
@@ -900,6 +900,7 @@ ath10k_is_rssi_enable(struct ath10k_hw_params *hw,
 #define SOC_RESET_CONTROL_SI0_RST_MASK		ar->regs->soc_reset_control_si0_rst_mask
 #define SOC_RESET_CONTROL_CE_RST_MASK		ar->regs->soc_reset_control_ce_rst_mask
 #define SOC_RESET_CONTROL_CPU_WARM_RST_MASK	0x00000040
+#define SOC_RESET_CONTROL_COLD_RST_MASK		0x00000100
 #define SOC_CPU_CLOCK_OFFSET			0x00000020
 #define SOC_CPU_CLOCK_STANDARD_LSB		0
 #define SOC_CPU_CLOCK_STANDARD_MASK		0x00000003
diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index 8e604697d6c2..65452eb258b5 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -4819,8 +4819,12 @@ void ath10k_halt(struct ath10k *ar)
 	ath10k_scan_finish(ar);
 	ath10k_peer_cleanup_all(ar);
 	ath10k_stop_radar_confirmation(ar);
-	ath10k_core_stop(ar);
-	ath10k_hif_power_down(ar);
+
+	/* stop the firmware unless it can be started only once */
+	if (!ar->bus_param.start_once) {
+		ath10k_core_stop(ar);
+		ath10k_hif_power_down(ar);
+	}
 
 	spin_lock_bh(&ar->data_lock);
 	list_for_each_entry(arvif, &ar->arvifs, list)
@@ -5381,7 +5385,9 @@ static int ath10k_start(struct ieee80211_hw *hw)
 	return 0;
 
 err_core_stop:
-	ath10k_core_stop(ar);
+	/* stop the firmware unless it can be started only once */
+	if (!ar->bus_param.start_once)
+		ath10k_core_stop(ar);
 
 err_power_down:
 	ath10k_hif_power_down(ar);
diff --git a/drivers/net/wireless/ath/ath10k/testmode.c b/drivers/net/wireless/ath/ath10k/testmode.c
index 282ae6e20c8e..10ebf3c1ccbd 100644
--- a/drivers/net/wireless/ath/ath10k/testmode.c
+++ b/drivers/net/wireless/ath/ath10k/testmode.c
@@ -353,6 +353,12 @@ static int ath10k_tm_cmd_utf_start(struct ath10k *ar, struct nlattr *tb[])
 		goto err;
 	}
 
+	/* the running firmware cannot be replaced by the UTF firmware */
+	if (ar->bus_param.start_once) {
+		ret = -EOPNOTSUPP;
+		goto err;
+	}
+
 	if (WARN_ON(ar->testmode.utf_mode_fw.fw_file.firmware != NULL)) {
 		/* utf image is already downloaded, it shouldn't be */
 		ret = -EEXIST;
diff --git a/drivers/net/wireless/ath/ath10k/usb.c b/drivers/net/wireless/ath/ath10k/usb.c
index c1ba30a1437d..71de38111c5e 100644
--- a/drivers/net/wireless/ath/ath10k/usb.c
+++ b/drivers/net/wireless/ath/ath10k/usb.c
@@ -707,9 +707,46 @@ static int ath10k_usb_hif_power_up(struct ath10k *ar,
 	return 0;
 }
 
+/* The running firmware does not accept BMI commands, so the target has to
+ * be cold reset before it can be probed again. The reset makes it leave
+ * the bus and enumerate as a new device.
+ */
+static void ath10k_usb_reset_target(struct ath10k *ar, bool wait)
+{
+	struct ath10k_usb *ar_usb = ath10k_usb_priv(ar);
+	__le32 val = cpu_to_le32(SOC_RESET_CONTROL_COLD_RST_MASK);
+	unsigned long timeout;
+	int ret;
+
+	if (!ar->bmi.done_sent || ar_usb->udev->state == USB_STATE_NOTATTACHED)
+		return;
+
+	ret = ath10k_usb_hif_diag_write(ar, RTC_SOC_BASE_ADDRESS +
+					SOC_RESET_CONTROL_ADDRESS,
+					&val, sizeof(val));
+	if (ret) {
+		ath10k_warn(ar, "failed to reset the target: %d\n", ret);
+		return;
+	}
+
+	if (!wait)
+		return;
+
+	/* wait for the disconnect, the stale device must not be probed again */
+	timeout = jiffies + msecs_to_jiffies(ATH10K_USB_RESET_TIMEOUT_MS);
+	while (ar_usb->udev->state != USB_STATE_NOTATTACHED) {
+		if (time_after(jiffies, timeout)) {
+			ath10k_warn(ar, "target did not leave the bus after the reset\n");
+			return;
+		}
+		msleep(20);
+	}
+}
+
 static void ath10k_usb_hif_power_down(struct ath10k *ar)
 {
 	ath10k_usb_flush_all(ar);
+	ath10k_usb_reset_target(ar, true);
 }
 
 #ifdef CONFIG_PM
@@ -1037,6 +1074,7 @@ static int ath10k_usb_probe(struct usb_interface *interface,
 	/* TODO: don't know yet how to get chip_id with USB */
 	bus_params.chip_id = 0;
 	bus_params.hl_msdu_ids = true;
+	bus_params.start_once = true;
 	ret = ath10k_core_register(ar, &bus_params);
 	if (ret) {
 		ath10k_warn(ar, "failed to register driver core: %d\n", ret);
@@ -1071,6 +1109,22 @@ static void ath10k_usb_disconnect(struct usb_interface *interface)
 	ath10k_core_destroy(ar_usb->ar);
 }
 
+static void ath10k_usb_shutdown(struct usb_interface *interface)
+{
+	struct ath10k_usb *ar_usb = usb_get_intfdata(interface);
+	struct ath10k *ar;
+
+	if (!ar_usb)
+		return;
+
+	ar = ar_usb->ar;
+
+	/* a firmware left running would fail the probe after the reboot */
+	mutex_lock(&ar->conf_mutex);
+	ath10k_usb_reset_target(ar, false);
+	mutex_unlock(&ar->conf_mutex);
+}
+
 #ifdef CONFIG_PM
 
 static int ath10k_usb_pm_suspend(struct usb_interface *interface,
@@ -1114,6 +1168,7 @@ static struct usb_driver ath10k_usb_driver = {
 	.suspend = ath10k_usb_pm_suspend,
 	.resume = ath10k_usb_pm_resume,
 	.disconnect = ath10k_usb_disconnect,
+	.shutdown = ath10k_usb_shutdown,
 	.id_table = ath10k_usb_ids,
 	.supports_autosuspend = true,
 	.soft_unbind = 1,
diff --git a/drivers/net/wireless/ath/ath10k/usb.h b/drivers/net/wireless/ath/ath10k/usb.h
index 517afbd73764..47ed1bad81a6 100644
--- a/drivers/net/wireless/ath/ath10k/usb.h
+++ b/drivers/net/wireless/ath/ath10k/usb.h
@@ -13,6 +13,7 @@
 #define TX_URB_COUNT               32
 #define RX_URB_COUNT               32
 #define ATH10K_USB_RX_BUFFER_SIZE  4096
+#define ATH10K_USB_RESET_TIMEOUT_MS 3000
 
 #define ATH10K_USB_PIPE_INVALID ATH10K_USB_PIPE_MAX
 
-- 
2.43.0

