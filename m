Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=173.249.8.110
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794571415;
	b=x7EDJy7VwdRWEJob5xRExKceKt3M/yTJZ/Lu7URozB46+am7G58xrVDjxrM8bBFIamfz
	 1JJyFqG4jKTAKONsLGKCKZYR0niLWPzut1vimIQoo7NmMm0RjLcgdmaaOGEF4foKH4SbE
	 PRdZvn4Ui2uajF3wAoRHUw8s0h6Hnlc9ve/CTG+VAvO7nFpXx34YiTiEuW8dWSkwh+mwS
	 nG0lFOt6/JCHADvnM1AuzaH+QDQrMtYezL1z90S/lCqoNQzI46vgF/INBH7DxRvuPQwlX
	 0bE0P4DVhuXbg/xMGIxrfiT+irRDvtRMA4zOh5AcaVcq7oLoZUvtTDzdmGU5+V5LH1Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794571415;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=EmvKM7P0z4AgDWd2TYZO47QnXmVaXNutw5jqNJgTHfw=;
	b=ZMbTOu3FkPb5YFJwVPeLSkA49JOLOqAqgqCMSrURQrkN5S8V51IrMFlwBaAlMPSVPpDI
	 Htd9s45VefwGvDuV8UiyUZmnU6kZTJULyOJgA//WibXtXGBIlvAoOzwq431rCltp6VM0w
	 wACuq0bBVjP2gfE3WnEdCRNGd764AxH0KclWPssk0BgrKlmhmGUvmjIzhPF447TlbjUZQ
	 w7mN0VDS6PdrNjRBbVpxhg58cTbN+f4FwjrANEIl0xWg2X/eEdoBJKy+3OpFSVnuf8IjI
	 /LLaaPidkHL5yx7AVR1Erfa39cEKIhPxz3O00EEpjVUR9R37uq7/sfObsHpqgCDhjBA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=fernandotapia.eu;
	spf=pass smtp.mailfrom=fernandotapia.eu;
	dkim=pass header.d=fernandotapia.eu header.i=@fernandotapia.eu header.a=rsa-sha256 header.s=mail header.b=dKlnCSne;
	arc=none smtp.remote-ip=173.249.8.110
Received: from mail.fernandotapia.eu (mail.fernandotapia.eu [173.249.8.110])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1D32606A32D
	for <linux-wireless@vger.kernel.org>; Fri, 13 Nov 2026 12:03:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D1D32606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fernandotapia.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fernandotapia.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=fernandotapia.eu header.i=@fernandotapia.eu header.a=rsa-sha256 header.s=mail header.b=dKlnCSne
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=fernandotapia.eu; s=mail; h=Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=EmvKM7P0z4AgDWd2TYZO47QnXmVaXNutw5jqNJgTHfw=; b=dKlnCSnet/UN2TzGAWJycMjBs7
	6VX/bIv8prmmd9LktkdXGUCm6McgrzxAjhvj7mQNgDynNgqWSKfPFj5XSCbrgnphXpDoKV3sLoZLD
	VSC+u73GFEtQvuBTNmZx5xw7OJ4SD9N8RL68JKMvgAnbx1W2bDcQsFEfKBxmJB0oiZE1NeQFKumUr
	HRLY2/I//C+VzJPUlsRyNIcLwH+A4N11KvNvdqcKAalwaikGiXuhEwHz9o1EA0l7+wHCVmKPo/rd7
	nblInY6gtA/+REIpMi2q1cwhzc2ODW2Z9b+FKP3VxCTHfgW+NiyQe929X4CiVrSi6Qh2FEInU1hiJ
	wt1YGfyw==;
Received: from [86.127.250.161] (helo=workbench.lan)
	by espabilao.fernandotapia.eu with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.97)
	(envelope-from <fernan.tapia@fernandotapia.eu>)
	id 1xRq06-0000000FD9g-1fk6;
	Fri, 13 Nov 2026 13:03:26 +0100
From: Fernando Tapia <fernan.tapia@fernandotapia.eu>
To: ath11k@lists.infradead.org
Cc: jjohnson@kernel.org,
	linux-wireless@vger.kernel.org
Subject: [PATCH ath-next] wifi: ath11k: don't create a duplicate peer on the same pdev
Date: Fri, 13 Nov 2026 13:03:25 +0100
Message-ID: <20261113120325.2913-1-fernan.tapia@fernandotapia.eu>
X-Mailer: git-send-email 2.43.0
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

ath11k_peer_create() accepts an address that is already a peer on
another vdev, assuming the station is moving to another band. That holds
when the old vdev is on another pdev. When both vdevs are on the same
pdev, for example two AP interfaces on one 2.4 GHz radio, a station that
moves between the two BSSes is authenticated on the new one while hostapd
still has it on the old one. The WMI_PEER_CREATE for the second vdev then
makes the IPQ8074 firmware (WLAN.HK.2.9.0.1-02146) assert:

  wal_peer_control.c:2904 Assertion is_graceful_to_handle failed

followed by "failed to find peer ... after creation" on the host, and on
AHB the whole SoC reboots. Tuya devices in pairing mode, which try both
BSSes of a radio within a second, cause a reboot loop.

Refuse the peer with -EBUSY while the address is still a peer on another
vdev of the same pdev, without sending the command to the firmware. The
station add fails as it already does after the assert, hostapd rejects
that authentication, and the client succeeds on a retry once its old
station is removed.

Tested on a Xiaomi AX3600 (OpenWrt 25.12.5, kernel 6.12.94 with ath11k
backported from 6.18.26) for 8 days. A smart plug moved between the two
SSIDs of the 2.4 GHz radio in both directions, the sequence that had
rebooted the router 8 times before: the new warning appears, the client
connects on the retry about 4 s later, no firmware assert, no reboot.

Link: https://github.com/openwrt/openwrt/issues/24864
Tested-on: IPQ8074 hw2.0 WLAN.HK.2.9.0.1-02146-QCAHKSWPL_SILICONZ-1
Assisted-by: Claude:claude-sonnet-5-5
Signed-off-by: Fernando Tapia <fernan.tapia@fernandotapia.eu>
---
 drivers/net/wireless/ath/ath11k/peer.c | 31 ++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/drivers/net/wireless/ath/ath11k/peer.c b/drivers/net/wireless/ath/ath11k/peer.c
index b30a90698..95379930d 100644
--- a/drivers/net/wireless/ath/ath11k/peer.c
+++ b/drivers/net/wireless/ath/ath11k/peer.c
@@ -367,11 +367,25 @@ static int ath11k_wait_for_peer_created(struct ath11k *ar, int vdev_id, const u8
 	return ath11k_wait_for_peer_common(ar->ab, vdev_id, addr, true);
 }
 
+static bool ath11k_peer_vdev_on_pdev(struct ath11k *ar, u32 vdev_id)
+{
+	struct ath11k_vif *arvif;
+
+	lockdep_assert_held(&ar->conf_mutex);
+
+	list_for_each_entry(arvif, &ar->arvifs, list)
+		if (arvif->vdev_id == vdev_id)
+			return true;
+
+	return false;
+}
+
 int ath11k_peer_create(struct ath11k *ar, struct ath11k_vif *arvif,
 		       struct ieee80211_sta *sta, struct peer_create_params *param)
 {
 	struct ath11k_peer *peer;
 	struct ath11k_sta *arsta;
+	int old_vdev_id;
 	int ret, fbret;
 
 	lockdep_assert_held(&ar->conf_mutex);
@@ -392,6 +406,23 @@ int ath11k_peer_create(struct ath11k *ar, struct ath11k_vif *arvif,
 			return -EINVAL;
 		}
 
+		/* The firmware asserts (wal_peer_control.c
+		 * "is_graceful_to_handle") when a peer is created for an
+		 * address that is still a peer on another vdev of the same
+		 * pdev. This happens when a station moves between two BSSes
+		 * of one radio before its old station is removed. Refuse the
+		 * new peer until the old one is gone.
+		 */
+		if (ath11k_peer_vdev_on_pdev(ar, peer->vdev_id)) {
+			old_vdev_id = peer->vdev_id;
+			spin_unlock_bh(&ar->ab->base_lock);
+			mutex_unlock(&ar->ab->tbl_mtx_lock);
+			ath11k_warn(ar->ab,
+				    "peer %pM still exists on vdev %d, not creating it on vdev %u\n",
+				    param->peer_addr, old_vdev_id, param->vdev_id);
+			return -EBUSY;
+		}
+
 		/* Assume sta is transitioning to another band.
 		 * Remove here the peer from rhash.
 		 */
-- 
2.43.0

